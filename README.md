# uv-agent-linux-install-helpers

Tools to help automate installation of the UV Agent on Linux systems

## rpm

Helpers to build a secondary RPM that depends on the first and helps with enrollment and
provisioning.  These are nothing fancy, but make automated deployment a little easier.


Build the docker image:

```
cd rpm
docker build -t uv-builder .
```

Update the configuration file.  The format is yaml and it should be relatively obvious
how it's supposed to work.  Let me (Duane) know if not.

Run the builder:

```
docker run --rm -it -v ./rpmbuild:/root/rpmbuild -v ./input.yaml:/input.yaml uv-builder:latest
```

You'll have new RPMs in the `./rpmbuild` directory.

## more to come
