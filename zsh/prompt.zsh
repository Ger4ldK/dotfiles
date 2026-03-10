zstyle ':vcs_info:git:*' formats '%b %m %a'
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:*' unstagedstr ' !'

# (Stolen from P10K implementation, i have no idea how this works)
# Usage: prompt-length TEXT [COLUMNS]
#
# If you run `print -P TEXT`, how many characters will be printed
# on the last line?
#
# Or, equivalently, if you set PROMPT=TEXT with prompt_subst
# option unset, on which column will the cursor be?
#
# The second argument specifies terminal width. Defaults to the
# real terminal width.
#
# Assumes that `%{%}` and `%G` don't lie.
function prompt-length() {
  emulate -L zsh
  local COLUMNS=${2:-$COLUMNS}
  local -i x y=${#1} m
  if (( y )); then
    while (( ${${(%):-$1%$y(l.1.0)}[-1]} )); do
      x=y
      (( y *= 2 ))
    done
    while (( y > x + 1 )); do
      (( m = x + (y - x) / 2 ))
      (( ${${(%):-$1%$m(l.x.y)}[-1]} = m ))
    done
  fi
  echo $x
} 

precmd () {
  local basePrompt='%B%F{cyan}%f %F{blue}%n%f%b %F{white}|%f %F{red}󰉋 %5~%f'
  vcs_info
  local gitInfo=${vcs_info_msg_0_}

  if [ $gitInfo ]; then
    gitInfo=" %F{white}|%f %F{magenta}${gitInfo}%f"
  fi

  local currentTime='%B%F{green}󰥔 %T%f%b'
  elapsedTime=""
  if [ $timer ]; then
    local nowNano=$(date +%s%0N)
    local unitNum=1000000
    local unit="ms"
    local now=$((${nowNano}/${unitNum}))
    local elapsed=$(($now-$timer))

    # milli to sec
    if [ $elapsed -ge 1000  ]; then
      elapsed=$((${elapsed}/1000))
      unit="s"
    fi
    # sec to minute
    if [ $elapsed -ge 60  ]; then
      elapsed=$((${elapsed}/60))
      unit="m"
    fi
    
    # sec to hour
    local hours=""
    if [ $elapsed -ge 60  ]; then
      hours="$((${elapsed}/60))h "
      elapsed=$((${elapsed}%60))
    fi

    elapsedTime=" %F{white}|  ${hours}${elapsed}${unit}%f"
    unset timer
  fi

  local spaceSize=$(($COLUMNS-$(prompt-length $currentTime)-$(prompt-length $elapsedTime)-$(prompt-length $basePrompt)-$(prompt-length $gitInfo)))
  right="${currentTime}"
  if [ $spaceSize -ge 0 ]; then
    for i in {1..$spaceSize}
    do
      right=" ${right}"
    done
  fi 
  PROMPT="${basePrompt}${gitInfo}${elapsedTime}${right}
%F{white}󰘍%f "
  
}

preexec() {
  timer=$(($(date +%s%0N)/1000000))
}

