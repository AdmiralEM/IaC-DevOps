# PowerShell script to automate SharePoint configuration

# Example: Create a SharePoint site
$site = New-SPOSite -Url "https://yourdomain.sharepoint.com/sites/ExampleSite" -Owner "admin@yourdomain.com" -StorageQuota 1000
