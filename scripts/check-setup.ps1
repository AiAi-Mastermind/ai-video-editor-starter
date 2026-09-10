# This check never prints private values and always finishes successfully.
Set-PSDebug -Off
$LocalElevenLabsKey = ""
$ProjectDir = Split-Path -Parent $PSScriptRoot
$EnvFile = Join-Path $ProjectDir ".env"
$LocalHeyGenKey = ""
$ExpectedNames = @(
    "ELEVENLABS_API_KEY",
    "ELEVENLABS_VOICE_ID",
    "HEYGEN_AVATAR_ID",
    "DEFAULT_OUTPUT_SIZES",
    "TEST_CLIP_SECONDS"
)
$PresentNames = @{}
foreach ($Name in $ExpectedNames) {
    $PresentNames[$Name] = $false
}

Write-Output "Local required helpers"

if (Test-Path $EnvFile) {
    Get-Content $EnvFile | ForEach-Object {
        $Separator = $_.IndexOf("=")
        if ($Separator -gt 0) {
            $Name = $_.Substring(0, $Separator).Trim()
            $Value = $_.Substring($Separator + 1)
            if ($Value.Length -ge 2 -and (($Value.StartsWith('"') -and $Value.EndsWith('"')) -or ($Value.StartsWith("'") -and $Value.EndsWith("'")))) { $Value = $Value.Substring(1, $Value.Length - 2) }
            if ($Name -eq 'ELEVENLABS_API_KEY') { $LocalElevenLabsKey = $Value }
            if ($Name -eq 'HEYGEN_API_KEY') { $LocalHeyGenKey = $Value }
            if ($PresentNames.ContainsKey($Name) -and -not [string]::IsNullOrWhiteSpace($Value)) {
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
Test-Command "elevenlabs" "elevenlabs command"
Test-Command "codex" "codex command (optional)"
Test-Command "whisper" "whisper (optional)"

foreach ($Name in $ExpectedNames) {
    if ($PresentNames[$Name]) {
        Write-Output "${Name}: PRESENT"
    } else {
        Write-Output "${Name}: MISSING"
    }
}

Write-Output "HeyGen registration"

$McpFile = Join-Path $ProjectDir ".mcp.json"
if ((Test-Path $McpFile) -and ((Get-Content $McpFile -Raw) -match 'mcp\.heygen\.com')) {
    Write-Output "HeyGen in this folder's settings: FOUND"
} else {
    Write-Output "HeyGen in this folder's settings: MISSING"
}

if (Get-Command codex -ErrorAction SilentlyContinue) {
    & codex mcp get heygen *> $null
    if ($LASTEXITCODE -eq 0) {
        Write-Output "HeyGen registered with Codex: FOUND (sign in once with: codex mcp login heygen)"
    } else {
        Write-Output "HeyGen registered with Codex: MISSING (run: scripts/bootstrap.ps1)"
    }
} else {
    Write-Output "HeyGen registered with Codex: NOT CHECKED (the codex command is not on this computer)"
}

if ($LocalHeyGenKey) {
    Write-Output "HEYGEN_API_KEY: PRESENT (this spends paid API credits, not your plan credits; leave it empty unless you meant to buy them)"
} else {
    Write-Output "HEYGEN_API_KEY: EMPTY (correct for almost everyone)"
}

if ($env:CHECK_SETUP_OFFLINE -eq '1') {
    Write-Output 'ElevenLabs key check: NOT TESTED (installation check only; offline)'
} elseif ($LocalElevenLabsKey) {
    if ($LocalElevenLabsKey -cnotmatch '^[A-Za-z0-9_-]+$') {
        Write-Output 'Wrong or expired key. Paste the whole key again with no extra spaces'
    } else {
        $Status = 0; $ResponseBody = ''
        try {
            $Response = Invoke-WebRequest -UseBasicParsing -Uri 'https://api.elevenlabs.io/v1/voices' -Headers @{'xi-api-key' = $LocalElevenLabsKey} -TimeoutSec 30 -ErrorAction Stop
            $Status = [int]$Response.StatusCode
            $ResponseBody = [string]$Response.Content
        } catch {
            if ($_.Exception.Response) {
                $Status = [int]$_.Exception.Response.StatusCode
                $ResponseBody = [string]$_.ErrorDetails.Message
                if (-not $ResponseBody) {
                    try {
                        if ($_.Exception.Response.Content) { $ResponseBody = $_.Exception.Response.Content.ReadAsStringAsync().GetAwaiter().GetResult() }
                        else {
                            $Reader = New-Object IO.StreamReader($_.Exception.Response.GetResponseStream())
                            try { $ResponseBody = $Reader.ReadToEnd() } finally { $Reader.Dispose() }
                        }
                    } catch { $ResponseBody = '' }
                }
            }
        }
        if ($Status -eq 200) { Write-Output 'ElevenLabs key works' }
        elseif ($Status -eq 401 -or $Status -eq 403) {
            if ($ResponseBody -match 'missing_permissions') { Write-Output 'Your key is missing a permission. Make a new key with Voices set to Read, see SETUP.md Step 4' }
            elseif ($ResponseBody -match 'invalid_api_key') { Write-Output 'Wrong or expired key. Paste the whole key again with no extra spaces' }
            else { Write-Output 'ElevenLabs rejected the key' }
        } else { Write-Output 'ElevenLabs could not be reached' }
    }
} else { Write-Output 'ElevenLabs key check: SKIPPED' }
Write-Output 'If the line above says ElevenLabs key works, ElevenLabs is connected. No plugin is involved.'
Write-Output 'HeyGen needs a one-time sign-in. It is not part of your key setup and it does not make this check fail.'
Write-Output 'The HeyGen sign-in and the ElevenLabs speech test are checked by the desk-check skill.'
exit 0
