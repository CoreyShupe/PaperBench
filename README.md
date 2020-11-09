# PaperBench
This is a rust based paper server test-bench.

## Goals
The goals of this project are as follows:
* Allow a user to check if plugins seem to load on a specific spigot/paper version.
* Allow a user to run specific commands and catch errors in the server.
* Find startup errors and general errors from an MC server.
* Properly test if a plugin can be updated to the latest version without going through plugins individually.

## Non-Goals
* Provide a deterministic result for whether or not a specific configuration is good.
* Accurate TPS representations for specific configurations.
* A benchmark for player -> configuration / ram.
* A stress tester.

## Building this program
To build this program you can use commands from the `build.sh` script.<br/>
To build a release version you can use `build.sh --release`.<br/>
This build.sh allows all rust parameters and by default uses `color=always`.<br/>