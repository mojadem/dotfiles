# AGENTS.md

This repository is a Nix flake for a personal system configuration. It manages both OS (NixOS, nix-darwin) and program config (home-manager).

Four hosts are managed:
1. `heart`: Personal MacBook
2. `club`: NixOS workstation
3. `diamond`: Work MacBook
4. `spade`: NixOS Mini PC (kiosk/server)

Program configuration is symlinked to its destination via home-manager. Prefer declarative configuration over imperative.
