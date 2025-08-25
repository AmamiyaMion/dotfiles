#!/usr/bin/env bash
function sync_files() {
	# environment.d
	cp -vr ~/.config/environment.d .
	# kernel config
	cp -v /usr/src/linux/.config Kconfig
	# dae config
	sudo cp -v /etc/dae/config.dae .
	sudo chown $USER config.dae -v
	# portage world file
	cp -v /var/lib/portage/world .
	# portage config (except gnupg)
	cp -rv /etc/portage . 2> /dev/null
	rm -rf portage/gnupg
	# zshrc
	cp -v ~/.zshrc zshrc
}
function apply_files() {
	# environment.d
	cp -rv ./environment.d ~/.config/
	# kernel config
	sudo cp -v Kconfig /usr/src/linux/.config
	# dae config
	sudo cp -v config.dae /etc/dae/config.dae
	# portage world file
	sudo cp -v world /var/lib/portage/world
	# portage config (except gnupg)
	sudo cp -rv portage /etc/
	# zshrc
	cp ~/.zshrc zshrc
}
case $1 in
	'sync') sync_files;;
	'apply') apply_files;;
	*) echo "Usage: $0 {sync, apply}";;
esac
