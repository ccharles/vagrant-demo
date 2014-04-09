#!/usr/bin/env bash

# Update the system
yum -y update

# Install Python and PIP
yum -y install python
yum -y install python-pip

# Install PostgreSQL and its headers
yum -y install postgresql
yum -y install postgresql-server
yum -y install postgresql-devel
