ARG PYTHON_VERSION=latest
FROM python:${PYTHON_VERSION}

LABEL "com.github.actions.name"="The Python Action"
LABEL "com.github.actions.description"="A GitHub action for Python projects to run linters and tests"
LABEL "com.github.actions.icon"="check-square"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/Gr1N/the-python-action"
LABEL "maintainer"="Nikita Grishko <gr1n@protonmail.com>"

RUN pip install -U \
    setuptools \
    wheel \
    tox \
    poetry

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
