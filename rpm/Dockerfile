FROM quay.io/centos/centos:stream8

RUN dnf install -y rpm-build m4

COPY build.sh /build.sh
COPY spec-template.m4 /spec-template.m4

ENTRYPOINT [ "/build.sh" ]
