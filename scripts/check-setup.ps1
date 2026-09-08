# This check never prints private values and always finishes successfully.
$ProjectDir = Split-Path -Parent $PSScriptRoot
$EnvFile = Join-Path $ProjectDir ".env"
$ExpectedNames = @(
    "ELEVENLABS_API_KEY",
    "ELEVENLABS_VOICE_ID",
    "HEYGEN_AVATAR_ID",
    "HEYGEN_API_KEY",
    "BRAND_NAME",
    "DEFAULT_OUTPUT_SIZES",
    "TEST_CLIP_SECONDS"
)
$PresentNames = @{}
foreach ($Name in $ExpectedNames) {
    $PresentNames[$Name] = $false
}

Write-Output "Local prerequisites"

if (Test-Path $EnvFile) {
    Get-Content $EnvFile | ForEach-Object {
        $Separator = $_.IndexOf("=")
        if ($Separator -gt 0) {
            $Name = $_.Substring(0, $Separator).Trim()
            if ($PresentNames.ContainsKey($Name) -and -not [string]::IsNullOrWhiteSpace($_.Substring($Separator + 1))) {
                $PresentNames[$Name] = $true
            }
        }
    }
    Write-Output "Environment file: FOUND"
} else {
    Write-Output "Environment file: MISSING"
}

function Test-Command($Name, $DisplayName) {
    if (Get-Command $Name -ErrorAction SilentlyContinue) {
        Write-Output "${DisplayName}: FOUND"
    } else {
        Write-Output "${DisplayName}: MISSING"
    }
}

Test-Command "node" "node"
Test-Command "npm" "npm"
Test-Command "ffmpeg" "ffmpeg"
Test-Command "hyperframes" "hyperframes"
Test-Command "whisper" "whisper (optional)"

foreach ($Name in $ExpectedNames) {
    if ($PresentNames[$Name]) {
        Write-Output "${Name}: PRESENT"
    } elseif ($Name -eq "HEYGEN_API_KEY") {
        Write-Output "${Name}: OPTIONAL / NOT SET"
    } else {
        Write-Output "${Name}: MISSING"
    }
}

Write-Output "Connections to HeyGen and ElevenLabs are tested by the desk-check skill, not by this script."
exit 0
