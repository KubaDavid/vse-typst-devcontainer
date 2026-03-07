FROM ghcr.io/typst/typst:0.14.2

ARG TZ
ENV TZ="$TZ"

# Install essential packages (Alpine uses apk)
# libstdc++ and libgcc are required for Claude Code binary
RUN apk add --no-cache \
    zsh \
    git \
    curl \
    sudo \
    fzf \
    bash \
    shadow \
    less \
    nano \
    vim \
    ncurses \
    libstdc++ \
    libgcc

# Rename existing typst user (UID/GID 1000) to vse
# This preserves the UID/GID for proper bind mount permissions
ARG USERNAME=vse
RUN groupmod -n $USERNAME typst && \
    usermod -l $USERNAME -d /home/$USERNAME -m -s /bin/zsh typst && \
    echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME && \
    chmod 0440 /etc/sudoers.d/$USERNAME

# Persist command history
RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.zsh_history" \
    && mkdir /commandhistory \
    && touch /commandhistory/.zsh_history \
    && chown -R $USERNAME /commandhistory

# Set DEVCONTAINER environment variable
ENV DEVCONTAINER=true

# Create workspace and config directories
RUN mkdir -p /workspace /home/$USERNAME/.claude && \
    chown -R $USERNAME:$USERNAME /workspace /home/$USERNAME/.claude

WORKDIR /workspace

# Set up non-root user
USER $USERNAME

# Set the default shell to zsh
ENV SHELL=/bin/zsh

# Set the default editor
ENV EDITOR=nano
ENV VISUAL=nano

# Install zsh with Powerlevel10k theme
ARG ZSH_IN_DOCKER_VERSION=1.2.0
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v${ZSH_IN_DOCKER_VERSION}/zsh-in-docker.sh)" -- \
    -p git \
    -p fzf \
    -a "export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.zsh_history" \
    -x

# Install Claude Code using official curl installer
RUN curl -fsSL https://claude.ai/install.sh | bash

# Add Claude Code to PATH
ENV PATH="/home/vse/.local/bin:${PATH}"

USER $USERNAME
