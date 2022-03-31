// https://www.nextflow.io/docs/latest/dsl2.html 

nextflow.enable.dsl=2

process create_hello {
    output:
      path 'hello.txt'
    script:
      """
      echo "bonjour" > hello.txt
      """
}

 process add_world {
    input:
      path file
    output:
      path 'hello-world.txt'
    shell: // https://www.nextflow.io/docs/latest/process.html#shell
      ''' 
      hello=$(cat !{file})
      echo "$hello le monde" > hello-world.txt
      ''' 
}

workflow {
    add_world(create_hello())
    add_world.out.view()
}
