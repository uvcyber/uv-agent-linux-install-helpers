#!/bin/bash

SPEC_PATH=${SPEC_PATH:=/root/rpmbuild/SPECS}

[[ -d $SPEC_PATH ]] || mkdir -p $SPEC_PATH

python3 /renderspec.py $*

for i in $SPEC_PATH/*.spec; do
	rpmbuild -bb $i
done
