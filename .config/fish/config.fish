if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Add cargo bin to PATH
set -gx PATH /home/sofiagilsanz/.cargo/bin $PATH

# Set Helix as default editor
set -gx EDITOR hx

# Starship prompt
starship init fish | source

# zoxide
zoxide init fish | source

# Shell wrapper for yazi
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    command rm -f -- "$tmp"
end

# fastfetch
fastfetch
