#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
# SPDX-FileCopyrightText: 2024 Concurrent Technologies Corporation (CTC)

def greet(name):
    """Greet someone by their name."""
    print(f"Hello, {name}!")


if __name__ == "__main__":
    name_input = input("Enter your name: ")
    greet(name_input)
