#This is the $PROFILE.CurrentUserAllHosts when run from Windows Terminal

New-Alias -Name 'll' -Value 'ls'
New-Alias -Name 'which' -Value 'Get-Command'
New-Alias -name 'dig' -Value 'Resolve-DNSName'

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# Enable if working on Azure
# Import-Module Az.Tools.Predictor
Import-Module Terminal-Icons
Import-Module posh-git
Import-Module CompletionPredictor

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\kushal.omp.json" | Invoke-Expression
$env:POSH_GIT_ENABLED = $true

Set-PSReadLineOption -PredictionSource HistoryAndPlugin

#! Note: the more features a theme has, the slower it makes the prompt

# amro is nice
# atomic has some nice features
# blue-owl has some good features and looks nice
# chips is also good
# cloud-native-azure informs you of your azure state, pretty neat
# craver has nice features and doesn't take up too much space, nice colours
# devious-diamonds.omp.yaml is neat, but broken?
# easy-term is cute, nice features
# emodipt-extend is nice and minimal-looking, good features
# jonnychipz has a handy azure subscription widget. If I were to make a custom theme, I could steal some of this theme's code
# kushal has a nice aesthetic and set of features
# sim-web is nice and minimal
