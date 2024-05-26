# Python Template

A Python project template for VS Code.

## Requirements

- VS Code (with `Dev Containers` extension by Microsoft)
- Docker (e.g. [Docker Desktop](https://www.docker.com/products/docker-desktop/))
- Optional: [GitHub CLI](https://cli.github.com/)

## Dev Environments

If you do not use Github CLI, please modify `.devcontainer/compose.yaml`.
Then **Reopen Folder in Container** with VS Code extension.

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

## Notes

- If you already created virtualenvs outside of Dev Container, please remove `.venv` before "Reopen Folder in Container". It is not compatible with Dev Container environment.
