# Rules

These rules apply to every change in this repo — backend (Spring Boot) and mobile (Flutter).

---

## 1. No comments in code

Names and structure carry meaning. Rationale goes in commit messages.

---

## 2. No hardcoded values

### Flutter
| Use | For |
|-----|-----|
| `ApiConstants` | Base URL, endpoints |
| `StorageKeys` | SecureStorage keys |
| `AppRoutes` | GoRouter paths |
| Enum `backendValue` | Backend string values |

### Spring Boot
| Use | For |
|-----|-----|
| `AnnonceConstants` | Business constants |
| `EntityFields` | JPA attribute names |
| `ErrorKeys` | Exception messages |

---

## 3. Architecture rules

### Flutter — Clean Architecture
- `domain/` → no Flutter imports, no Dio, no GetIt
- `data/` → models, datasources, repository impl
- `presentation/` → BLoC, pages, widgets
- `shared/` → enums, models, utils used across features
- One BLoC per feature screen — never share state between features

### Spring Boot
- `controllers/` → HTTP only, no business logic
- `services/` → business logic only
- `repositories/` → JPA queries only
- `dto/` → records only, no entities exposed

---

## 4. Lombok first (backend)

| Use | For |
|-----|-----|
| `@UtilityClass` | Utility / constants classes |
| `@RequiredArgsConstructor` | Services / components |
| `@Builder` + `@Getter`/`@Setter` | Entities |
| `@Slf4j` | Loggers |

---

## 5. String building

### Java
```java
"...%s...".formatted(args)
```
Never `+` concatenation at runtime.

### Dart
```dart
'...${variable}...'
```
Never manual concatenation.

---

## 6. Null safety

### Java
| Pattern | Use |
|---------|-----|
| `x != null ? x.method() : null` | `NullSafe.mapped(x, X::method)` |
| `x != null ? x.method() : DEFAULT` | `NullSafe.mappedOrDefault(x, X::method, DEFAULT)` |

### Dart
- Use `?.` and `??` operators
- Never `if (x != null) x.method()` — use `x?.method()`

---

## 7. Entity attribute names (backend)

```java
root.get("breed")                          // ✗
root.get(EntityFields.AnnonceFields.BREED) // ✓
```

---

## 8. Enums

### Flutter
Every enum that maps to a backend value exposes:
```dart
String get backendValue { ... }
String get label { ... }
static T fromBackendValue(String value) { ... }
static T fromJson(String value) => fromBackendValue(value);
String toJson() => backendValue;
```

### Spring Boot
```java
@Enumerated(EnumType.STRING)
```
Always — never store enum ordinals.

---

## 9. Error handling

### Flutter
```dart
Either<Failure, T>
```
Every repository method returns `Either`. Never throw in usecases.

### Spring Boot
```java
throw new BusinessException(ErrorKeys.Annonce.NOT_FOUND)
```
Never raw strings in exceptions.

---

## 10. Models (Flutter)

All data models use `@freezed` + `json_serializable`.
After any model change:
```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## 11. Conventional commits

feat(annonces): ...
fix(auth): ...
refactor(shared): ...

One concern per commit.

---

## 12. Source of truth files

### Flutter
| File | Owns |
|------|------|
| `lib/core/constants/api_constants.dart` | Base URL, endpoint paths |
| `lib/core/network/token_storage.dart` | SecureStorage keys |
| `lib/shared/enums/` | All shared enums |
| `lib/injection_container.dart` | GetIt registrations |
| `main.dart` | GoRouter config, global BlocProviders |

### Spring Boot
| File | Owns |
|------|------|
| `AnnonceConstants.java` | Business constants |
| `EntityFields.java` | JPA attribute name strings |
| `ErrorKeys.java` | i18n error keys |
| `AnnonceSpecification.java` | Search/filter predicates |

---

## 13. Self-audit after every change

Before any commit:
1. Re-read rules 1–12
2. No comments added
3. No hardcoded strings
4. Enums use `backendValue` / `fromBackendValue`
5. Backend: `EntityFields` used for JPA attributes
6. `build_runner` run after model changes
7. Conventional commit message written