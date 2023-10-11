FROM mcr.microsoft.com/devcontainers/python:3.9

# Add additional dev dependencies
# Poetry
ENV POETRY_VERSION=1.5.1 POETRY_HOME=/opt/poetry
RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH="$PATH:$POETRY_HOME/bin"

COPY --chown=vscode:vscode .zshrc /home/vscode/.zshrc
