BUILD_CMD=docker build -t local_jenkins:latest .
RUN_CMD=docker run -p 8080:8080 -p 50000:50000 local_jenkins:latest
build:  
	$(BUILD_CMD) && $(RUN_CMD)
