# Docker Basics Practice Notes

Hi! These are my personal notes and practice commands for learning Docker. I wrote these down step-by-step while learning how containers and cloud environments work.

---

## 1. Basic Docker Commands
- `docker --version` or `docker -v` -> To check if Docker is installed or not.
- `docker pull IMAGE_NAME` -> To create a new image from the internet.
- `docker run IMAGE_NAME` -> To create a new containe.
- `docker run -it IMAGE_NAME` -> To enter in the container eg.linux terminal interactive mode.
- `docker start CONTAINER_NAME_OR_ID` -> To start an existing container.
- `docker stop CONTAINER_NAME_OR_ID` -> To stop an existing container.
- `docker rmi IMAGE_NAME` -> To delete image.
- `docker rm CONTAINER_NAME_OR_ID` -> To delete container.
- `docker ps` -> To see a list of active containers.
- `docker ps -a` -> To see all active and stopped container list.
- `docker images` -> To see a list of all downloaded images.

---

## 2. Advanced Run Options & Port Binding
- `docker pull IMAGE_NAME:version` -> To create a new image with specific version.
- `docker run --name CONTAINER_NAME -d IMAGE_NAME` -> To create a container and give it a custom name in detached (-d) mode.
- `docker run -p HOST_PORT:CONTAINER_PORT IMAGE_NAME` -> For port binding. *(Note: One host port can only be bound to one container. If you run another container on the same port, you must use a different host port).*
- `docker logs CONTAINER_ID` -> To check the console logs of a container (or you can just click the container name in Docker Desktop).

---

## 3. Docker Networks (Connecting Containers)
Containers can talk to each other directly inside a shared network without needing exposed host ports.
- `docker network create NETWORK_NAME` -> To create a custom network.
- `docker network ls` -> To see the list of networks.

### How to run a container inside a network with environment variables (-e):
```bash
docker run -d \
  -p HOST_PORT:CONTAINER_PORT \
  --name CONTAINER_NAME \
  --network NETWORK_NAME \
  -e USER_KEY=USERNAME \
  -e PASS_KEY=PASSWORD \
  IMAGE_NAME
```
*(You can use the same username/password syntax in another container connected to the same network to link them together).*

---

## 4. Docker Compose (.yaml files)
Instead of writing a long command in the terminal every time, we use a `docker-compose.yaml` file to run multiple settings together. It automatically creates a default network.

```yaml
version: "3"
services:
  CONTAINER_NAME:
    ports:
      - "HOST_PORT:CONTAINER_PORT"
    environment:
      KEY: USER_NAME
      KEY2: PASSWORD
```
- `docker compose -f filename.yaml up -d` -> To create and start containers using the YAML file.
- `docker compose -f filename.yaml down` -> To delete containers created by that file.

---

## 5. Docker Volumes (Saving Data Permanently)
(to store data permanently in computer, even if the container deleted successfully the file is still present in computer. By default, when you delete a container, the data is also deleted, so we use volumes to keep the data safe
- `-v HOSTPATH_OR_VOL_NAME:CONT_PATH` -> (to attach volume with container)
- `docker volume ls` -> (to see all volumes)
- `docker volume create VOL_NAME` -> (create custom volume)
- `docker volume rm VOL_NAME` -> (remove volume)

Note: Tags are like specific version labels. You can run two different versions using tags side-by-side easily. Docker Desktop web UI makes it very simple to check and manage all these things with just a click.

