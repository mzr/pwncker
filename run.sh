#!/bin/bash

echo 0 | sudo tee /proc/sys/kernel/randomize_va_space &&
docker run --rm --cap-add=SYS_PTRACE --name pwndbg -it \
		   -v $(pwd):/dir \
		   -v ~/.tmux.conf:/root/.tmux.conf \
		   pwndbg:xenial

echo 2 | sudo tee /proc/sys/kernel/randomize_va_space
