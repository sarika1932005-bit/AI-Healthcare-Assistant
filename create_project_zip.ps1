# PowerShell script to zip the project excluding heavy folders
$sourcePath = "C:\Users\aryal\.gemini\antigravity\scratch"
$destinationPath = "C:\Users\aryal\.gemini\antigravity\scratch\AI_Healthcare_Assistant_Project.zip"

# Remove existing zip if it exists
if (Test-Path $destinationPath) {
    Remove-Item $destinationPath
}

# Define exclusion patterns
$exclude = @(
    "node_modules",
    "__pycache__",
    "*.pyc",
    ".git",
    ".vscode",
    "venv",
    "env",
    ".env",
    "dist",
    "build",
    "coverage",
    "htmlcov",
    ".pytest_cache",
    "AI_Healthcare_Assistant_Project.zip" # Exclude the zip itself
)

# Get all files recursively
$files = Get-ChildItem -Path $sourcePath -Recurse

# Filter out excluded files and folders
foreach ($item in $exclude) {
    $files = $files | Where-Object { $_.FullName -notmatch [regex]::Escape($item) }
}

# Create the zip file
Compress-Archive -Path $files.FullName -DestinationPath $destinationPath -CompressionLevel Optimal

Write-Host "Project successfully zipped to: $destinationPath"
