# add this line to $PROFILE
# . "~\.config\powershell\profile.ps1"

Invoke-Expression (&starship init powershell)
$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\starship.toml"
clear
