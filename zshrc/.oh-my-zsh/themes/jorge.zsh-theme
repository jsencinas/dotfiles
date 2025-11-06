# Inspired in bria theme from oh my zsh
# --- Custom palette ---
local blue_dark="%F{25}"       # #1B4079
local blue_gray="%F{66}"       # #4D7C8A
local teal="%F{109}"           # #7F9C96
local green_soft="%F{108}"     # #8FAD88
local lime_light="%F{144}"     # #CBDF90
local reset="%f%k"

# --- Prompt sections ---
local return_code="%(?..${blue_dark}%? ↵${reset})"
local user_host="%B%(!.%F{red}.${lime_light})%n@%m${reset} "
local user_symbol='%(!.#.$)'
local current_dir="%B${teal}%~ ${reset}"
local conda_prompt='$(conda_prompt_info)'

local vcs_branch='$(git_prompt_info)$(hg_prompt_info)'
local rvm_ruby='$(ruby_prompt_info)'
local venv_prompt='$(virtualenv_prompt_info)'
local kube_prompt=''

if [[ "${plugins[@]}" =~ 'kube-ps1' ]]; then
    kube_prompt='$(kube_ps1)'
fi

ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"

PROMPT="╭─${conda_prompt}${user_host}${current_dir}${rvm_ruby}${vcs_branch}${venv_prompt}${kube_prompt}
╰─%B${user_symbol}%b "
RPROMPT="%B${return_code}%b"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}✗%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[yellow]%}"

ZSH_THEME_HG_PROMPT_PREFIX="$ZSH_THEME_GIT_PROMPT_PREFIX"
ZSH_THEME_HG_PROMPT_SUFFIX="$ZSH_THEME_GIT_PROMPT_SUFFIX"
ZSH_THEME_HG_PROMPT_DIRTY="$ZSH_THEME_GIT_PROMPT_DIRTY"
ZSH_THEME_HG_PROMPT_CLEAN="$ZSH_THEME_GIT_PROMPT_CLEAN"

ZSH_THEME_RUBY_PROMPT_PREFIX="%F{red}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›${reset}"

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%F{green}‹"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="›${reset}"
ZSH_THEME_VIRTUALENV_PREFIX="$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX"
ZSH_THEME_VIRTUALENV_SUFFIX="$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX"

