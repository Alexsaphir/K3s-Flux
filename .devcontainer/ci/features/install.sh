#!/usr/bin/env bash
set -e

apk add --no-cache bash bind-tools ca-certificates curl \
                    moreutils iputils openssh-client \
                    fish

# Install aqua
cd /home/vscode
export AQUA_ROOT_DIR=/home/vscode/.aqua
export PATH=$AQUA_ROOT_DIR/bin:$PATH
curl -sSfL https://raw.githubusercontent.com/aquaproj/aqua-installer/v2.2.0/aqua-installer | bash

# Create the fish configuration directory
mkdir -p /home/vscode/.config/fish/completions
mkdir -p /home/vscode/.config/fish/conf.d

# Add hooks into fish
tee /home/vscode/.config/fish/conf.d/hooks.fish > /dev/null <<EOF
if status is-interactive
    set -xg AQUA_ROOT_DIR /home/vscode/.aqua
    set -xg AQUA_GLOBAL_CONFIG ~/.aqua.yaml
    fish_add_path $AQUA_ROOT_DIR/bin

    direnv hook fish | source
end
EOF

# Add aliases into fish
tee /home/vscode/.config/fish/conf.d/aliases.fish > /dev/null <<EOF
alias ls lsd
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

# Set ownership vscode .config directory to the vscode user
chown -R vscode:vscode /home/vscode/.config
chown -R vscode:vscode /home/vscode/.aqua
