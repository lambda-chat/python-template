def hello() -> str:
    return "Hello World!"


if __name__ == "__main__":
    import sys

    print(hello(), file=sys.stderr)
