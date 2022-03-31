#!/usr/bin/env nextflow

// https://www.nextflow.io/example2.html 
 
params.range = 100
 
/*
 * A trivial Perl script producing a list of pairs of numbers 
 */
process perlTask {
    println "executing perl task..." 

    output:
    stdout into randNums
 
    shell:
    '''
    #!/usr/bin/env perl
    use strict;
    use warnings;
 
    my $count;
    my $range = !{params.range};
    for ($count = 0; $count < 10; $count++) {
        print rand($range) . ', ' . rand($range) . "\n";
    }
    '''
}
 
/*
 * A Python script which parses the output of the previous script
 */
process pyTask {
    echo true // this prints the output of this task to the console
    println "executing python task..." 
 
    input:
    stdin from randNums

    '''
    #!/usr/bin/env python
    import sys
 
    x = 0
    y = 0
    lines = 0
    for line in sys.stdin:
        items = line.strip().split(",")
        x = x+ float(items[0])
        y = y+ float(items[1])
        lines = lines+1
 
    print("average of two columns of random numbers: %s , %s" % ( x/lines, y/lines ))
    '''
}

