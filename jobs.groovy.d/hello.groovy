// execute echo command at startup
job('Hello') {
    label('master')
    steps {
        shell('echo Nice to meet you!')
    }
}
