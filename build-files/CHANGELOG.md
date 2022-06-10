# Version 1.5.0
## New/Modified Features
- Added `update` function (#30)
- Added support for `docker compose` (#33)

## Improvements
- Moved prerequisite checks to install function, unnecessary to run everytime
- Moved `docker compose` and `docker-compose` checks out of the main script and to installer
- Removed sudo requirement (#34)
- Made bash_completion to be user-based, instead of global