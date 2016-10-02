#!/bin/bash
ansible-playbook -i ./hosts -b --become-user=root --ask-sudo-pass  ./install-opencv.yaml

