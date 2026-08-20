# Run Options and Ports

## What I Did
I pulled nginx again, then ran it as a named, background container
with port 8080 on my computer connected to port 80 inside the
container. I checked `docker logs` to see nginx actually starting up.
I made a small typo (`dcoker` instead of `docker`) while trying to
remove it, got an error, and fixed it right after.

## Why It Matters
This proves port binding actually works, since the logs show the
real nginx server starting inside the container. Checking logs is
also how you'd debug a container that isn't behaving as expected.

## Files
- `web-run.sh` > the commands I ran and their output.
- `screenshot.png` > the proof of practice, here you can check my personal efforts how i successfully do this.

---

**NOTE:** for more expalination you can my pmain README.md of this repo
