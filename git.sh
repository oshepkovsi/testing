#!/bin/bash

mkdir /git
cd /git/
git init
cd .git/
cd ..
git remote add origin https://github.com/oshepkovsi/testing.git
git pull https://github.com/oshepkovsi/testing.git