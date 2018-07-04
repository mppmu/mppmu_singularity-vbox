#!/bin/bash -e

TARGET_PATH="$1"

if [ -z "${TARGET_PATH}" ] ; then
	echo "Syntax: $0 TARGET_PATH" >&2
	exit 1
fi

echo "Packaging VM to \"${TARGET_PATH}\""

TARGET_DIR=`dirname ${TARGET_PATH}`
mkdir -p "${TARGET_DIR}"

echo "Starting VM ..."
vagrant up default

echo "Cleaning up VM ..."

vagrant ssh default -- 'sudo /vagrant/provisioning/vm-clean.sh'

echo "Zeroing unused VM disk space ..."
vagrant ssh default -- 'sudo /vagrant/provisioning/vm-zero-free.sh'

echo "Stopping VM ..."
vagrant halt default

echo "Exporting VM ..."

VBOX_VM_ID=`cat .vagrant/machines/default/virtualbox/id`

echo "Removing shared folders from VM ..."
VBoxManage sharedfolder remove "${VBOX_VM_ID}" --name "vagrant"

echo "Exporting Vagrant base box ..."
vagrant package default --output "${TARGET_PATH}.box"

echo "Exporting Virtualbox OVA ..."
VBoxManage export "${VBOX_VM_ID}" --output "${TARGET_PATH}.ova"
chmod 644 "${TARGET_PATH}.ova"

echo Successfuly packaged VM as "\"${TARGET_PATH}"'.{box,ova}'"\""
