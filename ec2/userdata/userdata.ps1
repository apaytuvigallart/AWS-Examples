<powershell>
# Install IIS
Install-WindowsFeature -name Web-Server -IncludeManagementTools

# Define website content
$webRoot = "C:\inetpub\wwwroot"
$indexFile = "$webRoot\index.html"

# Create simple Hello World page
"<!DOCTYPE html>
<html>
<head>
  <title>Hello World</title>
</head>
<body>
  <h1>Hello World from EC2!</h1>
</body>
</html>" | Out-File -Encoding utf8 $indexFile -Force

# Restart IIS to apply changes
Restart-Service W3SVC
</powershell>
