# Python Template

A Python project template for VS Code.

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
