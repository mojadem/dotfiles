.PHONY: stow

stow:
	cd stow; stow --restow --target=${HOME} --adopt --dotfiles */

unstow:
	cd stow; stow --delete --target=${HOME} --dotfiles */
