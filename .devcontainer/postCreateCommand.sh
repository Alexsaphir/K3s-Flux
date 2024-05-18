#!/usr/bin/env bash
set -e
set -o noglob

# Create the fish configuration directory
mkdir -p /home/vscode/.config/fish/completions
mkdir -p /home/vscode/.config/fish/conf.d

# Add hooks into fish
tee /home/vscode/.config/fish/conf.d/aqua.fish > /dev/null <<EOF
fish_add_path ~/.local/share/aquaproj-aqua/bin
EOF

# Add aliases into fish
tee /home/vscode/.config/fish/conf.d/aliases.fish > /dev/null <<EOF
alias k kubectl
EOF

# Custom fish prompt
tee /home/vscode/.config/fish/conf.d/fish_greeting.fish > /dev/null <<EOF
set fish_greeting
EOF

# Add direnv whitelist for the workspace directory
mkdir -p /home/vscode/.config/direnv
tee /home/vscode/.config/direnv/direnv.toml > /dev/null <<EOF
[whitelist]
prefix = [ "/workspaces" ]
EOF

tee /home/vscode/.config/fish/conf.d/hooks.fish > /dev/null <<EOF
if status is-interactive
    direnv hook fish | source
end
EOF

/usr/bin/fish -c "
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install decors/fish-colored-man
fisher install nickeb96/puffer-fish

aqua i
aqua i -l
"

/usr/bin/fish -c "
for tool in cilium flux helm k9s kubectl kustomize talhelper talosctl
     \$tool completion fish > /home/vscode/.config/fish/completions/\$tool.fish
end

stern --completion fish > /home/vscode/.config/fish/completions/stern.fish
yq shell-completion fish > /home/vscode/.config/fish/completions/yq.fish
"
