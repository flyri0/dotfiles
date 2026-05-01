# ------------------------------------------------------------------------------
# 1. ENVIRONMENT & PATHS
# ------------------------------------------------------------------------------
export GOPATH="$HOME/.go"

# Add local binaries to path
path+=("$HOME/.local/bin")

# ------------------------------------------------------------------------------
# 2. SHELL HISTORY CONFIGURATION
# ------------------------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

setopt INC_APPEND_HISTORY     # Write to history file immediately, not at logout
setopt SHARE_HISTORY          # Share history between all active sessions
setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks from history commands
setopt HIST_IGNORE_ALL_DUPS   # Delete older duplicate entries in history
setopt HIST_IGNORE_SPACE      # Don't record commands starting with a space

# ------------------------------------------------------------------------------
# 3. PLUGIN MANAGEMENT (Antigen)
# ------------------------------------------------------------------------------
source "$HOME/.antigen.zsh"

# Theme
antigen theme romkatv/powerlevel10k

# Standard Library Bundles
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle "greymd/docker-zsh-completion"

# Community Extensions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

antigen apply

# ------------------------------------------------------------------------------
# 4. CONTEXTUAL EXECUTION (Container vs. Host)
# ------------------------------------------------------------------------------
# Detects Docker (.dockerenv), Podman (.containerenv), or generic container vars
if [[ -f /.dockerenv || -f /run/.containerenv || -n "$container" ]]; then
    # INSIDE CONTAINER: Prioritize Go binaries for development
    path+=("$GOPATH/bin")
else
    # HOST MACHINE: Show system summary on login
    if command -v fastfetch &> /dev/null; then
        fastfetch -c "$HOME/.config/fastfetch/fastfetch.json"
    fi
fi

# ------------------------------------------------------------------------------
# 5. PROMPT CUSTOMIZATION
# ------------------------------------------------------------------------------
# Load Powerlevel10k configuration if it exists
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
