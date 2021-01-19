# `dc` Introduction
`dc` is my custom-made all-in-one control script to control Docker-compose stacks and containers

It is was created for my own purposes, it is by no means perfect, and there are probably a lot of things that are not optimal.

# Goals
- You are able to run the script from anywhere
- You are able to use tab-completion (provided by `dc-completion`)

# Installation
The main `dc` script goes into `~/bin` and is used to control docker-compose (dc) stack(s)

The `dc-completion` script goes into `/etc/bash.completion.d/` and provides `<TAB>` autocompletion (or it should)

## Assumptions
There are a few assumptions:
- An environment variable DC_DIR has been set, that contains docker-compose files. If the file does not exist, it assumes that the docker-compose files live in (subdirectories of) ~/docker/
- There is one environment (`.env`) file, which is located in `${DC_DIR}`/.env

# Usage
Provides the following main functions:
- up      - bring up all stacks, an individual stack or a container
- down    - brings down all stacks or an individual stack
- stop    - stops all stacks, an individual stack, or a container
- restart - restart all stacks, a stack, or a container
- network - create the macvlan network that is needed
- list    - lists all stacks and services in the stack

# Thoughts/To Do's
Also, some functions can probably be offloaded into dc-completion at some point?