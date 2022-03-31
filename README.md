# Nextflow 

## Installation for Mac OS X 
https://bioconda.github.io/recipes/nextflow/README.html
```
conda install nextflow
```

## Basic workflows

```
$ nextflow run hello-world.nf --str 'Bonjour le monde' -resume -with-dag hello-world.png
N E X T F L O W  ~  version 21.10.6
Launching `hello-world.nf` [angry_khorana] - revision: b6b98c0d81
Thu Mar 31 12:15:41 MDT 2022
You lost.
81
[1, 4, 9, 16]
executor >  local (4)
[d5/f4dca9] process > splitLetters       [100%] 1 of 1 ✔
[d1/49299c] process > convertToUpper (3) [100%] 3 of 3 ✔
BONJOU
R LE M
ONDE
```

```
$ nextflow run example1.nf
N E X T F L O W  ~  version 21.10.6
Launching `example1.nf` [mighty_khorana] - revision: bbdc7173ab
fasta file: /Users/petermchale/nextflow/sample.fa
> chrX
ACGT
> chrY
TGCA

executor >  local (2)
[5b/61b5e7] process > splitSequences [100%] 1 of 1 ✔
[53/19ff49] process > reverse        [100%] 1 of 1 ✔
fasta file after reversal:
 Xrhc >
TGCA
Yrhc >
ACGT
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

```
$ nextflow run dsl2.nf
N E X T F L O W  ~  version 21.10.6
Launching `dsl2.nf` [sleepy_plateau] - revision: 563de591f5
executor >  local (2)
[d0/bfa16e] process > create_hello [100%] 1 of 1 ✔
[6f/b4fd8f] process > add_world    [100%] 1 of 1 ✔
/Users/petermchale/nextflow/work/6f/b4fd8f3767d1fa7c074cb2d80b7cca/hello-world.txt
```
