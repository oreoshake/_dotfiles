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
    echo '- ('$branch')'
  fi
}

# Config for prompt. PS1 synonym.
prompt='%2/ - ($(git_branch_name)) > '

alias br="git_branch_name"
alias gap="git add -p"
alias gpo="git push origin HEAD"
alias gp="git pull origin $(git_branch_name)"