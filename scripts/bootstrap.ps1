# Usage: scripts/bootstrap.ps1
# Installs every helper this project needs and registers the HeyGen connection.
# Safe to run twice. Never prints the contents of .env.
Set-PSDebug -Off
$ErrorActionPreference = 'Continue'

$ProjectDir = Split-Path -Parent $PSScriptRoot
$EnvFile = Join-Path $ProjectDir '.env'
$ExampleFile = Join-Path $ProjectDir '.env.example'
$TodoFile = Join-Path $ProjectDir '.setup-next-steps.txt'
$NextSteps = New-Object System.Collections.Generic.List[string]
$HeyGenUrl = 'https://mcp.heygen.com/mcp/v1/'

function Have($Name) { return [bool](Get-Command $Name -ErrorAction SilentlyContinue) }

Write-Output 'Setting up your AI video editor. This takes a few minutes.'
Write-Output ''

# --------------------------------------------------------------- 1, Node.js
Write-Output '1 of 6, Node.js'
if (Have 'node') {
    $NodeVersion = (& node --version) 2>$null
    $NodeMajor = 0
    if ($NodeVersion -match '^v(\d+)') { $NodeMajor = [int]$Matches[1] }
    if ($NodeMajor -ge 22) {
        Write-Output "   Node.js $NodeVersion is installed. Good."
    } else {
        Write-Output "   Node.js $NodeVersion is too old. This project needs 22 or newer."
        $NextSteps.Add('Install Node.js 22 or newer from https://nodejs.org/ then run this setup again.')
    }
} else {
    Write-Output '   Node.js is not installed.'
    $NextSteps.Add('Install Node.js 22 or newer from https://nodejs.org/ then run this setup again.')
}

# ----------------------------------------------------------------- 2, ffmpeg
Write-Output '2 of 6, ffmpeg, the video helper'
if (Have 'ffmpeg') {
    Write-Output '   ffmpeg is installed. Good.'
} elseif (Have 'winget') {
    Write-Output '   Installing ffmpeg with winget. This can take a few minutes.'
    & winget install --id Gyan.FFmpeg --silent --accept-source-agreements --accept-package-agreements *> $null
    if (Have 'ffmpeg') {
        Write-Output '   ffmpeg is installed. Good.'
    } else {
        Write-Output '   ffmpeg did not install on its own.'
        $NextSteps.Add('Close and reopen PowerShell, then run: winget install Gyan.FFmpeg')
    }
} else {
    Write-Output '   ffmpeg is missing and winget is not available.'
    $NextSteps.Add('Install ffmpeg from https://ffmpeg.org/download.html')
}

# ------------------------------------------------------------ 3, HyperFrames
Write-Output '3 of 6, HyperFrames, the renderer'
if (Have 'npm') {
    if (-not (Have 'hyperframes')) {
        Write-Output '   Installing HyperFrames.'
        & npm install -g hyperframes *> $null
    }
    if (Have 'hyperframes') {
        $HfVersion = (& hyperframes --version) 2>$null
        Write-Output "   HyperFrames $HfVersion is installed. Good."
        Write-Output '   Installing the HyperFrames instructions your agent reads.'
        & hyperframes skills update *> $null
        if ($LASTEXITCODE -eq 0) {
            Write-Output '   HyperFrames instructions are installed. You do not need the HyperFrames plugin.'
        } else {
            Write-Output '   The HyperFrames instructions did not install on their own.'
            $NextSteps.Add('Open PowerShell and run: hyperframes skills update')
        }
    } else {
        Write-Output '   HyperFrames did not install.'
        $NextSteps.Add('Open PowerShell and run: npm install -g hyperframes')
    }
} else {
    Write-Output '   Skipped because npm is missing. Install Node.js first.'
}

# ------------------------------------------------------- 4, ElevenLabs CLI
Write-Output '4 of 6, the ElevenLabs command'
if (Have 'npm') {
    if (-not (Have 'elevenlabs')) {
        Write-Output '   Installing the official ElevenLabs command.'
        & npm install -g '@elevenlabs/cli' *> $null
    }
    if (Have 'elevenlabs') {
        Write-Output '   The elevenlabs command is installed. It reads your key from .env.'
        Write-Output '   You do not need the ElevenLabs plugin.'
    } else {
        Write-Output '   The ElevenLabs command did not install.'
        $NextSteps.Add('Open PowerShell and run: npm install -g @elevenlabs/cli')
    }
} else {
    Write-Output '   Skipped because npm is missing. Install Node.js first.'
}

# ----------------------------------------------------- 5, private settings
Write-Output '5 of 6, your private settings file'
if (Test-Path -LiteralPath $EnvFile) {
    Write-Output '   .env already exists. Leaving it exactly as it is.'
} elseif (Test-Path -LiteralPath $ExampleFile) {
    try {
        Copy-Item -LiteralPath $ExampleFile -Destination $EnvFile -ErrorAction Stop
        Write-Output '   Created .env from the template. Nobody has read it, including this script.'
        $NextSteps.Add('Open .env yourself and paste in your ElevenLabs key, voice ID and avatar ID. SETUP.md Step 6 shows how.')
    } catch {
        Write-Output '   .env could not be created.'
        $NextSteps.Add('Copy .env.example to .env by hand, then fill it in.')
    }
} else {
    Write-Output '   .env.example is missing, so nothing was copied.'
}

# ------------------------------------------------------ 6, HeyGen connection
Write-Output '6 of 6, your HeyGen connection'
$RegisteredAnywhere = $false

if (Have 'codex') {
    & codex mcp get heygen *> $null
    if ($LASTEXITCODE -eq 0) {
        Write-Output '   Codex already knows about HeyGen.'
        $RegisteredAnywhere = $true
    } else {
        $CodexHome = $env:CODEX_HOME
        if (-not $CodexHome) { $CodexHome = Join-Path $HOME '.codex' }
        if (-not (Test-Path -LiteralPath $CodexHome)) { New-Item -ItemType Directory -Path $CodexHome -Force *> $null }
        $CodexConfig = Join-Path $CodexHome 'config.toml'
        $Existing = ''
        if (Test-Path -LiteralPath $CodexConfig) { $Existing = [IO.File]::ReadAllText($CodexConfig) }
        if ($Existing -notmatch '(?m)^\[mcp_servers\.heygen\]') {
            $Block = "`n[mcp_servers.heygen]`n# Your HeyGen video clone. Added by the AI Video Editor starter.`nurl = `"$HeyGenUrl`"`n"
            [IO.File]::AppendAllText($CodexConfig, $Block)
        }
        & codex mcp get heygen *> $null
        if ($LASTEXITCODE -eq 0) {
            Write-Output '   Registered HeyGen with Codex. No plugin needed.'
            $RegisteredAnywhere = $true
        } else {
            Write-Output '   HeyGen could not be registered with Codex automatically.'
            $NextSteps.Add("Open PowerShell and run: codex mcp add heygen --url $HeyGenUrl")
        }
    }
    $NextSteps.Add('Sign in to HeyGen once. Open PowerShell and run: codex mcp login heygen')
}

if (Have 'claude') {
    Write-Output "   Claude Code reads HeyGen from this folder's .mcp.json. No plugin needed."
    $RegisteredAnywhere = $true
    $NextSteps.Add('In Claude Code, type /mcp and finish the HeyGen sign-in once.')
}

if (-not $RegisteredAnywhere) {
    Write-Output '   No agent command was found on this computer.'
    $NextSteps.Add("HeyGen is already registered in this folder's .mcp.json and .codex/config.toml. Open the folder in your agent and sign in there.")
}

# ------------------------------------------------------------------ summary
Write-Output ''
Write-Output 'Setup finished.'
if ($NextSteps.Count -eq 0) {
    Write-Output 'Nothing is left for you to do. Start a new chat and ask for the desk check.'
    Remove-Item -LiteralPath $TodoFile -Force -ErrorAction SilentlyContinue
} else {
    Write-Output 'What is left for you to do:'
    $Index = 1
    $Lines = New-Object System.Collections.Generic.List[string]
    foreach ($Step in $NextSteps) {
        Write-Output "  ${Index}. $Step"
        $Lines.Add("$Index. $Step")
        $Index = $Index + 1
    }
    [IO.File]::WriteAllLines($TodoFile, $Lines)
    Write-Output ''
    Write-Output 'These are also saved in .setup-next-steps.txt'
}
Write-Output ''
Write-Output 'Then START A NEW CHAT and ask for the desk check.'
exit 0
