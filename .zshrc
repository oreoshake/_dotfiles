# Enable substitution in the prompt.
setopt prompt_subst

# Config for prompt. PS1 synonym.
prompt='%2/ - ($(git_branch_name)) > '

alias br="git_branch_name"
alias gap="git add -p"
alias gpo="git push origin HEAD"
alias gp="git pull origin $(git_branch_name)"