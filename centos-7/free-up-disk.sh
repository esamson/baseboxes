#!/bin/bash
#
# Free up disk space and zero out free space.
# This should help to compact base boxes.

sudo yum clean all

sudo dd if=/dev/zero of=/ZEROES bs=1M
sudo rm /ZEROES

