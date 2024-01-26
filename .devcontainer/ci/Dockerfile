FROM mcr.microsoft.com/devcontainers/base:alpine3.19

ARG USER=vscode

COPY features/install.sh /tmp/

RUN bash /tmp/install.sh && rm /tmp/install.sh
