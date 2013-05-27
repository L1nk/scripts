#!bin/bash

echo ">>>>>>>>>> Generating ssh key <<<<<<<<<<"

ssh-keygen -t rsa -C "l1nk@megaBuster"

echo ">>>>>>>>>> ssh key generated <<<<<<<<<<"

cat ~/.ssh/id_rsa.pub


