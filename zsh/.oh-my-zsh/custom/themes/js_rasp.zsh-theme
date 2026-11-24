# Raspberry Pi companion to js_encinas.zsh-theme
# Same two-line layout, but a dark dusk-violet/bronze palette so you can tell at a glance
# which machine you are on. Adds CPU temperature at the end of the first line.

# --- Custom palette (256-color codes) ---
local raspberry="%F{104}"
local pink="%F{139}"
local amber="%F{137}"
local sage="%F{108}"
local slate="%F{102}"
local muted_red="%F{167}"
local reset="%f%k"

# --- Needed so $(...) inside PROMPT is re-evaluated on every prompt ---
setopt prompt_subst

# --- CPU temperature (reads a kernel file directly, no extra process) ---
pi_temp() {
  local f=/sys/class/thermal/thermal_zone0/temp
  [[ -r $f ]] || return
  local t=$(( $(<$f) / 1000 ))
  local c="%F{108}"                 # green: normal
  (( t >= 60 )) && c="%F{179}"      # amber: warm
  (( t >= 75 )) && c="%F{167}"      # red: hot, throttling soon
  echo "${c}${t}°C%f"
}

# --- Prompt sections ---
local return_code="%(?..${muted_red}%? ↵${reset})"
local user_host="%B%(!.%F{red}.${raspberry})%n@%m${reset} "
local user_symbol='%(!.#.$)'
local current_dir="%B${amber}%~ ${reset}"
local vcs_branch='$(git_prompt_info)'
local venv_prompt='$(virtualenv_prompt_info)'
local temp_prompt='$(pi_temp)'

PROMPT="╭─${user_host}${current_dir}${vcs_branch}${venv_prompt}${temp_prompt}
╰─%B${user_symbol}%b "
RPROMPT="%B${return_code}%b"

# --- Git ---
ZSH_THEME_GIT_PROMPT_PREFIX="%F{139}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{167}✗%F{139}"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{139}"

# --- Python virtualenv ---
ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%F{108}‹"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="›%f "
ZSH_THEME_VIRTUALENV_PREFIX="$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX"
ZSH_THEME_VIRTUALENV_SUFFIX="$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX"

export LS_COLORS="${LS_COLORS}:ex=01;38;5;139"
