# Docker Volumes

## What I Did
I created a volume, attached it to a container, and used
`docker volume inspect` to confirm where the volume actually lives on
disk. At the end, I stopped the container, removed it, and removed
the volume.

## Why It Matters
Containers lose their data when deleted, unless a volume is attached.
`inspect` here proves the volume is a real, separate thing on disk,
not something that disappears with the container.

## Files
- `volume.sh` > the commands I ran and their output.
- `screenshot.png` > the proof of practice, here you can check my personal efforts how i successfully do this

---

**NOTES:** For more explaination you can see my main README.md of thsi repo.
