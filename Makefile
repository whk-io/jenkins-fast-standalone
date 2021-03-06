# type make or make build to build the image
# type make run to run and test the image
# type make all to build and run the image
BUILD_CMD="docker build -t jenkins-slim:latest ."
RUN_CMD="docker run -p 9090:8080 -p 50000:50000 jenkins-slim:latest"
build: ; eval $(BUILD_CMD)
run: ; eval $(RUN_CMD)
all: build run
