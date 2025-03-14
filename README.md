# Python Template

A Python project template for VS Code. These codes are licensed under [CC0](https://creativecommons.org/publicdomain/zero/1.0/) (No Copyright).

**CAUTION**: Please delete or modify the `LICENSE` file if you do not want to set up a CC0 license.

## Requirements

- VS Code (with `Dev Containers` extension by Microsoft)
- Docker (e.g. [Docker Desktop](https://www.docker.com/products/docker-desktop/))
- \[Optional\] [GitHub CLI](https://cli.github.com/)

Install the following tools to WSL2 for CUDA support:

- CUDA Toolkit (12.1 or later)
- cuDNN (9.0.0 or later)
- NVIDIA Container Toolkit (1.14.4 or later)

## Customization

Please change some strings in this repository according to your project.

- `REPOSITORY_NAME`
- `package_name`
- `package-name`

## Dev Environments

Files including optional settings:

- `.devcontainer/compose.yaml` (GitHub CLI, CUDA)

Please configure the settings if needed, then **Reopen Folder in Container** with VS Code extension.

### Notes

- I recommend deleting the `.git` folder first.
- If you already created virtualenvs outside of Dev Container, please delete `.venv` before "Reopen Folder in Container". It is not compatible with Dev Container environment.

### Check whether this project is correctly recognized

```sh
$ poetry run python -m package_name.sample
Hello World!
```

If you use `poetry install --no-root` instead, you need to move `src/package_name` into project root in order to execute the module or set `PYTHONPATH` to `src`.

### Test this project by pytest

```sh
$ poetry run python -m pytest tests/
=============== test session starts ===============
platform linux -- Python 3.12.3, pytest-8.2.1, pluggy-1.5.0
rootdir: /app/REPOSITORY_NAME
configfile: pyproject.toml
collected 1 item

tests/test_sample.py .   [100%]

================ 1 passed in 0.01s ================
```

## Linter/Formatter

Lint:

```sh
ruff check [--fix]
```

Format:

```sh
ruff format
```

## Q&A

### Is it only for VS Code?

No. You can use any other editor/IDE which can attach to a running container. To launch Dev Container, [Dev Container CLI](https://github.com/devcontainers/cli) is very useful. Please check it.

```sh
devcontainer up --workspace-folder .  # this is `docker compose up` alternative
```

### Why do you use in-project virtualenvs in Dev Container?

There are two reasons. First, installing packages to system can affect system python behavior. Second, installing packages to mounted volume saves the packages from container deletion. As for Dev Container, the settings are reasonable, I think.

### No type checking CI support?

Not yet, sorry. It is difficult to prepare CI function due to the difference of behaviors between Pylance extension and Pyright CLI. To handle this issue, I am trying to use [pyright-python](https://github.com/RobertCraigie/pyright-python) and add some type stubs which only Pylance has.

Note: [Python Type Stubs](https://github.com/microsoft/python-type-stubs) may be a supplement for this issue. Please try adding these type stubs dependencies to your CI environment.
