build: build1604 build1804

install: build install1604 install1804

install1604: build1604
	sed 's/{<UBUNTU_VERSION>}/16.04/' pwncker.template > pwncker1604
	chmod +x pwncker1604
	ln -f -s $$(pwd)/pwncker1604 ${HOME}/.local/bin/pwncker1604

install1804: build1804
	sed 's/{<UBUNTU_VERSION>}/18.04/' pwncker.template > pwncker1804
	chmod +x pwncker1804
	ln -f -s $$(pwd)/pwncker1804 ${HOME}/.local/bin/pwncker1804

build1604:
	(echo 'FROM ubuntu:16.04'; cat Dockerfile.base) | docker build -t pwncker:16.04 -

build1804:
	(echo 'FROM ubuntu:18.04'; cat Dockerfile.base) | docker build -t pwncker:18.04 -

uninstall: clean
	rm ${HOME}/.local/bin/pwncker1604
	rm ${HOME}/.local/bin/pwncker1804
	docker image rm pwncker:16.04
	docker image rm pwncker:18.04

clean:
	rm pwncker1604 pwncker1804 -f
	docker image rm pwncker:16.04
	docker image rm pwncker:18.04
