FROM jenkins/jenkins:lts-alpine
USER root
ENV JENKINS_USER admin
ENV JENKINS_PASS admin
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
COPY init.groovy.d/* /usr/share/jenkins/ref/init.groovy.d/
COPY jobs.groovy.d/* /usr/share/jenkins/ref/jobs.groovy.d/
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
VOLUME /var/jenkins_home
USER jenkins
