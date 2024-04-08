#!/usr/bin/env bash

psql -h 127.0.0.1 -p 5432 -U ${POSTGRES_USER} postgres <<EOF
drop database if exists cmsdb with (FORCE);
create database cmsdb;
EOF
