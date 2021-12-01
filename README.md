# Python Template

A Python project template for VS Code.

## Requirements

- VS Code (with `Remote-Containers` extension by Microsoft)
- Docker

## About Environments

At first, build a development container from `.devcontainer/devcontainer.json`, using VS Code. The sample `devcontainer.json` is in `.devcontainer/sample/`. You can customize your development environment by modifying the sample json. See also `.vscode/sample/`.

### Easy setup for devcontainer

```sh
cd .devcontainer
cp sample/devcontainer.json .
cd ../.vscode
cp sample/settings.json .
cd ..
```

After this, reopen this folder in container.

### Check whether this project is correctly recognized

```sh
$ python -m project_name.sample
Hello World!
```

If you use `poetry install --no-root` instead, you need to move `src/` to execute the module or set `PYTHONPATH` to `src`.

### Test this project by pytest

```sh
$ python -m pytest tests/
===== test session starts =====
platform linux -- Python 3.10.0, pytest-6.2.5, py-1.11.0, pluggy-1.0.0
rootdir: /workspace/TEMP
collected 1 item

tests/test_sample.py .   [100%]

====== 1 passed in 0.01s ======
```

Imports in test file(s) are valid owing to `poetry install` that makes this project be a package. If you do not want to make the package, use `poetry install --no-root` instead, and set `PYTHONPATH` to `src` in some way.

## Notes

`dist/` is empty volume which masks original `dist/` if it exists.

## Known issues

If you set `virtualenvs.create` to `false` in `postCreateCommand.sh`, then `poetry install` always updates most packages like this issue [#2079](https://github.com/python-poetry/poetry/issues/2079). As for now, it is set to `true`.

## Production Container

See `.prod/`.
