# Basic Docker Commands

## What I Did
I checked my Docker version, pulled the nginx image, and confirmed it
downloaded using `docker images`. I made a container from it, checked
it was running with `docker ps -a`, then stopped, removed, and
deleted the image to clean everything up. I also wrote a small custom
Dockerfile using Alpine Linux.

## Why It Matters
This is the full basic lifecycle of Docker: get an image, run it,
check it, and clean it up. Writing my own Dockerfile also showed me
how to build a custom image from scratch, instead of only using
ready-made ones.

## Files
- `commands.sh` > the commands I ran and their output.
- `Dockerfile` > a small custom image that prints a message when run.
- `screenshot.png` > the proof of practice, here you can check my personal efforts how i successfully do this

**NOTE** for more explaination you can see my main README.md of this repo.
