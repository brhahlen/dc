# `dc` Introduction
`dc` is my custom-made all-in-one control script to control Docker-compose stacks and containers

It is was created for my own purposes, it is by no means perfect, and there are probably a lot of things that are not optimal.

# Goals
- You are able to run the script from anywhere
- You are able to use tab-completion (provided by `dc-completion`)

# Installation
Installing `dc` can be done by executing `bash ./dc install` from the command line.

The following actions will be performed:
- `dc` is copied to `~/bin` and made executable (directory will be created if it doesn't exist)
- `dc-completion` is copied to `$HOME/.bash.completion.d/` (directory will be created if it does not exist)
- `/bin` is added to your path in `~/.bashrc`
- You will be asked where your docker-compose stacks are defined, this will be set into a variable, `DC_DIR` and added to your `~/.bashrc`

Updating can be done by running `dc update`

## Prerequisites
Prerequisites for `dc` are:
 - `tee` is installed
 - `grep` is installed
 - `curl` is installed
 - `wget` is installed
 - `docker compose` plugin is installed
 - `bash-completion` is installed

## Assumptions
There are a few assumptions:
- An environment variable DC_DIR has been set, that contains docker-compose files. If the file does not exist, it assumes that the docker-compose files live in (subdirectories of) ~/docker/
- There is a main environment (`.env`) file, which is located in `${DC_DIR}`/.env
- Each _stack_ has its own `stackname.env` file, in the `${DC_DIR}/<STACK_NAME>/` directory

# Usage
Provides the following main functions:
- up                   - bring up all stacks, an individual stack, or multiple stacks
- down                 - brings down all stacks, an individual stack, or multiple stacks
- restart-stack-hard   - restarts all stacks, an individual stack, or multiple stacks
- restart-stack-soft   - restarts all stacks, an individual stack, or multiple stacks
- logs-stack           - show and follow the logs for a stack, outputs last 100 lines first
- start                - start one or more services
- stop                 - stop one or more services
- restart              - restart one or more services
- pull                 - pulls images
- logs                 - show and follow the logs for a service, outputs last 100 lines first
- network              - _NOT IMPLEMENTED YET_ - create the macvlan network that is needed - *ONLY* possible using `sudo`
- prune                - prunes either images and containers (using the `basic` flag) or the system, including volumes (using the `system` flag)
- install              - installs dc for the current user - *ONLY* possible using `sudo`
- update               - updates `dc` to the latest available version
- version              - shows the version of `dc` and retrieves the latest version and checks there
- list                 - lists all stacks and services in the stack

# Examples
## Used in example
Let's say we have a `DC_DIR` (/home/myname/docker) with the following directories and files:
- 1-backends
  - 1-backends.env
  - docker-compose.yml
- 2-system
  - 2-system.env
  - docker-compose.yml
- 3-frontends
  - 3-frontends.env
  - docker-compose.yml

Each directory contains a `docker-compose.yml` file with a number of different services.<br/>
Additionally, each directory has a <STACK_NAME>.env file, which contains the environment variables that are needed.

## Controlling stacks
Suppose we want to bring up the whole `2-system` stack in one go, we can run `dc up 2-system` and `dc` will run `docker compose up -d` in the background to bring up the stack.

## Controlling containers
Let's say the `3-frontends` stack has a `nginx` and a `wordpress` container. We want to restart the `nginx` container, because we made some changes in the configuration.

From within the directory that the confiugration files are, we can now run `dc restart nginx` to restart (stops and removes the container, and starts it again) and `dc logs nginx` to follow the logs.
