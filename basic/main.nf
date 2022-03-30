// Credit: Brent Pedersen 

nextflow.enable.dsl=2

// run as: nextflow run -resume main.nf --cores 12 --depths 0,6,8,10,12

params.depths = false
if (!params.depths) {
	exit 1, "--depths argument like 1,2,3 is required"
}

// --depths 2,4,6,8
idepths = params.depths.split(",").collect { it -> it.toInteger() }
depths = Channel.from(idepths)


quals = Channel.fromList([5,10,20])
cohorts = Channel.from("AAA", "BBB")

// run the `script` for each cohort, depth, qual combination
process X {                                                                                                               
    publishDir "q" // write final outputs to q directory
    input:
    each(cohort)
    each(depth)
    each(qual)
    output: tuple(path(output_file), val(cohort))
    // note: define output_file variable in script and use it for `output`
    //       and in the script section
    script:
    output_file = "${cohort}_d${depth}_q${qual}.out"
    """
       echo $depth $qual > ${output_file}
    """
}

process Y {
    input: val(cohort)
    output: path("${cohort}.y")
    script:
    """
       echo $cohort > ${cohort}.y
    """
}


// apply the script to the grouped files for each cohort
process plot {
    publishDir "qq"
    input: tuple(val(paths), val(cohort))
    output: path("${cohort}.result")
    script:
       """
       echo "plot $cohort ${paths.join(" ")}" > ${cohort}.result
       """
}

workflow {
   X(cohorts, depths, quals)
           // group by the cohort
	   | groupTuple(by: [1]) 
	   // send [files], cohort to plot process
           | plot
	   | view

   // Y will run concurrently with X because it does not depend on output of X
   Y(cohorts) | view
}

