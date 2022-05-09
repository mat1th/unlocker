# Unlocker

A tool to unlock your macbook lock screen from the command line. This is mostly useful when connecting remotely to a
mac over `vnc`. Apple does not allow pasting a passport on the lock screen when using `vnc`. This tools will give you 
the possibility to fill in the password to this tool, and unlock your mac with it.

❗️ Currently, this tool is in alfa phase. This will mean that is is not though-fully tested. If you find any bugs 
please submit them.

📚 ✍️ Feel like contributing? Submit an issue with your ideas (or bugs) and we'll discuss it.

## Installation
Using curl:
```
curl -L https://github.com/mat1th/unlocker/releases/download/<current version>/unlocker.zip -o unlocker.zip
unzip unlocker.zip
chmod 775 unlocker
```

## Usage
This tool should be installed on the device you want to unlock.

### Command Line

```
OVERVIEW: Control locking and unlocking of your device using the command-line.

USAGE: unlocker <subcommand>

OPTIONS:
  --version               Show the version.
  -h, --help              Show help information.

SUBCOMMANDS:
  unlock                  Unlock your machine (will ask for your password to unlock)
  lock                    Lock your machine

  See 'unlocker help <subcommand>' for detailed help.
```

## Development

Open the `package.swift` file in xcode to open the project.

## Integrate `UnlockerCore`
The logic for locking and unlocking the lock screen of macos can be found in the `UnlockerCore` package witch can be 
included in your own project

## License

GNU GENERAL PUBLIC LICENSE licensed.
