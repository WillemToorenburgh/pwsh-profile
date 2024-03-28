#This is the $PROFILE when run from Windows Terminal

# Get Perforce to set up env vars
# p4 set

New-Alias -Name 'll' -Value 'ls'
New-Alias -Name 'which' -Value 'Get-Command'
New-Alias -name 'dig' -Value 'Resolve-DNSName'

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}

Import-Module Az.Tools.Predictor
Import-Module Terminal-Icons
Import-Module posh-git
Import-Module CompletionPredictor

#34de4b3d-13a8-4540-b76d-b9e8d3851756 PowerToys CommandNotFound module

Import-Module "C:\Program Files\PowerToys\WinUI3Apps\..\WinGetCommandNotFound.psd1"
#34de4b3d-13a8-4540-b76d-b9e8d3851756

If (Get-Command az) {
    Register-ArgumentCompleter -Native -CommandName az -ScriptBlock {
        param($commandName, $wordToComplete, $cursorPosition)
        $completion_file = New-TemporaryFile
        $env:ARGCOMPLETE_USE_TEMPFILES = 1
        $env:_ARGCOMPLETE_STDOUT_FILENAME = $completion_file
        $env:COMP_LINE = $wordToComplete
        $env:COMP_POINT = $cursorPosition
        $env:_ARGCOMPLETE = 1
        $env:_ARGCOMPLETE_SUPPRESS_SPACE = 0
        $env:_ARGCOMPLETE_IFS = "`n"
        $env:_ARGCOMPLETE_SHELL = 'powershell'
        az 2>&1 | Out-Null
        Get-Content $completion_file | Sort-Object | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, "ParameterValue", $_)
        }
        Remove-Item $completion_file, Env:\_ARGCOMPLETE_STDOUT_FILENAME, Env:\ARGCOMPLETE_USE_TEMPFILES, Env:\COMP_LINE, Env:\COMP_POINT, Env:\_ARGCOMPLETE, Env:\_ARGCOMPLETE_SUPPRESS_SPACE, Env:\_ARGCOMPLETE_IFS, Env:\_ARGCOMPLETE_SHELL
    }
}

# Disabling as it seems to be causing issues with the VSCode Powershell extension integrated terminal
# Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

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
