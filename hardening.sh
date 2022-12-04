#!/bin/bash

osss=$(hostnamectl)
if echo "$osss" | grep 'CentOS';
then
        echo "Estas en CentOS"
        operativo=("CentOS")
elif echo "$osss" | grep 'Ubuntu';
then
        echo "Estas en Ubuntu"
        operativo=("Ubuntu")
fi


if [[ $operativo == "CentOS" ]];
then
  virus=$(yum list install)
  if echo "$virus" | grep clamav;
  then
    sudo yum remove install clamav-server clamav-data clamav-update clamav-filesystem clamav clamav-scanner-systemd clamav-devel clamav-lib clamav-server-systemd
  fi
  sudo yum -y install clamav-server clamav-data clamav-update clamav-filesystem clamav clamav-scanner-systemd clamav-devel clamav-lib clamav-server-systemd

yum install epel-release

yum install updates

elif [[ $operativo == "Ubuntu" ]];
then
  virus=$(apt -qq list clamav)
  if echo "$virus" | grep clamav;
  then
    sudo apt-get remove clamav clamav-daemon
  fi
  sudo apt-get install clamav clamav-daemon

apt-get update
apt-get upgrade

fi

echo "Script terminado"
