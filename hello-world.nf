#!/usr/bin/env nextflow

// https://www.nextflow.io/docs/latest/getstarted.html#your-first-script

params.str = 'Hello world!'

x = new java.util.Date()
println x

x = Math.random()
if( x < 0.5 ) {
    println "You lost."
}
else {
    println "You won!"
}

square = { it * it }
println square(9)
x = [ 1, 2, 3, 4 ].collect(square)
println x

process splitLetters {

    output:
    file 'chunk_*' into letters

    """
    printf '${params.str}' | split -b 6 - chunk_
    """
}

process convertToUpper {

    input:
    // https://www.nextflow.io/docs/latest/operator.html#flatten
    file x from letters.flatten() 

    output:
    stdout into result

    """
    cat $x | tr '[a-z]' '[A-Z]'
    # rev $x
    """
}

result.view { it.trim() }

