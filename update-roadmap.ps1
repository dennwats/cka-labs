# ========== RHCA Roadmap Auto-Updater ==========

$date = Get-Date -Format "yyyy-MM-dd"
$ckaTasks = @(
    @{ Task = "CKA Lab 1 – Deployment + Service"; Done = $true },
    @{ Task = "CKA Lab 2 – ConfigMap injection"; Done = $false },
    @{ Task = "CKA Lab 3 – Secrets + Env Vars"; Done = $false }
)

$rhceTasks = @(
    @{ Task = "Ansible – Inventory + Playbook"; Done = $false },
    @{ Task = "Ansible – Roles + Handlers"; Done = $false }
)

$ex280Tasks = @(
    @{ Task = "EX280 – oc new-project + login"; Done = $false },
    @{ Task = "EX280 – Secure routes + TLS"; Done = $false }
)

function Format-Checklist($label, $tasks) {
    $output = "## $label`n"
    foreach ($task in $tasks) {
        $status = if ($task.Done) { "[x]" } else { "[ ]" }
        $output += "$status ${task.Task}`n"
    }
    return $output
}

# ========== BUILD NEW CONTENT ==========
$header = "# RHCA Roadmap – Updated $date`n"
$ckaSection = Format-Checklist "🧪 CKA Labs", $ckaTasks
$rhceSection = Format-Checklist "🔧 RHCE Labs", $rhceTasks
$ex280Section = Format-Checklist "🚀 EX280 Labs", $ex280Tasks

$content = "$header`n$ckaSection`n$rhceSection`n$ex280Section"

# ========== WRITE TO roadmap.md ==========
Set-Content -Path "roadmap.md" -Value $content -Encoding UTF8

Write-Host "✅ roadmap.md updated successfully!"

