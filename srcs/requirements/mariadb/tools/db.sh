#!/bin/bash

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld