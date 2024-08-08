# Stage 1: Build the application
FROM openjdk:11-jdk-slim AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN apt-get update && apt-get install -y maven \
    && mvn clean package

# Stage 2: Run the application
FROM tomcat:9.0

# Copy the WAR file from the previous build stage to the Tomcat webapps directory
COPY --from=build /app/target/ukranian-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ukranian.war

# Expose port 8080 to the outside world
EXPOSE 8080

# Run Tomcat
CMD ["catalina.sh", "run"]
