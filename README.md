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
- up      - bring up all stacks, an individual stack, or multiple stacks
- down    - brings down all stacks, an individual stack, or multiple stacks
- start   - start one or more services
- stop    - stop one or more services
- restart - restart one or more services
- network - create the macvlan network that is needed
- list    - lists all stacks and services in the stack

# Thoughts/To Do's
Also, some functions can probably be offloaded into dc-completion at some point?