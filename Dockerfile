FROM jenkins/jenkins:latest
USER root
RUN apt-get update && apt-get install -y apt-utils
RUN apt-get update && apt-get install -y ruby python python-pip jq
RUN pip install awscli && gem install bundler
ENV JENKINS_USER admin
ENV JENKINS_PASS admin
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
COPY init.groovy.d/* /usr/share/jenkins/ref/init.groovy.d/
COPY jobs.groovy.d/* /usr/share/jenkins/ref/jobs.groovy.d/
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
VOLUME /var/jenkins_home
USER jenkins
