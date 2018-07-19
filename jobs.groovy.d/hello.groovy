// execute echo command at startup
job('Hello') {
    steps {
        shell('echo Nice to meet you!')
    }
}
