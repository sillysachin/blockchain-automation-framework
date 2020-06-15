#!/bin/bash
set -e

echo "Starting build process..."

echo "Adding env variables..."
export PATH=/root/bin:$PATH

#Path to k8s config file
KUBECONFIG=/home/ocb/build/config


echo "Running the playbook..."
exec ansible-playbook -vv /home/ocb/platforms/shared/configuration/site.yaml --inventory-file=/home/ocb/platforms/shared/inventory/ -e "@/home/ocb/build/network.yaml" -e 'ansible_python_interpreter=/usr/bin/python3' -e "reset='true'"
