#!/bin/bash -e

dd if=/dev/zero of=/tmp/zero bs=4096 || true
sync
rm /tmp/zero
