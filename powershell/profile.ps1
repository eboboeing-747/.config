# add this line to $PROFILE
# . "~\.config\powershell\profile.ps1"

Invoke-Expression (&starship init powershell)
$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\starship.toml"
$XDG_CONFIG_HOME = "$HOME\.config"
# $DOTNET_HOME = "C:\Program Files\dotnet"
$dev = "D:\\dev"

New-Alias -Name pgctl -Value pg_ctl

function tree { lsd --tree @args }

clear
