# Jenkins Fast Standalone

* This build is a bit heavier as it builds the latest git binaries & installs Docker-CE

This a slim little containerized Jenkins server all setup and ready to login to in just under 30 seconds.
<hr>
Login : admin
<br>
Password : admin
<hr>

* Credentials set via the Dockerfile ENV vars.
* Please do not use this in production without a better authentication mechanism wired up.
* You have been warned.

## Requirements

docker & make

## Build and Run

type make or make build to build the image

type make run to run and test the image

type make all to build and run the image

## Access Jenkins
http://<ip_address>:9090
