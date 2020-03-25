# Running and stuff

- `make build` to build the images, with base image set as ubuntu 16.04 and 
ubuntu 18.04.
- `make install` to create convenience scripts runnig both pwncker:16.04 and
pwncker:18.04. This command also creates symlinks to these script in
`$HOME/.local/bin/`.

Scripts sarting containers:
- disable ASLR globally and enable it after container shutdown.
- mount current directory into `/dir`.
- let you pass additional arguments as if you would run `docker run ...`.

Run with `pwncker1604`, or `pwncker1804`.
