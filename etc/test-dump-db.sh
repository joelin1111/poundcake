#!/bin/bash
./dump-db.sh root TEST
mysql -e "drop database poundcake" mysql
mysql -e "create database poundcake" mysql
mysql < poundcake-TEST.sql