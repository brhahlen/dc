# Version 1.5.1
## Bug fix
- Fixed `.bashrc` quote problem

# Version 1.5.0
## New/Modified Features
- Added `update` function (#30)
- Added support for `docker compose` (#33)

## Improvements
- Moved prerequisite checks to install function, unnecessary to run everytime
- Moved `docker compose` and `docker-compose` checks out of the main script and to installer
- Removed sudo requirement (#34)
- Made bash_completion to be user-based, instead of global

# Version 1.4.0
## New/Modified Features
- Added options (#20)
- Added (basic) verbosity using the `-v` option (and have completion work as well) (#15)

## Improvements
- Move from `rev | cut | rev` to `basename`
- Renamed `options` to `commands`, as options will be used elsewhere
- Explain why help is shown when invalid or no command is used
- Added error handling when not provding services for `start`, `stop`, `restart`, `logs`

# Version 1.3.1
## New/Modified Features
- `logs` now outputs 100 lines of logs, to allow you to catch up

# Version 1.3.0
## New/Modified Features
- `restart-stack` has been renamed to `restart-stack-soft`
- `restart-stack-hard` has been added (basically down/up stack)

# Version 1.2.0
## Fixes
- Fixed error when having two containers with same part of name

# Version 1.1.0
## New features
 - Added ability to view container logs using `dc logs <containername>` command (accepts multiple arguments) - Fixes #31
 - Added ability to view stack-logs using `dc logs <stackname>` command (accepts multiple stack names) - Fixes #31

# Version 1.0.0
This is the 1.0.0 release of `dc` :-)

It contains the main features needed to use `dc`.

Thanks goes out to @mrtnbr for help in testing `dc` and reporting issues and features.

## New features
 - Creating automated releases from tags - #29