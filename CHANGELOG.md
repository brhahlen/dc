# Version 3.1.2
## Bug fix
- Change version number

# Version 3.1.1
## Enhancements
- Updated README

# Version 3.1.0
## Enhancements
- Clean up of code, moved more stuff into functions
- `dc_completion` also needs to adhere to the new env files

## Bug fixes
- Forgot a call to create_env_file function

# Version 3.0.2
## Bug fix
- Forgot to remove `dev` from version

# Version 3.0.1
## Enhancement
- When any of \<stackname\>.env files is not found, `dc` will ask you if it is allowed to create the file(s) for you

# Version 3.0.0
## BREAKING CHANGE
- Added the use of a stack specific environment file in the `dc` command, next to the "normal" `.env` file that is used by `dc`. It is possible to use empty \<stackname\>.env files, as that will be accepted. Backwards compatibility might be put in later.

## Enhancements
- `list` will now call the proper function
- Development versions will have verbosity enabled by default (that's just for me)
- Major rework to make things more consistent

# Version 2.0.4
## Bug Fix
- `help` will now properly render, was missing line breaks

## Other
- Updated Copyright year

# Version 2.0.3
## Enhancement
- `prune system` will now use `--all` to ensure everything is deleted (#53)

# Version 2.0.2
## Bug fixes
- Fixing `logs` not exiting cleanly (#51)

# Version 2.0.1
## Bug fixes
- Hopefully fixing update

# Version 2.0.0
## New Features
- Added `prune` to `dc` and `dc-completion` (#45)

## Improvements / Changes
- Removed compatibility for `docker-compose` (#47)
- Updated documentation (#44)
- Used linter to optimize/improve code
- Cleanup

## Bug fixes
- None

# Version 1.6.0
## New Features
- Added `update` to dc-completion

## Improvements
- Step back to previous directory after update
- Moved `version` to own function `show_version`, for consistency
- Moved `update` to own function `update`, for consistency
- Made the unzipping during the update quiet
- Added version to `dc-completion`

## Bug fixes
- Fixed getting containers in stacks, due to #46

# Version 1.5.5
## Bug fixes
- Update process bugfix

# Version 1.5.4
## Bug fixes
- printf bug fixed

## Improvements
- Update process changed a bit, trying to squash a weird bug

# Version 1.5.3
## Improvements
- Code Cleanup
- Added consistency in `printf` vs `echo` (#38)

# Version 1.5.2
## New/Modified Features
- Added `help` as a supported function (#39)

## Improvements
- Code cleanup

## Bug fixes
- Fixed issue with `dc-completion` (#40)

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