import groovy.io.FileType
import javaposse.jobdsl.dsl.DslScriptLoader
import javaposse.jobsdl.plugin.JenkinsJobManagement

jobSource = new File('/usr/share/jenkins/ref/jobs.groovy.d')
jobSource.eachFileRecurse (FileType.FILES) { file ->
  new DslScriptLoader(new JenkinsJobManagement(System.out, [:], file)).runScript(file.txt)
}
