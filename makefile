IMAGE=ghc-infra-hello
VERSION=latest
NAME=test-ghc-infra-hello

setup-when-online:
	docker pull nginx:1.15.2-alpine

build-and-run:
	docker build -t $(IMAGE):$(VERSION) .
	docker run -d -p 5000:80 --name $(NAME) $(IMAGE):$(VERSION)

test-running:
	inspec exec profiles/container

test-hello-ghc:
	inspec exec profiles/hello-ghc -t docker://$(NAME)

test: clean test-running test-hello-ghc clean

clean:
	docker rm -f $(NAME) || true
	docker rmi -f $(IMAGE):$(VERSION) || true
