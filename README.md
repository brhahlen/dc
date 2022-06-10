# `dc` Introduction
`dc` is my custom-made all-in-one control script to control Docker-compose stacks and containers

It is was created for my own purposes, it is by no means perfect, and there are probably a lot of things that are not optimal.

# Goals
- You are able to run the script from anywhere
- You are able to use tab-completion (provided by `dc-completion`)

# Installation
Installing `dc` can be done by executing `sudo bash ./dc install` from the command line.

The following actions will be performed:
- `dc` is copied to `~/bin` and made executable (directory will be created if it doesn't exist)
- `dc-completion` is copied to `$HOME/.bash.completion.d/` (directory will be created if it does not exist)
- `/bin` is added to your path in `~/.bashrc`
- You will be asked where your docker-compose stacks are defined, this will be set into a variable, `DC_DIR` and added to your `~/.bashrc`

Updating can be done by running `sudo bash ./dc install` again, it will not perform the additions to `~/.bashrc`

## Prerequisites
Prerequisites for `dc` are:
 - `tee` is installed
 - `grep` is installed
 - `curl` is installed
 - `wget` is installed
 - `docker compose` plugin is installed or `docker-compose` is installed and the version is 1.25.0 or higher
 - `bash-completion` is installed

## Assumptions
There are a few assumptions:
- An environment variable DC_DIR has been set, that contains docker-compose files. If the file does not exist, it assumes that the docker-compose files live in (subdirectories of) ~/docker/
- There is one environment (`.env`) file, which is located in `${DC_DIR}`/.env

# Usage
Provides the following main functions:
- install              - installs dc for the current user - *ONLY* possible using `sudo`
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
- list                 - lists all stacks and services in the stack
- update               - updates `dc` to the latest available version
- version              - shows the version of `dc` and retrieves the latest version and checks there

# Thoughts/To Do's
Also, some functions can probably be offloaded into dc-completion at some point?