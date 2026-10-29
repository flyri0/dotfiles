# Environment & Paths
path+=("$HOME/.local/bin")

# Shell History
HISTFILE="$HOME/.zsh_history"
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

# Fastfetch
if command -v fastfetch &> /dev/null; then
	fastfetch -c "$HOME/.config/fastfetch/fastfetch.json"
fi

# Prompt
[[ ! -f "$HOME/.p10k.zsh" ]] || source "$HOME/.p10k.zsh"

# NVM
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
[[ -s "$NVM_DIR/bash_completion" ]] && source "$NVM_DIR/bash_completion"
