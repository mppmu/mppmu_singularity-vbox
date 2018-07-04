#!/bin/bash -e

# run as root


locale-gen en_US.UTF-8


HOSTNAME_OLD=`hostname`
HOSTNAME_NEW="virtlinux"

if [ "${HOSTNAME_OLD}" != "${HOSTNAME_NEW}" ] ; then
    if (hostname "${HOSTNAME_NEW}"); then
        echo `hostname` > /etc/hostname
        sed "s|${HOSTNAME_OLD}|${HOSTNAME_NEW}|g" -i /etc/hosts
    else
        echo "Hostname can't be change with this VM type" >&2
    fi
fi


if [ -d /vagrant ] ; then
    cp -a /home/vagrant/.inputrc /root
fi
