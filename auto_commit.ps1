$git = if (Test-Path "C:\Program Files\Git\cmd\git.exe") { "C:\Program Files\Git\cmd\git.exe" } else { "git" }
$repo = "C:\Users\twjoh\Documents\GitHub\Stock-Report"
$today = Get-Date -Format "yyyy-MM-dd"

Push-Location $repo
$status = & $git status --porcelain 2>&1
if ($status) {
    & $git add -A 2>&1 | Out-Null
    & $git commit -m "auto: $today" 2>&1 | Out-Null
    & $git push 2>&1 | Out-Null
    Write-Output "$(Get-Date -Format 'HH:mm:ss') auto-push OK: $today"
} else {
    Write-Output "$(Get-Date -Format 'HH:mm:ss') no changes, skip"
}
Pop-Location
