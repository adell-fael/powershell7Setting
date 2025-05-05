# oh-my-posh init pwsh --config 'C:\Users\new19\AppData\Local\Programs\oh-my-posh\themes\di4am0nd.omp.json' | Invoke-Expression
# oh-my-posh init pwsh --config 'C:\Users\new19\AppData\Local\Programs\oh-my-posh\themes\multiverse-neon.omp.json' | Invoke-Expression
# oh-my-posh init pwsh --config 'C:\Users\new19\AppData\Local\Programs\oh-my-posh\themes\peru.omp.json' | Invoke-Expression
# oh-my-posh init pwsh --config 'C:\Users\new19\AppData\Local\Programs\oh-my-posh\themes\sim-web.omp.json' | Invoke-Expression
# oh-my-posh init pwsh --config 'C:\Users\new19\AppData\Local\Programs\oh-my-posh\themes\kali.omp.json' | Invoke-Expression
# oh-my-posh init pwsh --config 'C:\Users\new19\AppData\Local\Programs\oh-my-posh\themes\tokyonight_storm.omp.json' | Invoke-Expression
# oh-my-posh init pwsh --config 'C:\Users\new19\AppData\Local\Programs\oh-my-posh\themes\the-unnamed.omp.json' | Invoke-Expression
# oh-my-posh init pwsh --config 'C:\Users\new19\AppData\Local\Programs\oh-my-posh\themes\star.omp.json' | Invoke-Expression
# oh-my-posh init pwsh --config 'C:\Users\new19\AppData\Local\Programs\oh-my-posh\themes\tonybaloney.omp.json' | Invoke-Expression

# this is for linux  -- Read the Node.js version from .nvmrc file
# nodeVersion=$(cat .nvmrc 2>/dev/null)

# if [[ -n $nodeVersion ]]; then
#     # Activate specified Node.js version
#     nvm use "$nodeVersion"
#     echo "Node.js version $nodeVersion has been activated."
# else
#     # Get the latest available Node.js version
#     latestVersion=$(nvm ls-remote | grep -Eo 'v[0-9]+\.[0-9]+\.[0-9]+' | sort -V | tail -n 1)

#     if [[ -n $latestVersion ]]; then
#         currentVersion=$(nvm current)

#         if [[ "$currentVersion" == "none" ]]; then
#             nvm use "$latestVersion" > /dev/null
#             latestVersionWithoutV="${latestVersion#v}"
#             echo "Using the latest Node.js version ($latestVersionWithoutV)."
#         elif [[ -n $currentVersion ]]; then
#             latestVersionWithoutV="${latestVersion#v}"
            
#             if [[ "$currentVersion" == "$latestVersionWithoutV" ]]; then
#                 echo "You are already using the latest Node.js version ($currentVersion)."
#             else
#                 echo "Current Node.js version: $currentVersion"
#                 echo "Latest Node.js version: $latestVersionWithoutV"
#                 echo "To install and use the latest version, run:"
#                 echo "nvm install $latestVersionWithoutV"
#                 echo "nvm use $latestVersionWithoutV"
#             fi
#         else
#             echo "Unable to determine the current Node.js version."
#         fi
#     else
#         echo "No available Node.js (.nvmrc) versions found."
#     fi
# fi


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
	$currentVersion = nvm current
	if ($currentVersion -ne $nodeVersion) {
		nvm use $nodeVersion
		Write-Output "Node.js version $nodeVersion has been activated."
	}
}

$ENV:STARSHIP_CONFIG = "C:\Users\new19\Documents\PowerShell\starship.toml"


Invoke-Expression (&starship init powershell)

