# Workaround to exclude directories from Google Drive: store somewhere else & replace them with symbolic links.

>RUN POWERSHELL AS ADMIN FOR THIS TO WORK

### Tested with:
- Windows 10 build 19041
- Powershell 7.0.0-rc.2
- Backup and Sync Version 3.48.8668.1933

### Configuration:
1. Modify $baseDir with your Google Drive path
2. Modify $nodeModulesFolder with the storage folder
3. Modify $nameToFind with the name of the folders you want to replace