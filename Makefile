all:
	ansible-playbook alw-02.yml -i "localhost," -K

test:
	ansible-playbook alw-02.yml -i "localhost," -K -C -D -v


packages:
	ansible-playbook alw-02.yml -i "localhost," --tags=packages -K

dot:
	ansible-playbook alw-02.yml -i "localhost," --tags=dotfiles


zsh:
	ansible-playbook _zsh.yml -i "localhost," --tags=zsh -K

hostname:
	ansible-playbook _hostname.yml -i "localhost," --tags=hostname -K

brew:
	ansible-playbook _linuxbrew.yml -i "localhost," --tags=linuxbrew -K


help:
	cat Makefile
