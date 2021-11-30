# Python Template

A Python project template for VS Code.

## Requirements

- VS Code (with `Remote - Containers` extension by Microsoft)
- Docker

## Environment Check

At first, build a development container from `.devcontainer/devcontainer.json` using VS Code.

Execute a module.

```sh
$ python -m project_name.sample
Hello World!
```

Test by `pytest`.

```sh
$ python -m pytest tests
===== test session starts =====
platform linux -- Python 3.10.0, pytest-6.2.5, py-1.11.0, pluggy-1.0.0
rootdir: /workspace/TEMP
collected 1 item

tests/test_sample.py .   [100%]

====== 1 passed in 0.01s ======
```
