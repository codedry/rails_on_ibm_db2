#!/usr/bin/env bash

cat << SOURCES > /etc/apt/sources.list.d/partner-ppa.list
deb http://archive.canonical.com/ubuntu precise partner
deb-src http://archive.canonical.com/ubuntu precise partner
SOURCES

echo -e "Updating packages list..."
apt-get update
echo -e "Install packages..."
apt-get install -y build-essential  \
                   vim              \
                   tmux             \
                   git-core         \
                   db2exc           \
                   libreadline-dev  \
                   libssl-dev       \
                   zlib1g-dev       \
                   libxml2-dev      \
                   libxslt-dev      \
                   nodejs

locale-gen en_US

echo -e "Upgrading packages..."
apt-get upgrade -y
apt-get clean -y

echo -e "Change database user db2inst1 password to db2inst1..."
echo -e "db2inst1\ndb2inst1" | passwd db2inst1 -q

echo -e "Installing sample database..."
su db2inst1 << EOF
  /home/db2inst1/sqllib/bin/db2sampl
  /home/db2inst1/sqllib/bin/db2 -p 'attach to db2inst1'
  /home/db2inst1/sqllib/bin/db2 -p 'get dbm cfg show detail'
EOF
