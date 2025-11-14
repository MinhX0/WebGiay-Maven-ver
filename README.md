# WebGay

Migrated from a legacy Servlet/Ant project to Maven + Struts2 (Jakarta EE 10).

## Build

Use the Maven wrapper:

```
mvnw.cmd clean package
```

WAR output: `target/WebGiay.war`

## Run
Deploy the WAR to a Jakarta EE 10 compatible servlet container (e.g. Tomcat 10.1+, Payara 6). Struts2 filter is declared in `web.xml`.

Home URL examples (adjust context path):
- http://localhost:8080/WebGiay/Home.jsp
- http://localhost:8080/WebGiay/login.action

## Key Changes from Ant Version
- Adopted Maven standard layout (`src/main/java`, `src/main/resources`).
- Dependencies managed via `pom.xml` (Struts 6, JSTL Jakarta variants, MySQL connector).
- Removed manual lib management (`WEB-INF/lib`).
- Added JUnit 5 configuration (Surefire plugin) and example test.
- Duplicate `struts.xml` in `src/main/conf` neutralized; canonical config lives in `src/main/resources/struts.xml`.

## Configuration
Database settings are hardcoded in `dao/DBContext.java`. Adjust URL, user, password as needed or externalize later.

## Next Steps (Optional)
- Externalize DB credentials (env vars or properties file).
- Implement password hashing (e.g., BCrypt) instead of plain comparison.
- Add integration tests for actions.
- Remove unused legacy servlet (`HelloServlet`) if replaced fully by Struts actions.

## Testing
Run unit tests:
```
mvnw.cmd test
```

## Notes
Struts action extension configured for `.action` in `struts.xml`. Use `/login.action`, etc.

