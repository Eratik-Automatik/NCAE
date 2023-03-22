#!/usr/bin/env bash

update_repo_func() {

# update kali key

sudo wget -q -O - https://archive.kali.org/archive-key.asc | sudo apt-key add

sudo apt update

sudo apt -y upgrade

}


update_repo_func
