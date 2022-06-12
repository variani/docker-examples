## About the app `hello_r:1.0`

The application will use an R script 
that takes an optional (single) parameter (person name) and 
prints a message to say hello.

Here are examples of output messages we wish our docker to print 
(`hello_r:1.0` is the name of our Docker image).

```bash
# no arguments 
> docker run hello_r:1.0
Hello, Guest!
# argument #1 = person name
> docker run hello_r:1.0 Andrey
Hello, Andrey!
```

This simple app requires a few basic configurations:

1. call the R script from Docker;
2. pass arguments from Docker to R;
3. parse arguments from the R script;
4. install required R packages (if any).

## Files

```bash
> tree
.
├── Dockerfile
├── hello.R
└── install-r-packages.R

0 directories, 3 files
```

## Commands

Build the Docker image:

```bash
docker build -t hello_r:1.0 .
```

Run the Docker image (to say hello):

```bash
docker run --rm hello_r:1.0 Andrey
```

Example of output:

```bash
> docker run --rm hello_r:1.0 Andrey
Hello, Andrey!
```
