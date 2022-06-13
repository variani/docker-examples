## About the app `hello_r:1.1`

A new version 1.1 extends 1.0 with a new argument parser in R 
via the R package [docopt](https://github.com/docopt/docopt.R).

We have new features with `docopt`:

- Named arguments;
- Printing a help message;
- Having optional arguments, e.g., `--name`.

Another update is related to installation of R packages.
All the installation is specified within [Dockerfile](Dockerfile),
and no extra R script `install-r-packages.R` is needed.


## Files

```bash
> tree
.
├── Dockerfile
├── README.md
└── hello.R

0 directories, 3 files
```

## Commands

Build the Docker image:

```bash
docker build -t hello_r:1.1 .
```

Run the Docker image (to say hello):

```bash
docker run --rm hello_r:1.1 --name Andrey
```

Example of output:

```bash
> docker run hello_r:1.1 --name Andrey --times 2
Hello, Andrey!
Hello, Andrey!
```
