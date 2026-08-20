root@ubuntu:~$ docker network create my-test-network
Error response from daemon: network with name my-test-network already exists
root@ubuntu:~$ docker network ls
NETWORK ID     NAME              DRIVER    SCOPE
6ab413fa71b4   bridge            bridge    local
0452ff08d8be   host              host      local
1caee9974f4b   my-test-network   bridge    local
54711d977cb4   none              null      local
root@ubuntu:~$ docker run -d --name db-container --network my-test-network -e USER_KEY=admin -e PASS-KEY=secret123 nginx
e3b0656ef18e970c1aa5fe868d8f8362717999b4ea19fcaaf139169caf150d48
root@ubuntu:~$ docker network inspect my-test-network
[
    {
        "Name": "my-test-network",
        "Id": "1caee9974f4b384af8c625681f80db797e1d1dcfdebf6485f1c3eb6f74228af3",
        "Created": "2026-08-20T10:30:25.956685366Z",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv4": true,
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.18.0.0/16",
                    "IPRange": "",
                    "Gateway": "172.18.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Options": {},
        "Labels": {},
        "Containers": {
            "e3b0656ef18e970c1aa5fe868d8f8362717999b4ea19fcaaf139169caf150d48": {
                "Name": "db-container",
                "EndpointID": "d388d28f34fdcf9768b245ee6feb740d61da1451ad47bd2aa47ce45d1584c407",
                "MacAddress": "1e:58:d8:16:f2:10",
                "IPv4Address": "172.18.0.2/16",
                "IPv6Address": ""
            }
        },
        "Status": {
            "IPAM": {
                "Subnets": {
                    "172.18.0.0/16": {
                        "IPsInUse": 4,
                        "DynamicIPsAvailable": 65532
                    }
                }
            }
        }
    }
]
root@ubuntu:~$ docker stop db-container
db-container
root@ubuntu:~$ docker rm db-container
db-container
root@ubuntu:~$ docker network rm my-test-network
my-test-network
