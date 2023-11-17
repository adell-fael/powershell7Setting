# oh-my-posh init pwsh --config 'C:\Users\new19\AppData\Local\Programs\oh-my-posh\themes\di4am0nd.omp.json' | Invoke-Expression
# oh-my-posh init pwsh --config 'C:\Users\new19\AppData\Local\Programs\oh-my-posh\themes\multiverse-neon.omp.json' | Invoke-Expression
# oh-my-posh init pwsh --config 'C:\Users\new19\AppData\Local\Programs\oh-my-posh\themes\peru.omp.json' | Invoke-Expression
# oh-my-posh init pwsh --config 'C:\Users\new19\AppData\Local\Programs\oh-my-posh\themes\sim-web.omp.json' | Invoke-Expression
# oh-my-posh init pwsh --config 'C:\Users\new19\AppData\Local\Programs\oh-my-posh\themes\kali.omp.json' | Invoke-Expression
# oh-my-posh init pwsh --config 'C:\Users\new19\AppData\Local\Programs\oh-my-posh\themes\tokyonight_storm.omp.json' | Invoke-Expression
# oh-my-posh init pwsh --config 'C:\Users\new19\AppData\Local\Programs\oh-my-posh\themes\the-unnamed.omp.json' | Invoke-Expression
# oh-my-posh init pwsh --config 'C:\Users\new19\AppData\Local\Programs\oh-my-posh\themes\star.omp.json' | Invoke-Expression
# oh-my-posh init pwsh --config 'C:\Users\new19\AppData\Local\Programs\oh-my-posh\themes\tonybaloney.omp.json' | Invoke-Expression


# modules
Import-Module -Name Terminal-Icons

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

# alias
New-Alias -Name pn -Value pnpm

# nvm 
$nodeVersion = Get-Content -Path ".nvmrc" -ErrorAction SilentlyContinue

if ($nodeVersion) {
	nvm use $nodeVersion
	Write-Output "Node.js version $nodeVersion has been activated."
} 
else { 
	$latestVersion = (nvm list available | Select-String -Pattern '\|\s+([^\s]+)\s+\|' | ForEach-Object { $_.Matches.Groups[1].Value } | Where-Object { $_ -notmatch 'CURRENT' } | Sort-Object -Descending | Select-Object -First 1).Trim()
	$currentVersion = nvm current

	if ($latestVersion) {
		if ($currentVersion) {
			nvm use $latestVersion | Out-Null
			if ($currentVersion -replace "v", "" -eq $latestVersion) {
				Write-Output "You are already using the latest Node.js version ($currentVersion)." | Out-Null
			}
			else {
				Write-Output "Current Node.js version: $currentVersion"
				Write-Output "Latest Node.js version: $latestVersion"
				Write-Output "To install and use the latest version, run:"
				Write-Output "nvm install $latestVersion"
				Write-Output "nvm use $latestVersion"
			}
		}
		else {
			Write-Output "Unable to determine the current Node.js version."
		}

	}
	else {
		Write-Output "No available Node.js versions found."
	}
}


$ENV:STARSHIP_CONFIG = "C:\Users\new19\Documents\PowerShell\starship.toml"


Invoke-Expression (&starship init powershell)