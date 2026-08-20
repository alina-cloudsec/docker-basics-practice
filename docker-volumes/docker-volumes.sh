root@ubuntu:~$ docker volume create my-data-volume
my-data-volume
root@ubuntu:~$ docker volume ls
DRIVER    VOLUME NAME
local     my-data-volume
root@ubuntu:~$ docker run -d --name volume-test -v my-data-volume:/app/data nginx
Unable to find image 'nginx:latest' locally
latest: Pulling from library/nginx
26c307b5e35a: Pull complete 
746b934a8960: Pull complete 
5508f6432d3e: Pull complete 
5d480233f531: Pull complete 
f530c3e421fc: Pull complete 
128fcc7b23b0: Pull complete 
7eb55399d6de: Pull complete 
Digest: sha256:8f029c543423e3eac6b08254718bc31eb75633b1e448026b6616927baa7d4bfe
Status: Downloaded newer image for nginx:latest
4534e7427f5628fa853e47292313f888f417e3c72c53da553e117f38a6257cae
root@ubuntu:~$ docker volume inspect my-data-volume
[
    {
        "CreatedAt": "2026-08-20T11:25:37Z",
        "Driver": "local",
        "Labels": null,
        "Mountpoint": "/var/lib/docker/volumes/my-data-volume/_data",
        "Name": "my-data-volume",
        "Options": null,
        "Scope": "local"
    }
]
root@ubuntu:~$ docker stop volume-test
volume-test
root@ubuntu:~$ docker rm volume-test
volume-test
root@ubuntu:~$ docker volume rm my-data-volume
