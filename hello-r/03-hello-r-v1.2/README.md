## About the app `hello_r:1.2`

The app v1.2 mounts two directories, one to read (optinal) input data and another to write output data.

```bash
> docker run --rm hello_r:1.2 -h
Say hello from R.

Usage:
  hello [--name <name> | --file_name <file_name>] [--times <times>] --dir_out <dir_out> [--overwrite]
  hello (-h | --help)
  hello --version

Options:
  -h --help               Show this screen.
  --version               Show version.
  --name=<name>           Name [default: Guest].
  --times=<times>         Number of greetings [default: 1].
  --dir_out=<dir_out>     Path to output directory.
  --file_name=<file_name> File with names.
  --overwrite             Overwrite existing output directory.
```

- Names can be specified either via `--name` or `--file_name` arguments (can be unspecified too).
    - docopt coding: `[--name <name> | --file_name <file_name>]` with the `|` symbol.
- The specificed output directory is checked. If it exists and the flag `--overwrite` is on, then the app overwrite the content in the output folder.

## Files

```bash
> tree
.
├── Dockerfile
├── README.md
├── hello.R
├── input_data
│   └── names_input.txt
└── results
    ├── run1
    │   └── names_output.txt
    └── run2
        └── names_output.txt

4 directories, 6 files
```

## Commands

Build the Docker image:

```bash
docker build -t hello_r:1.2 .
```

Run the Docker image (to say hello):

```bash
> docker run --rm \
  -v ${PWD}/input_data:/app/input_data \
  -v ${PWD}/results:/app/results \
  hello_r:1.2 \
    --file_name input_data/names_input.txt \
    --dir_out results/run1
```

Example of output (no names specified):

```bash
> docker run --rm \
  -v ${PWD}/input_data:/app/input_data \
  -v ${PWD}/results:/app/results \
  hello_r:1.2 \
    --dir_out results/run1 --overwrite
output directory (results/run1) will be overwritten (--overwrite flag is on)
Hello, Guest!
> cat results/run1/names_output.txt
Guest
```

Example of output (names specified in an input file):

```bash
> docker run --rm \
  -v ${PWD}/input_data:/app/input_data \
  -v ${PWD}/results:/app/results \
  hello_r:1.2 \
    --file_name input_data/names_input.txt \
    --dir_out results/run2 --overwrite
Hello, Lelik !
Hello, Bolik!
> cat results/run2/names_output.txt
Lelik
Bolik
```
