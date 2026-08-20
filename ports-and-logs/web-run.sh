root@ubuntu:~$ docker pull nginx:latest
latest: Pulling from library/nginx
Digest: sha256:8f029c543423e3eac6b06254718bc31eb75633b1e448026b6616927baa7d4bfe
Status: Image is up to date for nginx:latest
docker.io/library/nginx:latest
root@ubuntu:~$ docker run --name web-server -d -p 8080:80 nginx
5473855e4bda05a59b8c7fa9962ddce6bb1de93b1cb9409d7dc3d5d0a309c566
root@ubuntu:~$ docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS                                   NAMES
5473855e4bda   nginx     "/docker-entrypoint.…"   8 seconds ago   Up 8 seconds   0.0.0.0:8080->80/tcp, :::8080->80/tcp   web-server
root@ubuntu:~$ docker logs web-server
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2026/08/20 11:34:24 [notice] 1#1: using the "epoll" event method
2026/08/20 11:34:24 [notice] 1#1: nginx/1.31.4
2026/08/20 11:34:24 [notice] 1#1: built by gcc 14.2.0 (Debian 14.2.0-19)
2026/08/20 11:34:24 [notice] 1#1: OS: Linux 6.8.0-138-generic
2026/08/20 11:34:24 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1024:524288
2026/08/20 11:34:24 [notice] 1#1: start worker processes
2026/08/20 11:34:24 [notice] 1#1: start worker process 29
root@ubuntu:~$ docker stop web-server
web-server
root@ubuntu:~$ dcoker rm web-server
command 'dcoker' not found, did you mean:
  command 'docker' from deb docker.io (29.1.3-0ubuntu3~24.04.2)
  command 'docker' from deb podman-docker (4.9.3+ds1-1ubuntu0.2)
Try: apt install <deb name>
root@ubuntu:~$ docker rm web-server
web-server
root@ubuntu:~$ 
