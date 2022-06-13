# Docker examples

# Notes

## Image name convention

https://awstip.com/docker-image-name-convention-951e84dc0a42

Many repositories on Docker Hub use the following scheme.

```bash
docker tag myimage-v1.9.1 myimage:1
docker tag myimage-v1.9.1 myimage:1.9
docker tag myimage-v1.9.1 myimage:1.9.1
docker tag myimage-v1.9.1 myimage:latest
```

- myimage:1 always points to the latest image in the 1 branch.
- myimage:1.9 always points to the latest image in 1.9.x.
- myimage:latest always points to the latest image of all versions.
