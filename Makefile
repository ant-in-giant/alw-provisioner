.PHONY:


all:
	ansible-playbook alw.yml -i "localhost," -K

test:
	ansible-playbook alw.yml -i "localhost," -K -C -D -v


extra:
	ansible-playbook _extra.yml -i "localhost," --tags=extra-packages -K

packages:
	ansible-playbook alw.yml -i "localhost," --tags=packages -K

services:
	ansible-playbook alw.yml -i "localhost," --tags=services -K

dot:
	ansible-playbook alw.yml -i "localhost," --tags=dotfiles


hostname:
	ansible-playbook _hostname.yml -i "localhost," --tags=hostname -K

#dns:
#	ansible-playbook _dnsmasq-auto.yml -i "localhost," --tags=dnsmasq-auto -K

brew:
	ansible-playbook _linuxbrew.yml -i "localhost," --tags=linuxbrew -K

zsh:
	ansible-playbook _zsh.yml -i "localhost," --tags=zsh -K

ij:
	ansible-playbook _intellij-idea.yml -i "localhost," --tags=intellij-idea -K

mkr-ag:
	ansible-playbook _mackerel-agent.yml -i "localhost," --tags=mackerel-agent -e @variables.yaml -K

mkr-pl:
	ansible-playbook _mackerel-plugins.yml -i "localhost," --tags=mackerel-plugins -e @variables.yaml -K

nvm:
	ansible-playbook _nvm.yml -i "localhost," --tags=nvm


help:
	cat Makefile
