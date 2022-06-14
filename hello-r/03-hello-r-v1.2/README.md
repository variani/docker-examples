## About the app `hello_r:1.2`


## Files

```bash
```

## Commands

Build the Docker image:

```bash
docker build -t hello_r:1.2 .
```

Run the Docker image (to say hello):

```bash
 docker run --rm -v ${PWD}/input_data:/app/input_data -v ${PWD}/results:/app/results hello_r:1.2 --file_name input_data/names_input.txt --dir_out results/run1
```

Example of output (no names specified):

```bash
> docker run --rm -v ${PWD}/input_data:/app/input_data -v ${PWD}/results:/app/results hello_r:1.2 --dir_out results/run1 --ove
rwrite
output directory (results/run1) will be overwritten (--overwrite flag is on)
Hello, Guest!
> cat results/run1/names_output.txt
Guest
```

Example of output (names specified in an input file):

```bash
> docker run --rm -v ${PWD}/input_data:/app/input_data -v ${PWD}/results:/app/results hello_r:1.2 --file_name input_data/names_input.txt --dir_out results/run2 --overwrite
Hello, Lelik !
Hello, Bolik!
> cat results/run2/names_output.txt
Lelik
Bolik
```
