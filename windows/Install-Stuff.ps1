$me = $MyInvocation.MyCommand.Path
$dir = split-Path $me
New-Item -Force -ItemType Directory -Path $dir\..\..\tmp
New-Item -Force -ItemType SymbolicLink -Path $dir\..\..\_vimrc -Value $dir\..\.vimrc
New-Item -Force -ItemType SymbolicLink -Path $dir\..\..\vimfiles -Value $dir\..\.vim
New-Item -Force -ItemType SymbolicLink -Path $profile -Value $dir\Microsoft.Powershell_profile.ps1
