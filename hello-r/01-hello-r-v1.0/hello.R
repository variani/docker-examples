#!/usr/bin/Rscript

## include libraries
library(magrittr)
library(glue)

## parse arguments
args = commandArgs(trailingOnly = TRUE)
no_args = is.na(args[1])

if(no_args) {
  par_name = 'Guest'
} else {
  par_name = args[1] %>% as.character
}

## say hello
glue('Hello, {par_name}!') %>% cat
cat('\n')
