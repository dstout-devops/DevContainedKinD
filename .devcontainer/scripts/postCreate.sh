#!/bin/bash
echo "Completed initial container build..."

# create ansible execution environment
ansible-builder build --file .devcontainer/ansible/execution-environment.yml --tag ansible_ee --container-runtime docker --context /var/tmp/context