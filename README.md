# hello-mc10
This project demonstrates how to use GitHub Actions to automate the build
and release process of MC-10 `*.c10` files which are of increasing interest
with the advent of the
[MCX-32 SD](https://thezippsterzone.com/mc-10-items-for-sale/) and
[mcbasic](https://github.com/gregdionne/mcbasic).


## Why Bother
Releasing software reliably involves multiple steps that are time consuming
and laborious. These steps typically involve dependency management,
versinoning, building, testing and releasing. Modern CI/CD frameworks such as
GitHub Actions take care of most of the tedium for you.


## What This Repo Demonstrates
This repo demonstrates how to compile one or more `*.bas` and release the
corresponding `*.c10` files. It provides a mechanism to automatically
version these releases, bumping the version numbers in the `*.bas` files
and keeping the releases in sync with the files.

You can see an examples of the output of this repo
[here](https://github.com/jamieleecho/hello-mc10/releases).


## How It Works
### Workflow Overview
This repo assumes the following GitHub workflow is being used
* The [main branch](https://github.com/jamieleecho/hello-mc10) is where
  the "final" code resides.
* Feature branches are opened whenever a new feature or bug fix is made.
* Feature branches are merged into the main branch via
  [GitHub Pull Requests](https://github.com/jamieleecho/hello-mc10/pulls).
* After the main branch is ready for release, a `Bump and Tag Version Workflow`
  is run on the main branch.
* This generates a 
  [GitHub pre-release](https://github.com/jamieleecho/hello-mc10/releases)
  with the `*.c10` files.

### File Overview
* [.github/workflows/build.yml](https://github.com/jamieleecho/hello-mc10/blob/main/.github/workflows/build.yml)
  -- Runs when there is a commit to a new branch to verify that the build will
  be successful.
* [.github/workflows/bump-version.yml](https://github.com/jamieleecho/hello-mc10/blob/main/.github/workflows/bump-version.yml)
   -- Runs manually via the `Bump and Tag Version Workflow` on the main branch
   to increment the version numbers. 
* [.github/workflows/make-release.yml](https://github.com/jamieleecho/hello-mc10/blob/main/.github/workflows/make-release.yml)
   -- Runs after the `Bump and Tag Version Workflow` is run to create a new
  [pre-release](https://github.com/jamieleecho/hello-mc10/releases).
* [.gitignore](https://github.com/jamieleecho/hello-mc10/blob/main/.gitignore) -- Don't
  check in temporary files.
* [LICENSE](https://github.com/jamieleecho/hello-mc10/blob/main/LICENSE)
  -- MIT License File
* [README.md](https://github.com/jamieleecho/hello-mc10/blob/main/README.md)
  -- This file
* [build.sh](https://github.com/jamieleecho/hello-mc10/blob/main/build.sh)
  -- Bash script that compiles `*.bas` files into `*.c10` files.
* [bump-info.json]
  (https://github.com/jamieleecho/hello-mc10/blob/main/bump-info.json)
  -- Specifies what files have version information that has to be bumped.
* [hello.bas](https://github.com/jamieleecho/hello-mc10/blob/main/hello.bas)
  -- the BASIC file to compile.
* [package.json](https://github.com/jamieleecho/hello-mc10/blob/main/package.json)
  -- Contains the canonical version information.

### Getting Started
* Fork this [repo](https://github.com/jamieleecho/hello-mc10)
* In your account, create a
  [Personal access token](https://github.com/settings/tokens) with read/write
  access to the repo.
* Use this value to create an `ADMIN_TOKEN` via its repository settings.
* View the Actions of the repo and run `Bump and Tag Version Workflow` on the
  main branch.
* This will generate a new pre-release that you can update on the repo's
  Releases page. The pre-release will come preconfigured with a name, tag and
  built `*.c10` files.
