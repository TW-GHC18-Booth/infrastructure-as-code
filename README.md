# Thoughtworks Grace Hopper Celebration: Infrastructure-as-Code
Exercise for Infrastructure-as-Code using Docker.

## Objectives
This is an exercise to demonstrate how one can use Docker containers
to host a simple application and roll out a new image each time you want
to make updates to the application.
* Demonstrate how to deploy an application using containers
* Demonstrate how you can test the contents of your container

## Introduction
Infrastructure can be pretty difficult to understand! If you've ever deployed an
application to the cloud, what are the dependencies you need to
install? Sometimes, there are tools that can abstract it all away.

It's important to treat infrastructure as code. Here, we'll demonstrate
what that might look like and how you can test the infrastructure itself.

## Premise
I have a simple HTML page that I should be able to access
when I run it on my laptop.

![Image of Expected Web Page](answers-no-peeking/application_landing_page.png)

The tricky part is that I want to be able to:
* Give it to your friend to run on their laptop.
* Run it on a public cloud provider.
* Run this application on a Raspberry Pi.

This is where container technologies like Docker are useful!
You can bake in all of your dependencies so no need to run
installation commands on your terminal and distribute it to
your friends and various systems.

## Setup and Overview
1. If you are setting this up on your own laptop, see the `Dependencies to Install` section, below.
1. Take a look at the directory structure of the repo:
    * `src` - Source files for the application to be deployed to a container
    * `tests`- Container and application infrastructure tests
    * `answers-no-peeking`- makefile and Dockerfile with the answers to this exercise (no peeking!)

## Getting Started and Clues!
Let's do some test-driven development and run the tests first - maybe
they'll give us some clues.

1. There are two sets of tests under the `tests` directory.
    * The `container` tests check to make sure the application container
      has started.
    * The `hello-ghc` tests check that dependencies are installed and the
      application content is loaded into the container.
1. Your challenge is to make changes to two files in the root
directory so that your container and application infrastructure tests pass:
    * `Dockerfile` - the 'recipe' for configuring your application in a container
    * `makefile` - defines commands to build, run and test your container
1. First, run the container locally and view the web page at `http://localhost:5000`.
   ```
   $ make build-and-run
   ```
   *Hint: Are there any pieces of your application that are not in the container?*
1. Run the tests. See which ones pass and fix the ones that fail!
   ```
   $ make test
   ```
   *Hint: In your makefile, is there something missing? (When you run `make test`, the container needs to be running in order for the first test to pass.)*

You might find these resources helpful:
* [Dockerfile Commands](https://docs.docker.com/engine/reference/builder/)

## Dependencies to Install
You will need to install:
* [Docker](https://docs.docker.com/install/)
* [Ruby](https://www.ruby-lang.org/en/documentation/installation/)

Then, run:
```
make install
```
