#!/usr/bin/Rscript

'Say hello from R.

Usage:
  hello [--name <name>] [--times <times>]
  hello (-h | --help)
  hello --version

Options:
  -h --help       Show this screen.
  --version       Show version.
  --name=<name>   Name [default: Guest].
  --times=<times> Number of greetings [default: 1].

' -> doc

## include libraries
library(docopt)
library(magrittr)
library(glue)

## parse arguments
arg = docopt(doc, version = 'Hello from R 1.1')

## say hello
arg_name = arg[["--name"]]
arg_times = as.integer(arg[["--times"]])
for(i in seq(arg_times)) {
  glue('Hello, {arg_name}!') %>% cat
  cat('\n')
}
