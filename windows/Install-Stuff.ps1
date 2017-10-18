$me = $MyInvocation.MyCommand.Path
$dir = Split-Path $me
New-Item -Force -ItemType Directory -Path $env:USERPROFILE\tmp
New-Item -Force -ItemType SymbolicLink -Path $env:USERPROFILE\_vimrc -Value $dir\..\.vimrc
New-Item -Force -ItemType SymbolicLink -Path $env:USERPROFILE\vimfiles -Value $dir\..\.vim
New-Item -Force -ItemType SymbolicLink -Path $profile -Value $dir\Microsoft.Powershell_profile.ps1
