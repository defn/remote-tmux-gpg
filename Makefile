SHELL := /bin/bash

first_ = $(word 1, $(subst _, ,$@))
second_ = $(word 2, $(subst _, ,$@))

menu:
	@perl -ne 'printf("%10s: %s\n","$$1","$$2") if m{^([\%\w+-]+):[^#]+#\s(.+)$$}' Makefile

cache:
	mkdir -p etc
	curl -sSL -o etc/nix-install https://nixos.org/nix/install

build_%: # submit argo build job
	argo submit --log -f params.yaml --entrypoint build-$(second_) argo.yaml
