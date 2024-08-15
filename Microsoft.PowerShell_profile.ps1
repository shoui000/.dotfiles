set-alias cat        get-content -Scope private
set-alias clear      clear-host -Scope private
set-alias h          get-history -Scope private
set-alias history    get-history -Scope private
set-alias kill       stop-process -Scope private
set-alias lp         out-printer -Scope private
set-alias ls         get-childitem -Scope private
set-alias mount      new-mshdrive -Scope private
set-alias mv         move-item -Scope private
set-alias ps         get-process -Scope private
set-alias pwd        get-location -Scope private
set-alias r          invoke-history -Scope private
set-alias rm         remove-item -Scope private
set-alias rmdir      remove-item -Scope private

set-alias cls        clear-host -Scope private
set-alias chdir      set-location -Scope private
set-alias erase      remove-item -Scope private
set-alias rd         remove-item -Scope private
set-alias ren        rename-item -Scope private
set-alias set        set-variable -Scope private
set-alias type       get-content -Scope private

function help
{
    get-help $args[0] | out-host -paging
}

function man
{
    get-help $args[0] | out-host -paging
}

function mkdir
{
    new-item -type directory -path $args
}

function md
{
    new-item -type directory -path $args
}

function prompt
{
    "PS " + $(get-location) + "> "
}

& {
    for ($i = 0; $i -lt 26; $i++) 
    { 
        $funcname = ([System.Char]($i+65)) + ':'
        $str = "function global:$funcname { set-location $funcname } " 
        invoke-expression $str 
    }
}

function hh
{
    set-location "D:/Projetos"
    clear-host
}

function oo
{
    nvim "D:/Projetos/treeshitter"
}

Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1
