# Ruby on Rails running on IBM DB2 Server (Vagrant Ubuntu VM)

## Installation

1. Download and install [Vagrant](https://www.vagrantup.com/downloads.html)
2. Clone this repo
3. cd to the directory containing these files.
4. $ vagrant up
5. $ vagrant ssh


## Post Installation Setup

Install Ruby on Rails with IBM DB2 Adapter

```
gem install ibm_db
gem install rails -v 4.1.9
rails new demo -d ibm_db
```

You will need to manually create your database using:
```
sudo su - db2inst1 -c 'db2 create db demo_dev'
```

Also, point the Rails app to the new database (config/database.yml)

```yaml
adapter: ibm_db
username: db2inst1
password: db2inst1
schema: db2inst1
host: localhost
```

## DB2 SQL Console Tips:

```
sudo su - db2inst1 -c 'db2'
db2 => connect to demo_dev
db2 => list tables
db2 => describe table <table-name>
db2 => quit
```
