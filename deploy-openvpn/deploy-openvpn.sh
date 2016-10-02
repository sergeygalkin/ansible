#!/bin/bash -
if [ -z "$1" ]; then
   echo "Usage $(basename $0) github_user (for set ssh keys from https://github.com/github_user.keys )"
   exit 1
fi
ansible-playbook  -i ./hosts -K -c local  ./deploy-openvpn-local.yaml
#ansible-playbook  -i ./hosts -e github_account=$1  -u root ./deploy-openvpn-server.yaml
