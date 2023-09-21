#!/bin/bash

#rpmbuild -bb /root/rpmbuild/SPECS/uvcyber-agent-zugzwang.spec
INPUT_FILE=${INPUT_FILE:=./input.txt}
TEMPLATE=${TEMPLATE:=./spec-template.m4}
SPEC_PATH=${SPEC_PATH:=/root/rpmbuild/SPECS}

[[ -d $SPEC_PATH ]] || mkdir -p $SPEC_PATH

while read -r LOCATION VERSION TENANTID REGCODE ; do

    NEWSPEC=$SPEC_PATH/uvcyber-agent-bootstrap-$LOCATION.spec
    m4 -D LOCATION="$LOCATION"      \
       -D VERSION="$VERSION"        \
       -D TENANTID="$TENANTID"      \
       -D REGCODE="$REGCODE"        \
       $TEMPLATE > $NEWSPEC

    rpmbuild -bb $NEWSPEC

    
done < "$INPUT_FILE"
