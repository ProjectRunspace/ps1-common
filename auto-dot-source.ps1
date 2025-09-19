# Automatically dot-sources files by adding their names.
# Halts if any file does not exist.
# Sets the search path to the script's calling location, but
# you can change the $ScriptSourcePath variable.

# Method 1: File List #
# Easiest to read and update, leaves the file names in a variable
# that lives as long as the script.

begin
{
	$ScriptSourcePath = $PSScriptRoot
	$SupportingScripts = @(
		'require-dot-sourced.ps1',
		'missing-will-halt.ps1',
		'also-missing-but-already-halted.ps1'
	)

	foreach ($SupportingScript in $SupportingScripts)
	{
		if (Test-Path -Path "$ScriptSourcePath\$SupportingScript")
		{
			. "$ScriptSourcePath\$SupportingScript"
		}
		else
		{
			Write-Error -Message "Required supporting script '$SupportingScript' not found in $ScriptSourcePath" -ErrorAction Stop
		}
	}
}

# Method 2: All in one #
# Bit tougher to read and filenames buried, but no permanent variable.

begin
{
	$ScriptSourcePath = $PSScriptRoot
	@(
		'require-dot-sourced.ps1',
		'missing-will-halt.ps1',
		'also-missing-but-already-halted.ps1'
	) | Foreach-Object -Process {
		if (Test-Path -Path "$ScriptSourcePath\$_")
		{
			. "$ScriptSourcePath\$_"
		}
		else
		{
			Write-Error -Message "Required supporting script '$_' not found in $ScriptSourcePath" -ErrorAction Stop
		}
	}
}

