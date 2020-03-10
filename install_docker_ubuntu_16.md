### Install docker.io
```
sudo apt-get update
sudo apt-get remove docker
sudo apt install docker.io
```

### Add local user in docker group (avoid to use sudo in next time)
```
sudo groupadd -f docker
sudo usermod -aG docker $USER
```

### Add proxy for docker pull
```
sudo mkdir -p /etc/systemd/system/docker.service.d
```
CMD
```
sudo vi  /etc/systemd/system/docker.service.d/https-proxy.conf
```
Insert following content:
```
[Service]
Environment="HTTPS_PROXY=http://xxx.com:888/"
```
CMD
```
sudo vi  /etc/systemd/system/docker.service.d/http-proxy.conf
```
Insert following content:
```
[Service]
Environment="HTTP_PROXY=http://xxx.com:888/"
```

```
sudo systemctl daemon-reload
sudo systemctl restart docker
```

```
systemctl show --property=Environment docker
```

Result:
```
Environment=HTTP_PROXY=http://xxx.com:888/ HTTPS_PROXY=http://xxx.com:888/
```
### Check
`docker run hello-world`

Result:
```
Using default tag: latest
latest: Pulling from library/hello-world
1b930d010525: Pull complete
Digest: sha256:2557e3c07ed1e38f26e389462d03ed943586f744621577a99efb77324b0fe535
Status: Downloaded newer image for hello-world:latest
```

### Docker hub mirror
```
sudo mkdir -p /etc/docker
sudo vi /etc/docker/daemon.json
```
Add:
```
{
    "registry-mirrors": [
        "https://1nj0zren.mirror.aliyuncs.com",
        "https://docker.mirrors.ustc.edu.cn",
        "http://f1361db2.m.daocloud.io",
        "https://registry.docker-cn.com"
    ]
}
```
```
sudo systemctl daemon-reload
sudo systemctl restart docker
```

