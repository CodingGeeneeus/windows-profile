oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\material.omp.json" | Invoke-Expression

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

$userName = (whoami).Split('\')[1]
$startupMessage = "Welcome" + ' ' + $userName

#allow for terminal choice

Write-Output($startupMessage)
 
DO 
{
$bootOptions = Read-Host "Terminal you would like to boot with?
1)Powershell
2)Ubuntu
"
} while( ($bootOptions -ne "1") -and ($bootOptions -ne "2") )  ## Only allow the use of options "1" or "2"

if($bootOptions -eq "1")
{
	Write-Output("Starting Powershell")
} 
else 
{
	Write-Output("Starting Ubuntu")
	Ubuntu.exe
}




