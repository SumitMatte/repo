#!/bin/bash

cd /mnt
sudo mkdir -p /Dir/d1/d2
sudo touch 1.txt
sudo chmod -R o+wx 1.txt
echo "Hello" >> 1.txt
