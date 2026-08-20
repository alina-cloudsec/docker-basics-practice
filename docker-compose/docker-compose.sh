root@ubuntu:~$ cat << 'EOF' > docker-compose.yaml
> version: '3.8'         
> services:
>   web:
>     image: nginx:latest
>     ports:
>       - "8080:80"
> EOF
root@ubuntu:~$ docker compose -f docker-compose.yaml up -d
unknown shorthand flag: 'f' in -f

Usage:  docker [OPTIONS] COMMAND [ARG...]

Run 'docker --help' for more information
root@ubuntu:~$ docker-compose up -d
Creating network "root_default" with the default driver
Creating root_web_1 ... done
root@ubuntu:~$ docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED          STATUS          PORTS                                     NAMES
674864b85b52   nginx:latest   "/docker-entrypoint.…"   15 seconds ago   Up 14 seconds   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   root_web_1
root@ubuntu:~$ docker compose down
docker: unknown command: docker compose

Run 'docker --help' for more information
root@ubuntu:~$ docker-compose down
Stopping root_web_1 ... done
Removing root_web_1 ... done
Removing network root_default
root@ubuntu:~$ 
