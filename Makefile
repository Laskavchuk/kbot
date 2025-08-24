APP := $(shell basename $(shell git remote get-url origin))
REGISTRY := ghcr.io/laskavchuk
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
TARGETOS ?= linux
TARGETARCH ?= amd64

# Build configuration
TARGETOS ?= linux
TARGETARCH ?= arm64
CGO_ENABLED ?= 0

format:
	gofmt -s -w ./

lint:
	golint ./...

test:
	go test -v ./...

deps:
	go mod tidy
	go mod download

get:
	go get 

build: format
	CGO_ENABLED=0 GOOS=$(TARGETOS) GOARCH=$(TARGETARCH) go build -v -o kbot -ldflags "-X github.com/Laskavchuk/kbot/cmd.appVersion=$(VERSION)"

clean:
	rm -rf kbot

# Build Docker image
image:
	docker build . -t $(REGISTRY)/$(APP):$(VERSION)-$(TARGETARCH)
push:
	
	docker push $(REGISTRY)/$(APP):$(VERSION)-$(TARGETARCH)
