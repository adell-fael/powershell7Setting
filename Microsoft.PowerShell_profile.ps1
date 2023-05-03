# oh-my-posh init pwsh --config 'C:\Users\new19\AppData\Local\Programs\oh-my-posh\themes\di4am0nd.omp.json' | Invoke-Expression
# oh-my-posh init pwsh --config 'C:\Users\new19\AppData\Local\Programs\oh-my-posh\themes\multiverse-neon.omp.json' | Invoke-Expression
oh-my-posh init pwsh --config 'C:\Users\new19\AppData\Local\Programs\oh-my-posh\themes\peru.omp.json' | Invoke-Expression
# oh-my-posh init pwsh --config 'C:\Users\new19\AppData\Local\Programs\oh-my-posh\themes\sim-web.omp.json' | Invoke-Expression
# oh-my-posh init pwsh --config 'C:\Users\new19\AppData\Local\Programs\oh-my-posh\themes\uew.omp.json' | Invoke-Expression
# oh-my-posh init pwsh --config 'C:\Users\new19\AppData\Local\Programs\oh-my-posh\themes\kali.omp.json' | Invoke-Expression
# oh-my-posh init pwsh --config 'C:\Users\new19\AppData\Local\Programs\oh-my-posh\themes\emodipt-extend.omp.json' | Invoke-Expression


Import-Module -Name Terminal-Icons

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows


New-Alias -Name pn -Value pnpm


$nodeVersion = Get-Content -Path ".nvmrc" -ErrorAction SilentlyContinue

if ($nodeVersion) {
		nvm use $nodeVersion
		Write-Output "Node.js version $nodeVersion has been activated."
} 
else {
		# Write-Output "No .nvmrc file found in the current directory."
		nvm use lts | Out-Null
}

