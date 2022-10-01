# My Dev Env setup

## Who is this document for?

## Prerequisites

## Python

I try to avoid using things like pytenv or virtualenv. They work ok but one they
get messed up its just really annoying. Roll your own using some linux sense. 

> To set things up so that python gets you the new version but everyone else, including the standard OS programs, will get the original:

choose a directory to hold your personal programs (or symlinks to them). This could be $HOME/bin or /usr/local/bin, whatever you like. Create it if it doesn't exist. I'll use $HOME/bin in this example.

Edit your ~/.profile. On Ubuntu 14.04, it likely already contains a line that says PATH="$HOME/bin:$PATH", which will put this directory at the front of your search path. If not, add that line.

run ln -s /usr/local/bin/python2.7 $HOME/bin/python

logout, login, type which python to verify that the shell is finding the (symlink) python in your $HOME/bin directory. Type python --version to verify that you're getting the new version.

You're already doing a good thing by having your scripts start with the line #!/usr/bin/env python rather than #!/usr/bin/python. The env command will look through your search path to find python.

---

Thats from [this SO post](https://unix.stackexchange.com/questions/190724/how-can-i-set-up-using-a-different-version-of-python-from-the-os)

- I get the tarball from python.org

- Build the source 

```
./configure
make
make installalt
```

- sudo ln -s /usr/local/bin/python3.7 /usr/local/bin/python3

- sudo ln -s /usr/local/bin/python3.7 /usr/local/bin/python

### Anaconda Install

For data analysis workloads you are going to install Anaconda, probably. 

Get the .sh install file from their website

I took the default install path

I don't want to be in conda everytime I open a terminal (wtf?!?), so in bash, run

```
conda config --set auto_activate_base false

```

Then conda init for bash and fish (if you have it installed)

```
conda init bash fish

```

## Setting up .zsh

## Setting up neovim

## Setting up tmux

For restoring tmux sessions (its painful to loose them)
https://herusetiawan.id/posts/how-to-save-tmux-session/
https://github.com/tmux-plugins/tmux-resurrect


## Using Git to track you configuration files

## VIM tips 

To copy and paste in/out of system clipboard

```
"*y
"*p
```

When you run a compiler or linter and are presented with errors in a quick fix buffer, you can run :cn to go to the next error. 

## Summary
