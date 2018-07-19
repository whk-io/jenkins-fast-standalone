// execute echo command
job('example-1') {
    steps {
        shell('echo Hello World!')
    }
}
