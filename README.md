# Nextflow 

## Installation for Mac OS X 
https://bioconda.github.io/recipes/nextflow/README.html
```
conda install nextflow
```

## Basic workflows

```
# hello-world example
nextflow run hello-world.nf --str 'Bonjour le monde' -resume -with-dag hello-world.png

# example 1
nextflow run example1.nf
```

```
$ nextflow run example2.nf
N E X T F L O W  ~  version 21.10.6
Launching `example2.nf` [naughty_galileo] - revision: fc548246b0
executing perl task...
executor >  local (2)
[3a/f3799b] process > perlTask [100%] 1 of 1 ✔
[20/8daf45] process > pyTask   [100%] 1 of 1 ✔
executing python task...
average of two columns of random numbers: 56.057181947976595 , 56.01691280640473
```
