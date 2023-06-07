# Vera's C Template

This is my C project template, which i use as the foundation for my every C project.

> Version 0.1.0

## Building the project

Change the `PROJECT` variable to your projects name in the `makefile`, this will also be the name of the outputed binary executable. Then prepare the project structure by calling `make init`. You only need to do this once when you clone the repo.

```shell
$ make init
```

Afterwards call `make` to build and run the project, if you only want to build the project just call `make build`.

```shell
# Builds then runs the project
$ make

# Just builds the project
$ make build
```

You can also use the `make clean` command to clean the target directory for a clean build.

## Adding new folders

If you wish to add new folders to build path append folder's path to `SRCDIRS` in `makefile`, and create the same folder in `target` directory. Folder hierarchy in `target/src` has to be identical to `src`. 