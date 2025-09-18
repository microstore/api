# Stage 1: Build the app using Maven + JDK
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn package -DskipTests

# Stage 2: Run the app with a smaller JRE
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
# Spring Boot needs to bind to $PORT (Render provides it)
ENV PORT=8080
CMD ["java", "-Xmx300m", "-Xms128m", "-jar", "app.jar", "--server.port=${PORT}"]
