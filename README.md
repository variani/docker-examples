# Docker examples

References

- I/O: https://stackoverflow.com/a/50354649
- WORKDIR command in Dockerfile: https://www.educative.io/edpresso/what-is-the-workdir-command-in-docker
- ENTRYPOINT vs. CMD commands in Dockerfile: https://devopscube.com/run-scripts-docker-arguments/


## Docker arguments

**--rm**: to tell the Docker Daemon to clean up the container and remove the file system after the container exits. 
This helps you save disk space, for example, after running short-lived containers.


**-t** (**--tty**): to tell Docker to allocate a virtual terminal session within the container. 
This is commonly used with the -i (or --interactive) option, which keeps STDIN open even if running in detached mode.

This **-it** argument is used when one wants to type some commands on your container, e.g., within an R or python console.

## Examples of Docker images

Regenie

- Dockerfile: https://github.com/rgcgithub/regenie/blob/master/Dockerfile
- bash script to test the docker with mounting a directory with test data: https://github.com/rgcgithub/regenie/blob/master/test/test_docker.sh
  - example command to get the Regenie version: `docker run -v ${REGENIE_PATH}:${mntpt} --rm $DOCKER_IMAGE regenie --version` 


## Misc

### Docker image name convention

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
