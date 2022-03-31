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
