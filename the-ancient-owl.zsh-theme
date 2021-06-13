local orange=$(printf "\033[38;5;209m")
local red=$(printf "\033[38;5;203m")
local brown=$(printf "\033[38;5;137m")
local delim=$(printf "\033[38;5;240m")
local lime=$(printf "\033[38;5;149m")

PROMPT='%{$delim%}╭─%{$red%}%n%{$delim%}@%{$orange%}%m%}$delim%} ~ %{$brown%}%/
%{$delim%}╰─%{$lime%}$%{$reset_color%} '

#╭─ ╰─ → « »