# Stage 1: Build the application
FROM openjdk:11-jdk-slim AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN apt-get update && apt-get install -y maven \
    && mvn clean package

# Stage 2: Run the application
FROM tomcat:9.0

# Set environment variable for the port
ENV PORT=8005

# Copy the WAR file from the previous build stage to the Tomcat webapps directory
COPY --from=build /app/target/ukranian-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ukranian.war

# Expose port 10000 to the outside world
EXPOSE 8005

# Update Tomcat's server.xml to use the port specified by the environment variable
RUN sed -i 's/port="8080"/port="'"$PORT"'"/' /usr/local/tomcat/conf/server.xml

# Run Tomcat
CMD ["catalina.sh", "run"]
