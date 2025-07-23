#!/bin/bash
ansible-playbook -i inventory deploy-web-server.yml --ask-become-pass
ansible-playbook -i inventory deploy-k8s.yml