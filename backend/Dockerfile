# ═══════════════════════════════════════════════════════════
#  Chana9 Backend — Dockerfile multi-stage
#  Stage 1 : build Maven
#  Stage 2 : image runtime légère
# ═══════════════════════════════════════════════════════════

# ───────────────────────────────────────────────────────────
#  STAGE 1 — BUILD
# ───────────────────────────────────────────────────────────
FROM eclipse-temurin:21-jdk AS builder

WORKDIR /app

# Copier d'abord le pom.xml seul pour profiter du cache Docker
# (les dépendances Maven ne sont re-téléchargées que si pom.xml change)
COPY pom.xml .
RUN mvn dependency:go-offline -B 2>/dev/null || true

# Copier le code source
COPY src ./src

# Build sans les tests (les tests tournent en CI séparément)
RUN mvn clean package -DskipTests -B

# ───────────────────────────────────────────────────────────
#  STAGE 2 — RUNTIME
# ───────────────────────────────────────────────────────────
FROM eclipse-temurin:21-jre

# Métadonnées
LABEL maintainer="Equipe Chana9"
LABEL project="chana9-backend"
LABEL description="API REST — Plateforme de commercialisation du bétail au Maroc"

# Créer un utilisateur non-root (bonne pratique sécurité)
RUN groupadd --system chana9 && \
    useradd --system --gid chana9 --no-create-home chana9

WORKDIR /app

# Copier uniquement le jar depuis le stage builder
COPY --from=builder /app/target/*.jar app.jar

# Donner les droits à l'utilisateur non-root
RUN chown chana9:chana9 app.jar

# Basculer sur l'utilisateur non-root
USER chana9

# Port exposé par Spring Boot
EXPOSE 8080

# Variables d'environnement avec valeurs par défaut
ENV SPRING_PROFILES_ACTIVE=prod
ENV JAVA_OPTS="-Xms256m -Xmx512m"

# Health check — vérifie que l'API répond toutes les 30s
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD curl -f http://localhost:8080/actuator/health || exit 1

# Point d'entrée avec JAVA_OPTS dynamique
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar /app/app.jar"]