IMAGE=ghc-infra-hello
VERSION=latest
NAME=test-ghc-infra-hello

install:
	docker pull joatmon08/ghc-infra-base:latest
	bundle install

build-and-run: clean
	docker build -t $(IMAGE):$(VERSION) .
	docker run -d -p 5000:80 --name $(NAME) $(IMAGE):$(VERSION)

test-running:
	inspec exec tests/container

test-hello-ghc:
	inspec exec tests/hello-ghc -t docker://$(NAME)

test: clean test-running test-hello-ghc clean

clean:
	docker rm -f $(NAME) || true
	docker rmi -f $(IMAGE):$(VERSION) || true
