# Unlocker

A tool to unlock your macbook lock screen from the command line. This is mostly usefull when connecting remotely to a
mac over `vnc`. Apple does not allow pasting a passport on the lock screen when using `vnc`. This tools will give you 
the posibilaty past the password to this tool, and unlock your mac with it.

## Installation
Using homebrew:
```
brew install mat1th/unlocker
```

## Usage
This tool should be installed on the divice you want to unlock.

### Command Line

```
OVERVIEW: Controll locking and unlocking of your device with the command line.

USAGE: unlocker <subcommand>

OPTIONS:
  --version               Show the version.
  -h, --help              Show help information.

SUBCOMMANDS:
  unlock                  Unlock your machine (will ask for your password to unlock)
  lock                    Lock your machine

  See 'unlocker help <subcommand>' for detailed help.
```
