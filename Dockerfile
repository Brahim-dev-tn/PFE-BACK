# Stage 1: Build the application
FROM maven:3.6-openjdk-8 as builder
WORKDIR /app
# Copy your source and pom.xml files
COPY src ./src
COPY pom.xml .
# Build the application
RUN mvn clean package

# Stage 2: Create the final Docker image
FROM openjdk:8
WORKDIR /app
# Copy only the built jar from the builder stage
COPY --from=builder /app/target/ibrahim-app.jar ./ibrahim-app.jar
EXPOSE 8089
ENTRYPOINT ["java", "-jar", "ibrahim-app.jar"]
