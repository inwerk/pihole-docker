# My personal Pi-hole setup
[Pi-hole](https://pi-hole.net/) setup using Docker.


**1. Install Docker**

This [Docker installation script](https://github.com/inwerk/docker-debian/) is based on the [installation instructions for Debian-based systems](https://docs.docker.com/engine/install/debian/) from the official Docker documentation. For other platforms, refer to the corresponding instructions from the [Docker documentation](https://docs.docker.com/engine/install/).
```bash
curl -sSL https://raw.githubusercontent.com/inwerk/docker-debian/master/install-docker.sh | sudo bash
```


**2. Install Pi-hole**

Script for installing/updating a Pi-hole Docker image. You can replace `/mnt/data` with your preferred file path.
```bash
curl -sSL https://raw.githubusercontent.com/inwerk/pihole-docker/master/install-pihole.sh | sudo bash -s -- /mnt/data
```

The password for the Admin interface will be displayed in the terminal.

