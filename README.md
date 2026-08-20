# Docker Basics Practice Notes

Hi! These are my personal notes and practice commands for learning Docker. I wrote these down step-by-step while learning how containers and cloud environments work.

---

# Strict Docker Rules

These simple guidelines prevent command failures and keep configuration files working correctly:

* **Always use CAPITAL LETTERS for commands:** Main instructions inside a configuration file (like `FROM`, `RUN`, `WORKDIR`, `COPY`, and `CMD`) must always be written in UPPERCASE.
* **No file extensions for Dockerfile:** The file used to build a custom system image must strictly be named `Dockerfile` with a capital 'D' and absolutely no extension (never use `Dockerfile.txt` or `Dockerfile.yaml`).
* **Port mapping order is Host to Container:** When forwarding network traffic using `-p 8080:80`, the first number (`8080`) is the port on your network router/host machine, and the second number (`80`) is the port inside the isolated container.
* **Containers are temporary, Volumes are permanent:** Any data written inside a standard running container is destroyed forever when the container is deleted. To keep data safe, a `docker volume` must be attached.
  
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

##  Understanding Dockerfile & Custom System Builds

A `Dockerfile` is a text blueprint or "recipe file" used to build our own custom isolated system images. Instead of just pulling public apps, we can design our private software environments from scratch.

###  Custom Code Structure Example
```dockerfile
FROM alpine:latest
WORKDIR /app
CMD ["echo", "Hello from Alina's custom verified build!"]
```
###  Line-by-Line Breakdown & Core Concepts

#### 1. FROM alpine:latest
* **What it means:** This sets the base operating system for our container.
* **The Concept (Why Alpine?):** Alpine Linux is a world-famous, super-lightweight Linux distribution that is only around 5MB in size. 
* **Security Importance:** In cybersecurity, we always follow the "Least Privilege" and "Minimizing Attack Surface" rules. Standard operating systems (like full Ubuntu) contain hundreds of pre-installed tools that hackers can exploit. Alpine removes all useless software, leaving zero backdoor entry points, making it incredibly secure and fast.

#### 2. WORKDIR /app
* **What it means:** This creates a folder named `/app` inside the container and moves us into it.
* **The Concept:** It acts exactly like the `cd` (change directory) command in Linux, but for inside the container. All the next files we copy or commands we run will safely happen within this specific home directory.

#### 3. CMD ["echo", "Hello from Alina's custom verified build!"]
* **What it means:** This defines the default main command that runs automatically when the container turns on.
* **The Concept:** Unlike the `RUN` command (which runs *during* the building phase), `CMD` only triggers when the container actually launches. It prints my custom verification text to prove the pipeline works, and then cleanly shuts down the process to save resources.

###  Core Advantages of Using a Custom Dockerfile
* **Complete Environmental Control:** You can choose exactly what software versions, folders, and configurations are loaded into the system, leaving no room for unexpected surprises.
* **Drastically Reduced Attack Surface:** By selecting a tiny base like Alpine, you eliminate hundreds of unnecessary pre-installed tools, making it nearly impossible for hackers to find vulnerable backdoors.
* **Flawless Infrastructure-as-Code (IaC):** Your entire server setup becomes a simple 3-line text code. This means you can destroy, rebuild, or share the exact same system setup in seconds without tracking manual steps.
* **Ultra-Lightweight Storage footprint:** Since a custom `Dockerfile` allows you to strip out the junk, your final container image consumes minimal megabytes, making cloud deployment fast and efficient.

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

