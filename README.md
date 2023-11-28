# Python Template

A Python project template for VS Code.

## Requirements

- VS Code (with `Dev Containers` extension by Microsoft)
- Docker (e.g. [Docker Desktop](https://www.docker.com/products/docker-desktop/))

## Options

- [GitHub CLI](https://cli.github.com/)
- [GNU Privacy Guard; GPG](https://gnupg.org/)

## About Environments

### Easy setup for devcontainer

Linux (incl. WSL2), Mac

```sh
.devcontainer/preCreateCommand.sh
```

Windows

```ps1
PowerShell -ExecutionPolicy RemoteSigned .\.devcontainer\preCreateCommand.ps1
```

If you want to use Github CLI or GnuPG, please modify `.devcontainer/compose.yaml` (and `.devcontainer/Dockerfile`, `.devcontainer/postCreateCommand.sh`).
Then **Reopen Folder in Container** with VS Code extension.

### Check whether this project is correctly recognized

```sh
$ poetry shell  # if needed
$ python -m package_name.sample
Hello World!
```

If you use `poetry install --no-root` instead, you need to move `src/` to execute the module or set `PYTHONPATH` to `src`.

### Test this project by pytest

```sh
$ python -m pytest tests/
===== test session starts =====
platform linux -- Python 3.10.0, pytest-6.2.5, py-1.11.0, pluggy-1.0.0
rootdir: /workspace/WORKSPACE
collected 1 item

tests/test_sample.py .   [100%]

====== 1 passed in 0.01s ======
```

Imports in test file(s) are valid owing to `poetry install` that makes this project be a package. If you do not want to make the package, use `poetry install --no-root` instead, and set `PYTHONPATH` to `src` in some way.

## Notes

- When you uncomment dist/ setting, `dist/` will be empty volume which masks original `dist/` if it exists.
- When you uncomment GPG settings, you cannot commit with GUI if GPG is activated. Use the integrated terminal instead.
- If you already created virtualenvs outside of container, please remove `.venv` before "Reopen Folder in Container".
