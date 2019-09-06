#!/bin/bash

if [ -z "$1" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook.yml
elif [ "$1" == "edit" ]; then
	EDITOR=vim ansible-vault --vault-password-file ~/.vaultp edit group_vars/all.yml
elif [ "$1" == "update-extra" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook.yml --extra-vars "update_system=true"
elif [ "$1" == "update" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook.yml -t update --extra-vars "update_system=true"
elif [ "$1" == "get" -a -n "$2" ]; then
	ansible -i inventory --vault-password-file ~/.vaultp -m setup "$2"
elif [ "$1" == "dns" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook.yml -t zone
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
elif [ "$1" == "hass" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook.yml -t home_assistant
elif [ "$1" == "temp" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook.yml -t temp
elif [ "$1" == "vps" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook.yml -l vps
elif [ "$1" == "flowers" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook.yml -t flowers
elif [ "$1" == "jirichat" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook_jirichat.yml -l jirichat
elif [ "$1" == "baro" ]; then
	ansible-playbook -i inventory --vault-password-file ~/.vaultp playbook.yml -t barometer
elif [ "$1" == "req" ]; then
	ansible-galaxy install -p roles/ -r roles/requirements.yml
fi

