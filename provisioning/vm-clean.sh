#!/bin/bash -e

apt-get clean
rm -rf /var/lib/apt/lists/*

rm -rf /var/log/*
#rm -rf /tmp/* /tmp/.I* /tmp/.X*

#rm -f /root/.bash_history

rm -f /vagrant/.bash_history /vagrant/.bash_logout
rm -f /vagrant/.Xauthority /vagrant/.lesshst /vagrant/.root_hist
rm -rf /vagrant/.cache
