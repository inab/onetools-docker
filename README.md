# Docker image with onevm

OpenNebula has a command line toolchest called `onevm`, which is written in Ruby. This repository contains a naïve Dockerfile which creates a container with the toolchest.

## Building

```bash
docker build -t onetools:5.8.5 .
```

## Usage

```
docker run --rm -ti onetools:5.8.5 onevm list --verbose --endpoint http://yourONEfrontend:2633/RPC2 --user yourONEuser --password yourONEpass
```

you can find more information about onetools [here](http://docs.opennebula.io/5.8/operation/references/cli.html).