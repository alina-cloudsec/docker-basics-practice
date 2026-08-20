# Docker Networks

## What I Did
I created a custom network, then ran a container attached to it with
two environment variables set. I used `docker network inspect` to
prove the container was really connected to that network, with its
own IP address inside it. At the end, I stopped the container and
removed the network.

## Why It Matters
`inspect` is what actually proves a container is on a specific
network, not just the `run` command succeeding. This is the same
kind of check used to debug real networking issues between
containers.

## Files
- `network-setup.sh` > the commands I ran and their output.
- `screenshot.png` > the proof of practice, here you can check my personal efforts how i successfully do this.

---
**NOTE:** for more explaination you can see my main README.md of this repo.
