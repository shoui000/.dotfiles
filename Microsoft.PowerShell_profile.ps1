# set-alias cat        get-content -Scope private
# set-alias clear      clear-host -Scope private
# set-alias h          get-history -Scope private
# set-alias history    get-history -Scope private
# set-alias kill       stop-process -Scope private
# set-alias lp         out-printer -Scope private
# set-alias ls         get-childitem -Scope private
# set-alias mount      new-mshdrive -Scope private
# set-alias mv         move-item -Scope private
# set-alias ps         get-process -Scope private
# set-alias pwd        get-location -Scope private
# set-alias r          invoke-history -Scope private
# set-alias rm         remove-item -Scope private
# set-alias rmdir      remove-item -Scope private
# set-alias cls        clear-host -Scope private
# set-alias chdir      set-location -Scope private
# set-alias erase      remove-item -Scope private
# set-alias rd         remove-item -Scope private
# set-alias ren        rename-item -Scope private
# set-alias set        set-variable -Scope private
# set-alias type       get-content -Scope private

function help
{
    get-help $args[0] | out-host -paging
}

function mkdir
{
    new-item -type directory -path $args
}

set-alias vim nvim 

$Env:HOME = $Env:UserProfile

$Env:PROJETOS = "D:/Projetos"
$Env:DOTFILES = "$Env:PROJETOS/.dotfiles/" 
$Env:TREESHITTER = "$Env:PROJETOS/treeshitter/"

function hh
{
    set-location "$Env:PROJETOS"
    clear-host
}

function oo
{
    cd "$Env:TREESHITTER"
}

function dot
{
    cd "$Env:DOTFILES"
}

function tt
{

  if ($args.Count -eq 1) {
    $selected = $args[0]
  }
  else {
      $selected = (Get-ChildItem -Path $Env:PROJETOS -Directory -Depth 1 | ForEach-Object { $_.FullName } | & fzf)
  }

  if (-not [string]::IsNullOrEmpty($selected)){
    cd $selected
      nvim .
  }
}
