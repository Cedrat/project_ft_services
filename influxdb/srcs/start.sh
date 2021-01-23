#!/bin/bash
openrc
touch /run/openrc/softlevel
rc-service influxdb start
rc-service telegraf start
sleep 10
influx -execute 'CREATE DATABASE COLLECTD'
influx -execute "CREATE USER admin WITH PASSWORD 'admin' WITH ALL PRIVILEGES"
tail -f /dev/null
