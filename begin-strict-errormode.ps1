## automatically stop execution on all errors; prevents rolling past problems that might break later lines and obscure root cause
## halt if trying to use a variable that has not been set; helps with typos and variables that unexpectedly remain unpopulated after a process

begin
{
  $ErrorActionPreference = [System.Management.Automation.ActionPreference]::Stop
  Set-StrictMode -Version Latest
}

process
{
  ;
}
