# docker-smbpasswd

Change the Active Directory password for a username using Docker.

## Requirements

* [Docker](https://www.docker.com/get-docker)

## Usage

The container can be run using the following command:

    docker run --interactive --rm sgerrand/smbpasswd USERNAME DOMAIN

This will cause the password for `USERNAME` to be changed in the `DOMAIN` Active
Directory domain.

### Required values

* Docker flags: `-i` or `--interactive` is required, otherwise your password
  can't be entered securely.
* Input parameters: Both the `USERNAME` and `DOMAIN` values are required.
