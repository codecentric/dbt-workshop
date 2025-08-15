FROM mcr.microsoft.com/devcontainers/python:3.11

# Add additional dev dependencies
# Poetry
ENV POETRY_VERSION=2.1.4 POETRY_HOME=/opt/poetry
RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH="$PATH:$POETRY_HOME/bin"

COPY --chown=vscode:vscode .zshrc /home/vscode/.zshrc
