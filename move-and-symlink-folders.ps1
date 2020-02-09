$baseDir = 'C:\Users\MyUser\Google Drive'
$nameToFind = 'node_modules'
$nodeModulesFolder = 'C:\Users\MyUser\node_modules_storage'
$maxDepth = 10
$maxAttemptsForEmptyLevels = 10;

for ($depth = 0; $depth -lt $maxDepth; $depth++) {
    $flag = 0
    foreach ($folder in (Get-ChildItem -Path $baseDir -Filter $nameToFind -Recurse -Directory -Depth $depth)) {
        $flag = 1
        if ($folder.Attributes.ToString().Contains("ReparsePoint")) {
            # symlink
            continue
        }
        $storagePath = $folder.FullName.Replace($baseDir, $nodeModulesFolder) -replace '\\node_modules$', ''
        $originalPath = ($folder.FullName)

        Write-Host ""
        Write-Host ""
        Write-Host ""
        
        Write-Host cmd /c md "$storagePath"
        cmd /c md "$storagePath"            # Create sotrage folder
        
        Write-Host cmd /c move "$originalPath" "$storagePath"
        cmd /c move "$originalPath" "$storagePath"              # Move $nameToFind folder to storage
        
        Write-Host cmd /c mklink /d $originalPath $storagePath
        cmd /c mklink /d $originalPath $storagePath             # Create Symbolic link
    }
    if ($flag = 0) {
        $maxAttemptsForEmptyLevels--
        if ($maxAttemptsForEmptyLevels = 0) {
            break
        }
    }
}