# Halts if the script is run directly instead of dot-sourced.

# Dot-sourcing adds the contents of a script to the execution environment
# without running it. It works like an include directive in PowerShell.
# Use this if you want to make functions, classes, variables, etc. available
# in other contexts without copy-paste or re-typing. You can dot-source from
# other scripts or from a prompt.
# Just type a period, then a space, then the path to the script.
# Ex: C:\PS> . .\require-dot-sourced.ps1

if ($MyInvocation.InvocationName -ne '.')
{
	Write-Error -Message ('{0} must be dot-sourced.' -f $PSCommandPath) -ErrorAction Stop
}
