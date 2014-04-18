#!/usr/bin/env bash

# Update the system
yum -y update

# Install Python, PIP, and the Python headers
yum -y install python
yum -y install python-pip
yum -y install python-devel

# Install PostgreSQL and its headers
yum -y install postgresql
yum -y install postgresql-server
yum -y install postgresql-devel

# Start PostgreSQL
service postgresql initdb
service postgresql start

# The createuser utility does not accept an argument to set a user's
# password, so we use CREATE ROLE instead.
sudo -u postgres psql -c "CREATE ROLE vagrant WITH ENCRYPTED PASSWORD 'vagrant' NOSUPERUSER NOCREATEDB NOCREATEROLE INHERIT LOGIN"
sudo -u postgres createdb -E UTF8 -l en_US.utf8 -T template0 -O vagrant vagrant

# Install Python libraries system-wide
#
# This can also be done "locally", for one application, using a system called
# virtualenv. To keep things simple we're not going to use virtualenv at the
# moment, but we might well come back to it later.
pip install -r /vagrant/requirements.txt
