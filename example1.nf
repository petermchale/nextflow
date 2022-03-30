#!/usr/bin/env nextflow

// https://www.nextflow.io/example1.html
 
params.in = "$baseDir/sample.fa"

println "fasta file: ${params.in}" 

fasta_file = file(params.in)
print fasta_file.text 

/*
 * split a fasta file into multiple files, one for each sequence
 */
process splitSequences {
 
    input:
    path 'input.fa' from params.in
 
    output:
    path 'seq_*' into records
 
    """
    # d is pre-incremented each time a line beginning with ">" is encountered:  
    awk '/^>/{f="seq_"++d} {print > f}' < input.fa
    """
}
 
/*
 * reverse the sequences
 */
process reverse {
 
    input:
    path x from records
     
    output:
    stdout into result
 
    """
    cat $x | rev
    """
}
 
/*
 * print the channel content
 */
println "fasta file after reversal:"
result.subscribe { println it }
