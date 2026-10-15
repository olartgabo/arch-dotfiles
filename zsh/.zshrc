# Source sevens-dots configuration
source ${HOME}/.config/zsh/config.zsh

# Prevent zsh-newuser-install wizard
zstyle :compinstall filename '/home/olartgabo/.zshrc'

# kilo
export PATH=/home/olartgabo/.kilo/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"


# Secrets live outside the repo
[ -f "$HOME/.zshrc.secrets" ] && source "$HOME/.zshrc.secrets"
