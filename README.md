# Ruby on Rails running on IBM DB2 Server (Vagrant Ubuntu VM)

## Installation

1. Download and install [Vagrant](https://www.vagrantup.com/downloads.html)
2. Clone this repo
3. cd to the directory containing these files.
4. $ vagrant up
5. $ vagrant ssh
6. Install rbenv

  ```
  git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
  mkdir ~/.rbenv/plugins
  git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(rbenv init -)"' >> ~/.bashrc

  echo "install: --no-ri --no-rdoc" >> ~/.gemrc
  echo "update: --no-ri --no-rdoc"  >> ~/.gemrc

  exec $SHELL
  ```

7. Install Ruby

  ```
  rbenv install 2.1.5
  rbenv global 2.1.5
  rbenv rehash
  ```

8. Install Ruby on Rails / IBM DB2 Adapter

  ```
  gem install ibm_db
  gem install rails -v 4.1.9
  rails new demo -d ibm_db
  ```

9. Create a database

  ```
  sudo su - db2inst1 -c 'db2 create db demo_dev'
  ```

10. Point the Rails app to the new database (`config/database.yml`)

  ```yaml
  default: &default
    adapter: ibm_db
    username: db2inst1
    password: db2inst1
    schema: db2inst1
    host: localhost
  ```

## DB2 SQL Console Tips

```
sudo su - db2inst1 -c 'db2'
db2 => connect to demo_dev
db2 => list tables
db2 => describe table <table-name>
db2 => quit
```
