# Docker Compose

## What I Did
I wrote a `docker-compose.yaml` file to run nginx on port 8080. My
first attempt, `docker compose -f docker-compose.yaml up -d`, failed
with an "unknown shorthand flag" error. I found that this Docker
version uses a separate, older command instead, so I used
`docker-compose up -d` and `docker-compose down`, which both worked.

## Why It Matters
This taught me that `docker compose` (newer, built in) and
`docker-compose` (older, separate tool) are not always the same
command, depending on how Docker is installed. Reading the actual
error message is what led me to the right command, instead of just
assuming compose was broken.

## Files
- `docker-compose.sh` > the commands I ran and their output.
- `docker-compose.yaml` > the compose file itself.
- `screenshot.png` > the proof of practice, here you can check my personal efforts how i successfully do this.

**NOTE:** for more explaination you can see my main README.md of this repo.
