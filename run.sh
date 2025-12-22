#!/bin/bash

if [ -z "$1" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook.yml
elif [ "$1" == "edit" ]; then
	EDITOR=vim ansible-vault edit --vault-password-file ~/.vaultp group_vars/all.yml
elif [ "$1" == "update-extra" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook.yml --extra-vars "update_system=true"
elif [ "$1" == "update" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook.yml -t update --extra-vars "update_system=true"
elif [ "$1" == "get" -a -n "$2" ]; then
	ansible -i inventory --vault-password-file ~/.vaultp -m setup "$2"
elif [ "$1" == "dns" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook.yml -t zone -l dns
elif [ "$1" == "snmp" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook.yml -t snmp
elif [ "$1" == "share" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook.yml -t share
elif [ "$1" == "docker" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook.yml -t docker
elif [ "$1" == "pwm" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook.yml -t pwm
elif [ "$1" == "packages" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook.yml -t packages
elif [ "$1" == "grafana" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook.yml -t grafana
elif [ "$1" == "vps" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook.yml -l vps
elif [ "$1" == "nas" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook.yml -l nas
elif [ "$1" == "hosting" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook.yml -l hosting
elif [ "$1" == "media-server" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook.yml -l nas -t media_server
elif [ "$1" == "dns-full" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook.yml -l dns
elif [ "$1" == "cluster" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook.yml -l cluster
elif [ "$1" == "cluster-docker" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook.yml -l cluster -t docker
elif [ "$1" == "3dprint" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook.yml -l 3d_printer
elif [ "$1" == "common_only" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook.yml -l common_only
elif [ "$1" == "smart-speaker" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook.yml -l smart_speaker -t smart_speaker
elif [ "$1" == "smart-speaker-full" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook.yml -l smart_speaker
elif [ "$1" == "req" ]; then
	ansible-galaxy install -p roles/ -r roles/requirements.yml
fi

