Set-PSReadLineKeyHandler -Key 'Ctrl+d' -Function DeleteCharOrExit

$Env:projetos = 'D:/Projetos/'
$Env:HOME = $Env:UserProfile

New-Alias which get-command
function ww 
{
  wsl ~
}

function hh
{
    set-location "D:/Projetos"
}

function make-link ($target, $link) {
    New-Item -Path $link -ItemType SymbolicLink -Value $target
}

# function prompt {
#     $p = $executionContext.SessionState.Path.CurrentLocation
#     $osc7 = ""
#     if ($p.Provider.Name -eq "FileSystem") {
#         $ansi_escape = [char]27
#         $provider_path = $p.ProviderPath -Replace "\\", "/"
#         $osc7 = "$ansi_escape]7;file://${env:COMPUTERNAME}/${provider_path}${ansi_escape}\"
#     }
#     "${osc7}PS $p$('>' * ($nestedPromptLevel + 1)) ";
# }
