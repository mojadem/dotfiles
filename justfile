user := env_var('USER')
host := `uname -n`

default:
	@echo "Username: {{ user }}"
	@echo "Hostname: {{ host }}"
	@echo "System: {{ os() }}"
	@just --list

update:
	nix flake update
	nixos-rebuild build --flake .#{{ host }}
	nix store diff-closures /run/current-system ./result

rebuild:
	sudo nixos-rebuild switch --flake .#{{ host }}

stow:
    ls stow/ | xargs stow --restow --dir stow/ --target ~ --dotfiles

unstow:
    ls stow/ | xargs stow --delete --dir stow/ --target ~ --dotfiles

add-package PACKAGE:
    mkdir -p stow/{{PACKAGE}}/dot-config/{{PACKAGE}}
