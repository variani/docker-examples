# Docker examples

## App: Hello from R

"Hello world!" app based on an R script. 
There several versions of the app: every next version of the app. adds some new functionality.
The basic version supposed to do something like this.

```bash
# no arguments 
> docker run hello
Hello, Guest!
# argument #1 = person name
> docker run hello Andrey
Hello, Andrey!
```

Functional blocks:

- call the R script from Docker;
- pass arguments from Docker to the R script;
- parse arguments inside the R script;
- install required R packages.

|--|--|--|
| [hello_r:1.0](hello-r/01-hello-r-v1.0/) | `docker run hello_r:1.0 Andrey` | `base::commandArgs` |
| [hello_r:1.1](hello-r/02-hello-r-v1.1/) | `docker run hello_r:1.1 --name Andrey --times 2` | `docopt::docopt` |


## References

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
