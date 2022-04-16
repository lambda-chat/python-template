import pytest

from package_name.sample import hello


def test_hello() -> None:
    assert hello() == "Hello World!"
