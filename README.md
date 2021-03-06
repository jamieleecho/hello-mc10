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
* [bump-info.json](https://github.com/jamieleecho/hello-mc10/blob/main/bump-info.json)
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
* This will generate a new pre-release that you can look at on your repos
  Releases page[here]. You can easily update and finalize this pre-release
  as it will already be configured with a name, tag and built `*.c10` files.
* Look at
  [hello.bas](https://github.com/jamieleecho/hello-mc10/blob/main/hello.bas)
  and observe how the version information in it got updated.

### Where do the MC-10 specific commands come from?
[.github/workflows/build.yml](https://github.com/jamieleecho/hello-mc10/blob/main/.github/workflows/build.yml)
and [.github/workflows/make-release.yml](https://github.com/jamieleecho/hello-mc10/blob/main/.github/workflows/make-release.yml)
utilize the [coco-dev](https://hub.docker.com/r/jamieleecho/coco-dev) docker
image that is defined on GitHub over [here](https://github.com/jamieleecho/coco-dev).

What is [Docker](https://www.docker.com/)? You can think of Docker as a
lightweight mechanism for defining virtual machines that can be defined in one
place and then invoked in many other places. Basically coco-dev is a virtual
machine image that defines a lot of MC-10 and CoCo stuff that GitHub Actions
invokes. Please note that this explanation is simplified a bit to convey
the essence of what is going on.

### Next Steps
Play around with the repo to see what else you can do. For example:
* Try submitting a Pull Request to your new repo (not to the jamieleecho one).
* Check out your repo's Action page.
* What happens when you accept the Pull Request?
* What happens when you add a new `*.bas` file?
* What file do you have to update to update version info in your new `*.bas`
  file?

