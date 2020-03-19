#!/bin/bash

echo 0 | sudo tee /proc/sys/kernel/randomize_va_space &&
docker run --rm --cap-add=SYS_PTRACE --name pwncker1604 -it \
		   -v $(pwd):/dir \
		   $* \
		   pwncker1604

echo 2 | sudo tee /proc/sys/kernel/randomize_va_space
