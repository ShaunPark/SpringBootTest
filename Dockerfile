# Start with a base image containing Java runtime
FROM java:8

# Add Author info
LABEL maintainer="coolage73@gmail.com"

# Add a volume to /tmp
VOLUME /tmp

# working dir
WORKDIR /

# Make port 8080 available to the world outside this container
EXPOSE 8080

# The application's jar file
ARG JAR_FILE=target/SpringBootTest-0.0.1-SNAPSHOT.jar

# Add the application's jar to the container
COPY ${JAR_FILE} SpringBootTest.jar

RUN bash -c 'touch /SpringBootTest.jar'

# Run the jar file
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/SpringBootTest.jar"]