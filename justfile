default: stow

stow:
    ls stow/ | xargs stow --restow --dir stow/ --target ~ --dotfiles

unstow:
    ls stow/ | xargs stow --delete --dir stow/ --target ~ --dotfiles

add-package PACKAGE:
    mkdir -p stow/{{PACKAGE}}/dot-config/{{PACKAGE}}
