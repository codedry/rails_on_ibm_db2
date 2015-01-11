#!/bin/sh

set -e

echo "Installing rbenv..."

git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
mkdir ~/.rbenv/plugins
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

echo "install: --no-ri --no-rdoc" >> ~/.gemrc
echo "update: --no-ri --no-rdoc"  >> ~/.gemrc

export PATH="$HOME/.rbenv/bin:$PATH"

echo "Installing Ruby 2.1.5"

rbenv install 2.1.5
rbenv global 2.1.5
rbenv rehash

echo "Install Ruby on Rails with IBM DB2 Adapter..."

gem install ibm_db
gem install rails -v 4.1.9
rails new demo -d ibm_db

cat << EOF
-------------------------------------------------------------------
Installation Complete
-------------------------------------------------------------------

You will need to manually create your database using:
sudo su - db2inst1 -c 'db2 create db demo_dev'

Also, point the Rails app to the new database (config/database.yml)

adapter: ibm_db
username: db2inst1
password: db2inst1
schema: db2inst1
host: localhost


DB2 SQL Console Tips:

sudo su - db2inst1 -c 'db2' # Drops you in the SQL Console
db2 => connect to demo_dev
db2 => list tables
db2 => describe table <table-name>
db2 => quit
-------------------------------------------------------------------
EOF
