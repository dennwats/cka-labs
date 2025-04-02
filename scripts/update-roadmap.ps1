
# RHCA Auto-Roadmap Updater
# Scans folders like cka/, rhce/, ex280/ and updates roadmap.md with lab counts

$folders = @("cka", "rhce", "ex280")
$roadmapPath = "roadmap.md"

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

$content = @()
$content += "# 📅 RHCA Lab Roadmap"
$content += ""
$content += "_Last updated: $timestamp_"
$content += ""

foreach ($folder in $folders) {
    if (Test-Path $folder) {
        $labCount = (Get-ChildItem -Path $folder -Directory | Measure-Object).Count
        $content += "## 🔧 $folder"
        $content += "- Labs completed: $labCount"
        $content += ""
    } else {
        $content += "## 🔧 $folder"
        $content += "- Labs completed: 0 _(folder missing)_"
        $content += ""
    }
}

$content += "---"
$content += "This file is updated by `update-roadmap.ps1`. Track your progress and push weekly."

# Write to roadmap.md
Set-Content -Path $roadmapPath -Value $content -Encoding UTF8
