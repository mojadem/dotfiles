user := env_var('USER')
host := `uname -n`

default:
	@echo "Username: {{ user }}"
	@echo "Hostname: {{ host }}"
	@echo "System: {{ os() }}"
	@just --list

update:
	nix flake update
	@just _build-{{os()}}
	nix store diff-closures /run/current-system ./result

_build-linux:
	nixos-rebuild build --flake .#{{ host }}

_build-macos:
	darwin-rebuild build --flake .#{{ host }}

rebuild:
	@just _rebuild-{{os()}}

_rebuild-linux:
	sudo nixos-rebuild switch --flake .#{{ host }}

_rebuild-macos:
	sudo darwin-rebuild switch --flake .#{{ host }}

stow:
    ls stow/ | xargs stow --restow --dir stow/ --target ~ --dotfiles

unstow:
    ls stow/ | xargs stow --delete --dir stow/ --target ~ --dotfiles

add-package PACKAGE:
    mkdir -p stow/{{PACKAGE}}/dot-config/{{PACKAGE}}
