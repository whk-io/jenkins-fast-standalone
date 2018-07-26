FROM jenkins/jenkins:latest
USER root
#RUN apt-get install -y lsb-release
#RUN lsb_release -cs
#RUN cat /etc/issue
##--------------------------
##--Git
RUN apt-get remove -y git
RUN wget https://github.com/git/git/archive/master.zip
RUN apt-get update && apt-get install -y build-essential unzip dh-autoreconf libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev
RUN unzip master.zip
WORKDIR git-master
RUN make configure
RUN ./configure --prefix=/usr
RUN make && make install
RUN git --version
WORKDIR /root
##--------------------------
##--Docker
RUN apt-get update
RUN wget -O docker-ce.gpg https://download.docker.com/linux/debian/gpg
RUN apt-key add docker-ce.gpg
RUN apt-get update
RUN apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common
RUN apt-key fingerprint 0EBFCD88
RUN echo "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable" > /etc/apt/sources.list.d/docker-ce.list
RUN apt-get update
RUN apt-get install -y docker-ce
RUN service docker start
##--------------------------
ENV JENKINS_USER admin
ENV JENKINS_PASS admin
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
COPY init.groovy.d/* /usr/share/jenkins/ref/init.groovy.d/
COPY jobs.groovy.d/* /usr/share/jenkins/ref/jobs.groovy.d/
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
VOLUME /var/jenkins_home
## USER jenkins
