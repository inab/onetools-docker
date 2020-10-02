# Docker image with onevm

OpenNebula has a command line toolchest called `onevm`, which is written in Ruby. This repository contains a naïve Dockerfile which creates a container with the toolchest.

## Building

```bash
docker build -t onetools:5.8.5 .
```

## Example usage

```bash
docker run --rm -ti onetools:5.8.5 onevm list --verbose --endpoint http://yourONEfrontend:2633/RPC2 --user yourONEuser --password yourONEpass
```

you can find more information about [onetools here](http://docs.opennebula.io/5.8/operation/references/cli.html) and the [honored environment variables](http://docs.opennebula.io/5.8/operation/users_groups_management/manage_users.html?highlight=one_auth#shell-environment).

## Advanced example

Sometimes you can need to filter by a custom property which is only included in the XML format.
So, the container also contains the [xpath](https://manpages.ubuntu.com/manpages/precise/en/man1/xpath.1p.html) command.

```bash
docker run --rm -ti onetools:5.8.5
onevm list --xml --no-pager http://yourONEfrontend:2633/RPC2 --user yourONEuser --password yourONEpass | xpath -q -e '//VM[./USER_TEMPLATE/LABELS[contains(. , 'customLabel')]]/ID/text()'
```
