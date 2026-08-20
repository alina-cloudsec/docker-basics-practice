root@ubuntu:~$ docker --version
Docker version 29.1.3, build 29.1.3-0ubuntu3~24.04.2
root@ubuntu:~$ docker pull nginx
Using default tag: latest
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
docker.io/library/nginx:latest
root@ubuntu:~$ docker images
                                                                                                                                       i Info →   U  In Use
IMAGE          ID             DISK USAGE   CONTENT SIZE   EXTRA
nginx:latest   f075e3f94986        162MB             0B        
root@ubuntu:~$ docker run --name basic-test -d nginx
814d32140b45de76025fa53be87d0020a3f7ef343deeb546e84a70a98c3f3b5c
root@ubuntu:~$ docker ps -a
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS     NAMES
814d32140b45   nginx     "/docker-entrypoint.…"   14 seconds ago   Up 14 seconds   80/tcp    basic-test
root@ubuntu:~$ docker stop basic-test
basic-test
root@ubuntu:~$ docker rm basic-test
basic-test
root@ubuntu:~$ docker rmi nginx
Untagged: nginx:latest
Untagged: nginx@sha256:8f029c543423e3eac6b08254718bc31eb75633b1e448026b6616927baa7d4bfe
Deleted: sha256:f075e3f9498646fffa374cbd2a781eec14d8e788304a2c40a7f2355996a2146a
Deleted: sha256:4bdfccf59ab428b5e902564561b83c2c672d2584a26031bed1c96fb5176a5566
Deleted: sha256:409dd102038cadab253fde8d8f22757644be7a26d6009403711118c6dc7b2b04
Deleted: sha256:b1b7c27a0e575276555a8178dd41c6dbeef6b16dee2d7386b0d9b02d4fa0474f
Deleted: sha256:b51b3b4564e85c4acbd9ff7a67c080c31357b68868446971b34ac6e76c3eb1af
Deleted: sha256:abba2d6dbe102b36bfeb2fc5763b77f54fc4ddd52d6c17ca164eac1098d540bd
Deleted: sha256:2dac092a339adf6e2c8ec4e2f1db140ed45f23f48788422f6e9e0fe77e6cd139
Deleted: sha256:6f94328331290cbd81edab450664d42da7b64c191416c9346cd5d28c84f76035
root@ubuntu:~$ 
