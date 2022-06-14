#!/usr/bin/Rscript

'Say hello from R.

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

' -> doc

## include libraries
library(docopt)
library(magrittr)
library(glue)

## parse arguments
arg = docopt(doc, version = 'Hello from R 1.1')

## check data_dir is present
dir_out = arg[["--dir_out"]]
arg_overwrite = arg[["--overwrite"]]
if(dir.exists(dir_out)) {
  if(!arg_overwrite) {
    stop(glue('output directory ({dir_out}) exist; user --overwrite option to force writing'))
  } else {
    message(glue('output directory ({dir_out}) will be overwritten (--overwrite flag is on)'))
  }
} else {
  stopifnot(dir.create(dir_out))
}

## say hello
arg_times = as.integer(arg[["--times"]])

if(!is.null(arg[["--file_name"]])) {
  # 1. names specified by --file_name
  f_names = arg[["--file_name"]]
  stopifnot(file.exists(f_names))
  names = readLines(f_names)
  stopifnot(length(names) > 0)
} else {
  # 2. names specified by --name
  names = arg[["--name"]]
}

for(i in seq(arg_times)) {
  for(x in names) {
    glue('Hello, {x}!') %>% cat
    cat('\n')
  }
}

## write output files
f_out = file.path(dir_out, 'names_output.txt')
writeLines(names, f_out)
