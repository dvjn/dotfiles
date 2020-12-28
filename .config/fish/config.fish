set -x fish_config_dir $HOME/.config/fish
set -x EDITOR nvim

source $fish_config_dir/fish_colors.fish
source $fish_config_dir/env.fish

status is-interactive
and source $fish_config_dir/alias.fish