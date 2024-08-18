# Get the directory where the script is located
$scriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path

# Get all SVG files in the same directory as the script
$svgFiles = Get-ChildItem -Path $scriptDirectory -Filter *.svg

foreach ($file in $svgFiles) {
    # Read the content of the SVG file
    $content = Get-Content -Path $file.FullName -Raw

    # Remove width and height attributes from the <svg> tag
    $content = $content -replace '\swidth="[^"]+"', ''
    $content = $content -replace '\sheight="[^"]+"', ''

    # Save the modified content back to the SVG file
    Set-Content -Path $file.FullName -Value $content

    Write-Host "Processed $($file.FullName)"
}

Write-Host "Processing complete. Width and height attributes have been removed from all SVG files in the folder."
