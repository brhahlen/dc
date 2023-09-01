# Version 3.0.0
## BREAKING CHANGE
- Added the use of a stack specific environment file in the `dc` command, next to the "normal" `.env` file that is used by `dc`. It is possible to use empty \<stackname\>.env files, as that will be accepted. Backwards compatibility might be put in later.

## Enhancements
- `list` will now call the proper function
- Development versions will have verbosity enabled by default (that's just for me)
- Major rework to make things more consistent