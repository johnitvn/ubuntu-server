# ubuntu-sshd

Dockerized SSH service, built on top of [official Ubuntu](https://registry.hub.docker.com/_/ubuntu/) images.


## Installed packages

Image specific:
- [openssh-server](https://help.ubuntu.com/community/SSH/OpenSSH/Configuring)

Config:

  - `PermitRootLogin yes`
  - `UsePAM no`
  - exposed port 22
  - default command: `/usr/sbin/sshd -D`
  - username: `admin`
  - password: `admin`

## Run example

```
version: "3.3"  
services:
  ubuntu:
    container_name: ubuntu-server
    image: johnitvn/ubuntu-server
```


## Issues

If you run into any problems with this image, please check (and potentially file new) issues on the [johnitvn/ubuntu-server](https://github.com/johnitvn/ubuntu-server) repo, which is the source for this image.
