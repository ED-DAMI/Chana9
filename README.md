# Chana9

## Project
Chana9 - plateforme de commercialisation du bétail au Maroc.

## Prerequisites
- Java 21
- Maven 3.9+
- Flutter 3
- Docker and Docker Compose

## Getting started
1. Start infrastructure with `docker-compose up`.
2. Run the backend from `backend/`.
3. Run the mobile app from `mobile/` with `flutter run`.

## Architecture overview
- `backend/` - Spring Boot 3 API with security, JPA, Liquibase, and PostgreSQL.
- `mobile/` - Flutter client using BLoC, Dio, secure storage, and GoRouter.
- `docker-compose.yml` - local PostgreSQL and backend stack.

## Environment variables
- `JWT_SECRET` - secret used by the backend for JWT signing.
- `POSTGRES_DB` - database name for local development.
- `POSTGRES_USER` - database user for local development.
- `POSTGRES_PASSWORD` - database password for local development.