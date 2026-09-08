# Print only one allowed ID. Never execute settings or reveal other values.
if ($args.Count -ne 1 -or ($args[0] -cne 'ELEVENLABS_VOICE_ID' -and $args[0] -cne 'HEYGEN_AVATAR_ID')) {
    Write-Output 'That name is not allowed'
    exit 0
}
$RequestedName = [string]$args[0]
$ProjectDir = Split-Path -Parent $PSScriptRoot
$IdFile = Join-Path $ProjectDir '.env'
if (-not (Test-Path -LiteralPath $IdFile -PathType Leaf)) { exit 0 }
$Reader = $null
try {
    $Reader = [System.IO.File]::OpenText($IdFile)
    while ($null -ne ($Line = $Reader.ReadLine())) {
        if ($Line.StartsWith($RequestedName + '=', [System.StringComparison]::Ordinal)) {
            $Value = $Line.Substring($RequestedName.Length + 1)
            if ($Value.Length -ge 2) {
                $First = $Value[0]
                $Last = $Value[$Value.Length - 1]
                if (($First -eq [char]34 -or $First -eq [char]39) -and $Last -eq $First) {
                    $Value = $Value.Substring(1, $Value.Length - 2)
                }
            }
            Write-Output $Value
            break
        }
    }
} catch {
    # Missing or unreadable settings return no value, without exposing details.
} finally {
    if ($null -ne $Reader) { $Reader.Dispose() }
}
exit 0
