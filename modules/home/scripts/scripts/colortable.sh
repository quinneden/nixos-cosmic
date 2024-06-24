#!/usr/bin/env bash

python -c "print('\t'.join(f'\u001b[1;38;5;{s}m{s.ljust(4)}' + ('\n' if not int(s) % 8 else '') for s in (str(i) for i in range(256))) + '\u001b[0m')"
