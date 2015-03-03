#!/bin/bash

swapoff -v /dev/mapper/centos-swap
lvm lvresize --force /dev/mapper/centos-root -L -1024M
lvm lvresize /dev/mapper/centos-swap -L +1024M
mkswap /dev/mapper/centos-swap
swapon -va

