user := env_var('USER')
host := `uname -n`

default:
	@echo "Username: {{ user }}"
	@echo "Hostname: {{ host }}"
	@echo "System: {{ os() }}"
	@just --list

rebuild-system:
	sudo nixos-rebuild switch --flake .#{{ host }}

rebuild-home:
	home-manager switch --flake .#{{ user }}@{{ host }}

stow:
    ls stow/ | xargs stow --restow --dir stow/ --target ~ --dotfiles

unstow:
    ls stow/ | xargs stow --delete --dir stow/ --target ~ --dotfiles

add-package PACKAGE:
    mkdir -p stow/{{PACKAGE}}/dot-config/{{PACKAGE}}
