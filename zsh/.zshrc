source ~/.zsh_profile
source ~/.zsh_keybindings

unsetopt LIST_BEEP
path+=("/home/ddeveza/.local/share/mise/shims")
path+=("/home/ddeveza/.local/bin/")
export PATH

## ZSH PROMPT

# Carrega suporte nativo a cores e variáveis
autoload -U colors && colors
setopt PROMPT_SUBST

# Paleta de Cores do Tema Vague
VAGUE_FG="#cdcdcd"      # Cinza claro (Diretório e ponto)
VAGUE_BLUE="#8fb8c9"    # Azul suave (Branch, setinha e asterisco)
VAGUE_YELLOW="#d4c097"  # Amarelo suave (Símbolo Lambda)
VAGUE_GRAY="#5c6370"    # Cinza escuro (Colchetes)
VAGUE_RED="#e89a95"     # Vermelho suave (Setinha de erro)

# Função para pegar o status do Git
get_git_info() {
  local branch=$(git branch --show-current 2> /dev/null)
  
  if [[ -n "$branch" ]]; then
    local git_status=$(git status --porcelain 2> /dev/null)
    local icons=""
    local has_modified=false
    local has_untracked=false
    
    if [[ -n "$git_status" ]]; then
      # Verifica se há arquivos não rastreados (linhas que começam com ??)
      if echo "$git_status" | grep -q '^[?][?]'; then
        has_untracked=true
      fi
      # Verifica se há outras modificações (linhas que NÃO começam com ??)
      if echo "$git_status" | grep -qv '^[?][?]'; then
        has_modified=true
      fi
    fi
    
    # Monta os símbolos de status
    if $has_modified; then
      icons+="%F{$VAGUE_BLUE}✱%f "
    fi
    if $has_untracked; then
      icons+="%F{$VAGUE_FG}●%f "
    fi
    
    # Remove o espaço extra no final dos ícones
    icons=${icons% }
    
    # Estrutura do lado direito: λ:branch [ ✱ ● ]
    local result="%F{$VAGUE_YELLOW}λ:%f%F{$VAGUE_BLUE}${branch}%f"
    if [[ -n "$icons" ]]; then
       result+=" %F{$VAGUE_GRAY}[%f ${icons} %F{$VAGUE_GRAY}]%f"
    fi
    echo "$result"
  fi
}

# PROMPT Principal (Esquerda): ~/.dotfiles >
# A setinha (>) usa VAGUE_BLUE se o comando deu certo, VAGUE_RED se deu erro.
PROMPT='%F{$VAGUE_FG}%~%f %(?.%F{$VAGUE_BLUE}.%F{$VAGUE_RED})>%f '

# RPROMPT (Direita): Git Status
RPROMPT='$(get_git_info)'
