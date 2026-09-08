# This check never prints private values and always finishes successfully.
$ProjectDir = Split-Path -Parent $PSScriptRoot
$EnvFile = Join-Path $ProjectDir ".env"

if (Test-Path $EnvFile) {
    Get-Content $EnvFile | ForEach-Object {
        $Line = $_.Trim()
        if ($Line -and -not $Line.StartsWith("#") -and $Line.Contains("=")) {
            $Parts = $Line.Split("=", 2)
            [Environment]::SetEnvironmentVariable($Parts[0].Trim(), $Parts[1].Trim(), "Process")
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

function Test-Key($Name) {
    $Value = [Environment]::GetEnvironmentVariable($Name, "Process")
    if ([string]::IsNullOrWhiteSpace($Value)) {
        Write-Output "${Name}: MISSING"
    } else {
        Write-Output "${Name}: PRESENT"
    }
}

Test-Command "node" "node"
Test-Command "npm" "npm"
Test-Command "ffmpeg" "ffmpeg"
Test-Command "hyperframes" "hyperframes"
Test-Command "whisper" "whisper (optional)"
Test-Key "ELEVENLABS_API_KEY"
Test-Key "ELEVENLABS_VOICE_ID"
Test-Key "HEYGEN_AVATAR_ID"
Test-Key "HEYGEN_API_KEY"
Test-Key "BRAND_NAME"
Test-Key "DEFAULT_OUTPUT_SIZES"
Test-Key "TEST_CLIP_SECONDS"

$ApiKey = [Environment]::GetEnvironmentVariable("ELEVENLABS_API_KEY", "Process")
if (-not [string]::IsNullOrWhiteSpace($ApiKey)) {
    try {
        Invoke-WebRequest -Uri "https://api.elevenlabs.io/v1/user" -Headers @{"xi-api-key" = $ApiKey} -UseBasicParsing | Out-Null
        Write-Output "ElevenLabs key works"
    } catch {
        Write-Output "ElevenLabs key rejected"
    }
} else {
    Write-Output "ElevenLabs key check: SKIPPED"
}

exit 0
