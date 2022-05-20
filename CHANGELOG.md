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