# Publish the current folder to a new or existing GitHub repository.
# Usage: .\publish_to_github.ps1 -RemoteUrl https://github.com/username/karri_study.git
param(
  [string]$RemoteUrl
)
if (-not $RemoteUrl) {
  $RemoteUrl = Read-Host 'Enter the remote URL (e.g. https://github.com/you/karri_study.git)'
}
Write-Host "Using remote: $RemoteUrl"
if (-not (Test-Path .git)) {
  git init
}
git add .
try { git commit -m "Initial commit: karri study experiment" } catch { Write-Host "Commit may have failed (no changes or existing commits). Continuing." }
git branch -M main
try { git remote add origin $RemoteUrl } catch { Write-Host "Remote may already exist; setting url"; git remote set-url origin $RemoteUrl }
git push -u origin main
Write-Host "If push succeeded, enable GitHub Pages in repository settings and visit: https://<youruser>.github.io/karri_study/kids_circle.html";
