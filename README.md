# Docker examples

## App: Hello from R

"Hello world!" app based on an R script. 
There are several versions of the app: every next version adds some new functionality.
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

[hello_r:1.0](hello-r/01-hello-r-v1.0/) 

- `docker run hello_r:1.0 Andrey` 
- arguments parsed by `base::commandArgs` in the R script

[hello_r:1.1](hello-r/02-hello-r-v1.1/) 

- `docker run hello_r:1.1 --name Andrey --times 2` 
- arguments parsed by `docopt::docopt` in the R script

[hello_r:1.2](hello-r/03-hello-r-v1.2/) 

- `docker run  -v ${PWD}/input_data:/app/input_data -v ${PWD}/results:/app/results hello_r:1.2 --dir_out results/run1`
- files for I/O are supported


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


## Clean space

https://stackoverflow.com/a/44785784

```bash
# delete all containers including its volumes 
docker rm -vf $(docker ps -aq)

# delete all the images
docker rmi -f $(docker images -aq)
```

## Docker image name convention

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

## Docker volumes

- https://earthly.dev/blog/docker-volumes/#:~:text=Docker%20Volume%20Best%20Practices,-Now%20that%20you&text=Always%20mount%20volumes%20as%20read,name%20in%20a%20production%20environment.
- https://towardsdatascience.com/the-complete-guide-to-docker-volumes-1a06051d2cce

## Rscript

https://stackoverflow.com/questions/62704558/how-to-get-rscript-to-run-through-docker

```bash
# first line of the entry point script
#!/usr/bin/env Rscript
```

## Caveats

1. How to fix docker: Got permission denied while trying to connect to the Docker daemon socket

https://www.digitalocean.com/community/questions/how-to-fix-docker-got-permission-denied-while-trying-to-connect-to-the-docker-daemon-socket

2. [How to Fix Docker’s No Space Left on Device Error](https://www.baeldung.com/linux/docker-fix-no-space-error)
          
