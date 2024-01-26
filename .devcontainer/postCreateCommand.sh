#!/usr/bin/env bash
set +e
set -o noglob

/usr/bin/fish -c "
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install decors/fish-colored-man
fisher install nickeb96/puffer-fish

set -xg AQUA_GLOBAL_CONFIG /workspaces/K3s-Flux/aqua.yaml
aqua i
aqua i -l

/usr/bin/fish -c "
for tool in cilium flux helm k9s kubectl kustomize talhelper talosctl
     $$tool completion fish > /home/vscode/.config/fish/completions/$$tool.fish
end

stern --completion fish > /home/vscode/.config/fish/completions/stern.fish
yq shell-completion fish > /home/vscode/.config/fish/completions/yq.fish
"


# Setup autocompletions for fish
