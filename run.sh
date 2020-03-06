#!/bin/bash

echo 0 | sudo tee /proc/sys/kernel/randomize_va_space &&
docker run --rm --cap-add=SYS_PTRACE --name pwncker -it \
		   -v $(pwd):/dir \
		   $* \
		   pwncker

echo 2 | sudo tee /proc/sys/kernel/randomize_va_space
