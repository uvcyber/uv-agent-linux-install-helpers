# -*- rpm -*-
#

Name:       uvcyber-agent-conf-LOCATION
Version:    VERSION
Release:    1
BuildArch:  noarch
Summary:    UVCyber Bootstrap Configuration
URL:        https://www.uvcyber.com
License:    Proprietary


Requires:   uvcyber-agent

%description
Ultraviolet Endpoint Agent Bootstrap

%post

/opt/uvcyber-agent/bin/uvagentctl register --tenant-id=TENANTID --regcode=REGCODE
systemctl restart uvcyber-agent

%files
