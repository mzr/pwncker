# Running and stuff

- `make build` to build the image.
- `./run.sh` to run the container.

Disables ASLR globally and enables it after container shutdown.
Mounts current directory into `/dir`.

Convenient symbolic link:
`ln -s run.sh $HOME/.local/bin/pwncker`

Then run with `pwncker`
