IMAGE=ghc-infra-hello
VERSION=latest
NAME=test-ghc-infra-hello

setup-when-online:
	docker pull joatmon08/ghc-infra-base:latest

build-and-run:
	docker build -t $(IMAGE):$(VERSION) .
	docker run -d -p 5000:80 --name $(NAME) $(IMAGE):$(VERSION)

build-and-run-solution: clean
	docker build -t $(IMAGE):$(VERSION) -f Dockerfile.solution .
	docker run -d -p 5000:80 --name $(NAME) $(IMAGE):$(VERSION)

test-running:
	inspec exec tests/container

test-hello-ghc:
	inspec exec tests/hello-ghc -t docker://$(NAME)

test: clean build-and-run test-running test-hello-ghc clean

test-solution: build-and-run-solution test-running test-hello-ghc clean

clean:
	docker rm -f $(NAME) || true
	docker rmi -f $(IMAGE):$(VERSION) || true
