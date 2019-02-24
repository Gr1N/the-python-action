# the-python-action

A GitHub action for Python projects to run linters and tests.

Supports any Python version you'll give it, just find a valid tag on [Docker Hub](https://hub.docker.com/_/python).

By default includes:

* [tox](https://tox.readthedocs.io/en/latest/)
* [poetry](https://poetry.eustace.io/)

Not exactly what you're looking for? Feel free to fork and send me a pull request!

## Use

Doesn't take any arguments.

### Environment Variables

* `PYTHON_VERSION`: a Python version that can be found on [Docker Hub](https://hub.docker.com/_/python). Default: `latest`

### Example workflow

    workflow "Run linters and tests" {
      on = "push"
      resolves = [
        "py3.7> linting> black",
        "py3.7> testing",
      ]
    }

    action "py3.7> linting> black" {
      uses = "Gr1N/the-python-action@master"
      args = "tox -e py37-black"
      env = {
        PYTHON_VERSION = "3.7.2"
      }
    }

    action "py3.7> testing" {
      uses = "Gr1N/the-python-action@master"
      args = "poetry install && poetry run pytest"
      env = {
        PYTHON_VERSION = "3.7.2"
      }
    }
