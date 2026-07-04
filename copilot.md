# Rules

These rules apply to **every change** in this repo, frontend or backend.

---

## 1. No comments

Names + structure carry meaning. Rationale goes in commit messages.

---

## 2. No hardcoded values

Prefer in this order:

1. **Config map** — `LANGUAGE = { fr: "fr", en: "en" } as const`
2. **Enum array** — `INVOICE_STATUSES = ["DRAFT", ...] as const`
3. **Shared constant** — `MS_PER_SECOND = 1000`
4. **Inline literal** — only inside its source-of-truth file

Magic strings (status codes, role/permission codes, language codes, storage
keys, API paths, SPA routes) live in their dedicated `lib/*` or `*Codes.java`
file.

> **Use them.** Don't sprinkle the same string across the codebase.

---

## 3. Read the project README before adding a feature

- **Backend rules:** [`invoxa-api/README.md`](./invoxa-api/README.md)
- **Frontend rules:** [`invoxa-web/README.md`](./invoxa-web/README.md)

---

## 4. Verify before pushing

| Project  | Command                         |
|----------|---------------------------------|
| Backend  | `./gradlew check`               |
| Frontend | `npm run lint && npm run build` |

---

## 5. Respect i18n

Every user-visible string flows through the i18n layer:

| Project | Layer                                           |
|---------|-------------------------------------------------|
| API     | `MessageSource` / `messages_{en,fr}.properties` |
| Web     | `t("…")` / `i18n/locales/{en,fr}.json`          |

### No literal French/English in:

- Java exceptions
- PDFs
- Validation defaults
- Log-as-message text
- JSX

### Java keys live as constants

```java
BusinessException(ErrorKeys .<Entity>.<REASON>)   // never raw strings
```

Every i18n key referenced from Java MUST live as a constant in either:

- **`ErrorKeys`** — for errors
- **`MessageKeys`** — for everything else (PDF labels, warnings, preview text, …)

Both organized as nested `@UtilityClass` per entity.

> **No private `KEY_*` constants in services. No ad-hoc inline `"pdf.x.y"` strings.**

---

## 6. Lombok first (api)

Prefer Lombok-generated boilerplate over hand-written.

| Use                              | For                                          |
|----------------------------------|----------------------------------------------|
| `@UtilityClass`                  | Utility / constants classes                  |
| `@RequiredArgsConstructor`       | Services / components                        |
| `@Builder` + `@Getter`/`@Setter` | Entities                                     |
| `@Slf4j`                         | Loggers (not `LoggerFactory.getLogger(...)`) |

> Hand-roll only when Lombok cannot express what's needed.

---

## 7. Conventional commits with a scope

```
feat(audit): …
fix(web): …
refactor(api): …
```

**One concern per commit.**

---

## 8. No `+` string concatenation — use `.formatted()`

Build any composite string with:

```java
"...%s...".formatted(args)
```

Or `String.format(...)` only if the format is a constant referenced from elsewhere.

### The one exception

The `+` operator on strings is reserved for **compile-time constant
expressions inside annotation values**, where `.formatted()` is not legal:

```java
@RequiresAnyPermission(A + "," + B)
```

### Everywhere else: `.formatted()`

This includes:

- SQL `LIKE` clause builders
- Log messages
- Error templates
- Exception messages
- PDF labels
- Every runtime string assembly

---

## 9. Use `NullSafe` helpers — don't duplicate null-check ternaries

The verbose / wrong way calls `x` twice:

```java
x !=null ? x.method() :null
```

### Use the helpers

| Pattern                                 | Replacement                                       |
|-----------------------------------------|---------------------------------------------------|
| `x != null ? x.method() : null`         | `NullSafe.mapped(x, X::method)`                   |
| `x != null ? x.method() : DEFAULT`      | `NullSafe.mappedOrDefault(x, X::method, DEFAULT)` |
| Enum → name mapping                     | `NullSafe.nameOf(enumValue)`                      |
| `x != null ? x : DEFAULT` (no map step) | `Objects.requireNonNullElse(x, DEFAULT)`          |

### When to reach for `Optional`

Only when you genuinely need the pipeline:

```java
Optional.ofNullable(...).map(...).orElse(...)
```

…e.g. chaining multiple `.map()` calls.

---

## 10. Entity attribute names live in `EntityFields`

Any string literal that names a JPA attribute must reference a constant from
`com.invoxa.api.config.EntityFields`.

### Examples

```java
root.get("companyName")           // ✗
root.get(EntityFields.Client.COMPANY_NAME)  // ✓

Sort.by("createdAt")              // ✗
Sort.by(EntityFields.Common.CREATED_AT)     // ✓
```

Same rule for `@PageableDefault(sort = ...)`, `@Mapping(target = "...")`, etc.

### Organization

Nested `@UtilityClass` per entity:

- **`EntityFields.Common`** — shared by every JPA entity (`id`, `status`,
  `createdAt`, `updatedAt`)
- **`EntityFields.Client`**, **`EntityFields.Invoice`**, … — per-entity blocks

> No private `FIELD_*` constants in Specifications. No inline `"createdAt"` /
> `"companyName"` strings.

> **Why:** renaming a Java field becomes a single source-of-truth change.

---

## 11. Self-audit after every change

Before reporting any change as done — frontend OR backend:

1. Re-read rules 1–10
2. Verify the diff against each
3. Run the rule 4 commands
4. State which rules you checked

> **Lint/build green is necessary but not sufficient.**

### Common things to catch

- Native `<button>`/`<input>` instead of the shared component
- Repeated markup that should be a shared helper — check `components/shared/`
  and `hooks/` first; the frontend README lists the canonical primitives.
- Untranslated strings
- Hardcoded class colors (`bg-gray-500`, `bg-[#fff]`)
- Inline magic strings that belong in a `lib/*` constant
- Hand-written boilerplate that Lombok could express
- `+` string concat where `.formatted()` belongs
- Duplicated `x != null ? x.foo() : null` ternaries that should be
  `NullSafe.mapped(...)`
- Inline JPA attribute strings that should reference `EntityFields`

---

## Source-of-truth files

> **Check before adding a new constant** — chances are it already lives somewhere.

### Web

| File                                            | Owns                                                                                                                                             |
|-------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| `invoxa-web/src/lib/routes.ts`                  | Every SPA path                                                                                                                                   |
| `invoxa-web/src/lib/apiPaths.ts`                | Every backend endpoint                                                                                                                           |
| `invoxa-web/src/lib/constants.ts`               | Cross-cutting constants + re-export barrel for `features/<entity>/constants.ts`                                                                  |
| `invoxa-web/src/features/<entity>/constants.ts` | Entity-specific enums (still importable via `@/lib/constants` for back-compat)                                                                   |
| `invoxa-web/src/lib/storageKeys.ts`             | localStorage / sessionStorage keys                                                                                                               |
| `invoxa-web/src/lib/statusTones.ts`             | Status → `StatusTone` mapping                                                                                                                    |
| `invoxa-web/src/lib/api.ts`                     | `Page<T>` generic                                                                                                                                |
| `invoxa-web/src/lib/permissions.generated.ts`   | `PERMISSIONS` codes (auto-generated, mirrors backend `PermissionCodes.java`)                                                                     |
| `invoxa-web/src/features/auth/permissions.ts`   | `usePermissions` hook *(was `lib/permissions.ts`)*                                                                                               |
| `invoxa-web/src/app/modules.ts`                 | Sidebar nav config + `WRITE_GROUPS` *(was `lib/modules.ts`)*                                                                                     |
| `invoxa-web/src/i18n/locales/{en,fr}.json`      | UI strings (`parity.test.ts` enforces key-set parity). Cross-entity labels (`address.*`, `contact.*`) sit at the top level, not under a feature. |
| `invoxa-web/src/components/shared/`             | Cross-feature UI primitives — check here before duplicating JSX                                                                                  |
| `invoxa-web/src/hooks/`                         | Cross-feature hooks                                                                                                                              |

### API

| File                                                                     | Owns                               |
|--------------------------------------------------------------------------|------------------------------------|
| `invoxa-api/src/main/java/com/invoxa/api/rbac/PermissionCodes.java`      | Permission codes                   |
| `invoxa-api/src/main/java/com/invoxa/api/config/PaginationDefaults.java` | Pagination defaults                |
| `invoxa-api/src/main/java/com/invoxa/api/exception/ErrorKeys.java`       | i18n keys for errors               |
| `invoxa-api/src/main/java/com/invoxa/api/i18n/MessageKeys.java`          | i18n keys for everything non-error |
| `invoxa-api/src/main/resources/messages_{en,fr}.properties`              | i18n translations                  |
| `invoxa-api/src/main/resources/db/data/*.csv`                            | Seed data                          |
