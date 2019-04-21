# Running and stuff

- `make build` to build the image.
- `make run` to run the container.

Disables ASLR globally and enables it after container shutdown.
Mounts `~/.tmux.conf` from host.
Mounts current directory into `/dir`.

