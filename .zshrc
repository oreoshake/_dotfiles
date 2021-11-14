# Enable substitution in the prompt.
setopt prompt_subst

# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo $branch
  fi
}

# Load version control information
# Autoload zsh add-zsh-hook and vcs_info functions (-U autoload w/o substition, -z use zsh style)
autoload -Uz add-zsh-hook vcs_info
# Enable substitution in the prompt.
setopt prompt_subst
# Run vcs_info just before a prompt is displayed (precmd)
add-zsh-hook precmd vcs_info
# add ${vcs_info_msg_0} to the prompt
# e.g. here we add the Git information in red
PROMPT='%1~ %F{red}${vcs_info_msg_0_}%f %# '

# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
# Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' formats       '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

alias br="git_branch_name"
alias gap="git add -p"
alias gpo="git push origin HEAD"
alias gp="git pull origin $(git_branch_name)"
alias be="bundle exec"
alias ll="ls -la"

setopt CORRECT
setopt CORRECT_ALL


setopt EXTENDED_HISTORY
SAVEHIST=5000
HISTSIZE=2000

# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS

setopt AUTO_CD

# The following lines were added by compinstall

autoload -Uz compinit
compinit

plugins=(
    git
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
    zsh-history-substring-search
)

source ~/.oh-my-zsh/oh-my-zsh.sh