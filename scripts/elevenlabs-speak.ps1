# Usage: scripts/elevenlabs-speak.ps1 <text-file> <out.mp3>
param([string]$TextFile, [string]$OutFile)
Set-PSDebug -Off
$ErrorActionPreference = 'Stop'
$BodyFile = $null
$ResponseFile = $null
try {
    if (-not $TextFile -or -not $OutFile -or $args.Count -gt 0) { throw 'Use this script with a text file and an output MP3 path.' }
    if (-not (Get-Command node -ErrorAction SilentlyContinue)) { throw 'Node is missing. Follow SETUP.md Step 1.' }
    if (-not (Get-Command curl.exe -ErrorAction SilentlyContinue)) { throw 'The download helper curl is missing.' }
    if (-not (Test-Path -LiteralPath $TextFile -PathType Leaf)) { throw 'The speech text file is missing.' }
    if (Test-Path -LiteralPath $OutFile) { throw 'That output file already exists. Choose a new MP3 file name.' }
    $SettingsFile = Join-Path (Split-Path -Parent $PSScriptRoot) '.env'
    if (-not (Test-Path -LiteralPath $SettingsFile)) { throw 'Private settings are missing. Follow SETUP.md Step 6.' }
    $SpeechKey = ''; $SpeechVoice = ''
    foreach ($Line in [IO.File]::ReadAllLines($SettingsFile)) {
        $Parts = $Line -split '=', 2
        if ($Parts.Count -ne 2) { continue }
        $Value = $Parts[1]
        if ($Value.Length -ge 2 -and (($Value.StartsWith('"') -and $Value.EndsWith('"')) -or ($Value.StartsWith("'") -and $Value.EndsWith("'")))) { $Value = $Value.Substring(1, $Value.Length - 2) }
        switch ($Parts[0]) { 'ELEVENLABS_API_KEY' { $SpeechKey = $Value }; 'ELEVENLABS_VOICE_ID' { $SpeechVoice = $Value } }
    }
    if ($SpeechKey -cnotmatch '^[A-Za-z0-9_-]+$') { throw 'Wrong or expired key. Paste the whole key again with no extra spaces' }
    if ($SpeechVoice -cnotmatch '^[A-Za-z0-9_-]+$') { throw 'Your voice ID is missing or not accepted. Check SETUP.md Step 8.' }
    $BodyFile = [IO.Path]::GetTempFileName()
    $ResponseFile = [IO.Path]::GetTempFileName()
    $NodeCode = @'
const fs = require('fs');
const text = fs.readFileSync(process.argv[2], 'utf8');
if (!text.trim()) process.exit(1);
process.stdout.write(JSON.stringify({text, model_id:'eleven_multilingual_v2', voice_settings:{stability:0.45, similarity_boost:0.85, style:0.45, use_speaker_boost:true}}));
'@
    $Body = $NodeCode | & node - $TextFile 2>$null
    if ($LASTEXITCODE -ne 0) { throw 'The speech text could not be read.' }
    [IO.File]::WriteAllText($BodyFile, ($Body -join "`n"), (New-Object Text.UTF8Encoding($false)))
    $Status = ('header = "xi-api-key: ' + $SpeechKey + '"') | & curl.exe --silent --connect-timeout 15 --max-time 180 --config - --request POST --header 'Content-Type: application/json' --data-binary "@$BodyFile" --output $ResponseFile --write-out '%{http_code}' "https://api.elevenlabs.io/v1/text-to-speech/${SpeechVoice}?output_format=mp3_44100_128" 2>$null
    if ($LASTEXITCODE -ne 0) { throw 'ElevenLabs could not be reached. Try again when your connection is working.' }
    if ($Status -eq '200' -and (Get-Item -LiteralPath $ResponseFile).Length -gt 0) {
        [IO.File]::Copy($ResponseFile, $OutFile, $false)
        Write-Output 'Speech saved.'
        exit 0
    }
    $FailureBody = [IO.File]::ReadAllText($ResponseFile)
    if ($FailureBody -match 'missing_permissions') { throw 'Your key is missing a permission. Make a new key with Text to Speech enabled, see SETUP.md Step 5.' }
    if ($FailureBody -match 'invalid_api_key') { throw 'Wrong or expired key. Paste the whole key again with no extra spaces' }
    if ($FailureBody -match 'quota|credit|insufficient') { throw 'Your ElevenLabs credits or quota are used up. Check your balance before trying again.' }
    throw 'ElevenLabs did not accept the speech request. Check your voice and text, then try again.'
} catch {
    # Print only our own plain messages, never a native exception or response body.
    $SafeMessages = @(
        'Use this script with a text file and an output MP3 path.',
        'Node is missing. Follow SETUP.md Step 1.',
        'The download helper curl is missing.',
        'The speech text file is missing.',
        'That output file already exists. Choose a new MP3 file name.',
        'Private settings are missing. Follow SETUP.md Step 6.',
        'Wrong or expired key. Paste the whole key again with no extra spaces',
        'Your voice ID is missing or not accepted. Check SETUP.md Step 8.',
        'The speech text could not be read.',
        'ElevenLabs could not be reached. Try again when your connection is working.',
        'Your key is missing a permission. Make a new key with Text to Speech enabled, see SETUP.md Step 5.',
        'Your ElevenLabs credits or quota are used up. Check your balance before trying again.',
        'ElevenLabs did not accept the speech request. Check your voice and text, then try again.'
    )
    if ($SafeMessages -ccontains $_.Exception.Message) { Write-Output $_.Exception.Message }
    else { Write-Output 'The speech request could not be completed or saved. Check your files and settings.' }
    exit 1
} finally {
    if ($BodyFile) { Remove-Item -LiteralPath $BodyFile -Force -ErrorAction SilentlyContinue }
    if ($ResponseFile) { Remove-Item -LiteralPath $ResponseFile -Force -ErrorAction SilentlyContinue }
}
