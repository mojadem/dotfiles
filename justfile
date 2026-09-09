host := `uname -n`

default:
    @echo "Hostname: {{ host }}"
    @echo "System: {{ os() }}"
    @just --list

update:
    nix flake update
    nix flake check
    @just diff

diff:
    @just _build-{{ os() }}
    nix store diff-closures /run/current-system ./result

_build-linux:
    nixos-rebuild build --flake .#{{ host }}

_build-macos:
    darwin-rebuild build --flake .#{{ host }}

rebuild:
    @just _rebuild-{{ os() }}

_rebuild-linux:
    sudo nixos-rebuild switch --flake .#{{ host }}

_rebuild-macos:
    sudo darwin-rebuild switch --flake .#{{ host }}

rebuild-boot:
    sudo nixos-rebuild boot --flake .#{{ host }}

stow:
    ls stow/ | xargs stow --restow --dir stow/ --target ~ --dotfiles

unstow:
    ls stow/ | xargs stow --delete --dir stow/ --target ~ --dotfiles

mk-package PACKAGE:
    mkdir -p stow/{{ PACKAGE }}/dot-config/{{ PACKAGE }}

rm-package PACKAGE:
    stow --delete --dir stow/ --target ~ --dotfiles {{ PACKAGE }}
    rm -rf stow/{{ PACKAGE }}

sync-pi-deps:
    version="$(pi --version)" && \
    nix shell --inputs-from . nixpkgs#nodejs --command npm \
        --prefix modules/home/programs/pi install \
        --save-dev --save-exact \
        "@earendil-works/pi-ai@$version" \
        "@earendil-works/pi-coding-agent@$version" \
        "@earendil-works/pi-tui@$version" \
        --no-package-lock --ignore-scripts --no-audit --no-fund
