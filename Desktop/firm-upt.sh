#!/bin/bash


# I use a fedora desktop, so therfore I use dnf for it

sudo dnf update
sudo service fwupd start
sudo fwupd refresh

