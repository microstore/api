# Stage 1: Build the app
FROM eclipse-temurin:17-jdk AS build
WORKDIR /app
COPY . .
RUN ./mvnw package -DskipTests

# Stage 2: Run the app
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
# Tell Spring Boot to bind to the Render-provided port
ENV PORT=8080
CMD ["java", "-Xmx300m", "-Xms128m", "-jar", "app.jar", "--server.port=${PORT}"]
