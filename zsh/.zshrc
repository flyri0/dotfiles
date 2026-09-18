# Environment & Paths
export GOPATH="$HOME/.go"
path+=("$HOME/.local/bin")

# Shell History
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

# Plugins
source "$HOME/.antigen.zsh"

antigen theme romkatv/powerlevel10k

antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle "greymd/docker-zsh-completion"

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

antigen apply

# Container / Host
if [[ -f /.dockerenv || -f /run/.containerenv || -n "$container" ]]; then
    path+=("$GOPATH/bin")
else
    if command -v fastfetch &> /dev/null; then
        fastfetch -c "$HOME/.config/fastfetch/fastfetch.json"
    fi
fi

# Prompt
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Antigravity CLI
export PATH="/home/flyrio/.local/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"