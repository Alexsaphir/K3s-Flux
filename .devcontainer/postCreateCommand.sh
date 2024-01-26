#!/usr/bin/env fish
set -e
set -o noglob

curl -sL https://git.io/fisher | source fisher install jorgebucaran/fisher
fisher install decors/fish-colored-man
fisher install nickeb96/puffer-fish

aqua i -l

# Setup autocompletions for fish
for tool in cilium flux helm k9s kubectl kustomize talhelper talosctl; do
    $tool completion fish > /home/vscode/.config/fish/completions/$tool.fish
done

stern --completion fish > /home/vscode/.config/fish/completions/stern.fish
yq shell-completion fish > /home/vscode/.config/fish/completions/yq.fish
