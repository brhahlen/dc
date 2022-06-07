# Version 1.4.0
## New/Modified Features
- Added options (#20)
- Added (basic) verbosity using the `-v` option (and have completion work as well) (#15)

## Improvements
- Move from `rev | cut | rev` to `basename`
- Renamed `options` to `commands`, as options will be used elsewhere
- Explain why help is shown when invalid or no command is used
- Added error handling when not provding services for `start`, `stop`, `restart`, `logs`