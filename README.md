# Michigan Imputationserver Docker Image :whale:

## Getting Started

After the successful installation of Docker, all you need to do is:

```
 docker run -d -p 8080:8082 genepi/imputationserver
```
After about 1 minute you are able to access your Cloudgene instance on http://localhost:8080.

## Interactive Session

For an interactive session, you can execute:

```
 docker run -it -p 8080:8082 genepi/imputationserver startup
```

You well see all log messages from Hadoop and from Cloudgene itself.

To get access to Hadoop specfic web-applications you can map additional ports to your host:

```
 docker run -d -p 8080:8082 -p 50030:50030 genepi/imputationserver
```

Hadoop's web-interface is now accessible on http://localhost:50030.

## Persistent Cloudgene Container

Docker images are "read-only", all your changes inside one session will be lost after restart. To install Cloudgene applications or to save your data between sessions, you need to mount a folder from your host to container:

```
docker run -d -p 8080:8082  -v /home/lukas/imputationserver-data/:/data/ genepi/imputationserver
```

## Credits

Thanks to the people behind this [Galaxy image](https://github.com/bgruening/docker-galaxy-stable) for inspiration.
