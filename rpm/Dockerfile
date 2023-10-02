FROM quay.io/centos/centos:stream8

COPY requirements.txt /

RUN dnf install -y rpm-build python3.11 python3.11-pip   \
    && pip3 install -r /requirements.txt

COPY entrypoint.sh /entrypoint.sh
COPY *.j2 /
COPY *.py /


ENTRYPOINT [ "/entrypoint.sh" ]
