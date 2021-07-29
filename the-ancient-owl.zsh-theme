local orange=$(printf "\033[38;5;209m")
local red=$(printf "\033[38;5;203m")
local brown=$(printf "\033[38;5;137m")
local delim=$(printf "\033[38;5;240m")
local lime=$(printf "\033[38;5;149m")

function getPWD {
  pwd="$PWD"

  case "$pwd" in
    *"theancientowl"*)
      pwd="⚡${pwd#"/home/theancientowl"}"
      ;;
  esac

  echo $pwd
}

PROMPT='%{$delim%}╭─%{$red%}%n%{$delim%}@%{$orange%}%m%}$delim%} ~ %{$brown%}$(getPWD)
%{$delim%}╰─%{$lime%}$%{$reset_color%} '

#╭─ ╰─ → « »