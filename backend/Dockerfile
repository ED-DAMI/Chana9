# ─── Stage 1 : Build ───────────────────────────────────────────
FROM maven:3.9-eclipse-temurin-21 AS builder

WORKDIR /app

# 1. Copier le pom.xml en premier (layer cachée séparément)
COPY pom.xml .

# 2. Télécharger dépendances + plugins en une seule commande RUN
#    → Une seule layer Docker = cache plus efficace
RUN mvn dependency:go-offline dependency:resolve-plugins -B

# 3. Copier le code source
COPY src ./src

# 4. Build (le cache de la layer précédente est réutilisé si pom.xml n'a pas changé)
RUN mvn package -DskipTests -B

# ─── Stage 2 : Runtime ─────────────────────────────────────────
FROM eclipse-temurin:21-jre-alpine

# Sécurité : ne pas tourner en root
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar

# Healthcheck intégré
HEALTHCHECK --interval=30s --timeout=5s --start-period=30s --retries=3 \
  CMD wget -qO- http://localhost:8080/actuator/health || exit 1

EXPOSE 8080

# Valeurs par défaut pour JAVA_OPTS (override possible au runtime)
ENV JAVA_OPTS="-XX:+UseContainerSupport -XX:MaxRAMPercentage=75.0"

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]