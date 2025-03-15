# Self-elevate the script if required
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator'))
{
  if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000)
  {
    $CommandLine = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
    Start-Process -Wait -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
    Exit
  }
}

# If powershell config isn't stored in the correct location, create a symlink to the correct location
# Ex: Config stored in OneDrive because of Documents folder being synced
$powershellDir = Split-Path -Path $profile -Parent
if ($powershellDir -ne "$env:USERPROFILE\Documents\PowerShell" -and -not (Test-Path -Path $powershellDir))
{
  New-Item -Path $powershellDir -ItemType SymbolicLink -Value "$env:USERPROFILE\Documents\PowerShell"
}

# Import-Module Microsoft.PowerShell.Security
# Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
# Set-ExecutionPolicy Bypass -Scope Process -Force