# Architecture

[Documentation home](README.md) · [Components](components.md) · [Flows](flows.md) · [Database](database.md)

## Overview

Hi Care is a classic **Java EE web application** (Servlet 3.0 + JSP) deployed on **Apache Tomcat 9**. Persistence uses **MySQL 8** through JDBC. There is no Spring Boot or Maven runtime; the Docker image compiles `src/` with `javac` and serves `WebContent/` as the `ROOT` webapp.

## System context

```mermaid
flowchart LR
  staff[Staff browser]
  doctor[Doctor browser]
  patient[Patient browser]
  app[Hi Care Tomcat app]
  db[(MySQL hms)]

  staff --> app
  doctor --> app
  patient --> app
  app --> db
```

Three actor roles share one application, with separate login entry points and session-scoped navigation:

| Role | Login page | Post-login landing |
|------|------------|--------------------|
| Staff (admin user) | `index.jsp` → `/LoginDao` | `department.jsp` |
| Doctor | `doctorLogin.jsp` → `/DoctorLogin` | `afterDoctorLogin.jsp` |
| Patient | `patientLogin.jsp` → `/PatientLogin` | `afterPatientLogin.jsp` |

## Deployment architecture

```mermaid
flowchart TB
  subgraph host [Host machine]
    browser[Browser :8080]
  end

  subgraph compose [docker compose]
    subgraph appCtr [app service]
      tomcat[Tomcat 9]
      jsp[JSP views]
      servlets[Annotated servlets]
      jdbc[ConnectionProvider]
      tomcat --> jsp
      tomcat --> servlets
      servlets --> jdbc
      jsp --> jdbc
    end
    subgraph dbCtr [mysql service]
      mysql[(MySQL 8 hms)]
    end
    jdbc -->|DB_HOST=mysql| mysql
  end

  browser --> tomcat
```

- **mysql**: image `mysql:8.0`, database `hms`, dumps mounted from [`database/hospital_db`](../database/hospital_db) into `/docker-entrypoint-initdb.d`.
- **app**: built from [`Dockerfile`](../Dockerfile); env vars `DB_HOST`, `DB_PORT`, `DB_NAME`, `DB_USER`, `DB_PASSWORD` configure JDBC.

## Application layers

```mermaid
flowchart TB
  subgraph presentation [Presentation]
    gate[Gate pages login register]
    desk[Desk pages with shell]
    includes[JSP includes]
    assets[clinic.css desk.js]
    desk --> includes
    desk --> assets
    gate --> assets
  end

  subgraph application [Application]
    annotated[HttpServlet endpoints]
    process[JSP process pages]
  end

  subgraph domain [Domain]
    beans[com.bean models]
    dao[DAO helpers]
  end

  subgraph infra [Infrastructure]
    conn[ConnectionProvider]
    mysql[(MySQL)]
  end

  gate --> annotated
  desk --> annotated
  desk --> process
  process --> dao
  annotated --> dao
  annotated --> beans
  dao --> beans
  dao --> conn
  process --> conn
  annotated --> conn
  conn --> mysql
```

| Layer | Location | Responsibility |
|-------|----------|----------------|
| Presentation | `WebContent/*.jsp`, `includes/`, `css/`, `js/` | Forms, tables, shell chrome |
| Application | `src/com/*` servlets, `*Process.jsp` | HTTP handling, redirects |
| Domain | `src/com/bean`, `*Dao.java` | Models and data access helpers |
| Infrastructure | `ConnectionProvider`, Docker, MySQL | Connections and runtime |

## Technology stack (actual)

| Concern | Choice |
|---------|--------|
| Language | Java 17 |
| Web API | `javax.servlet` (Tomcat 9) |
| Views | JSP + static CSS/JS |
| Database | MySQL 8 |
| Driver | `mysql-connector-j` 8.0.33 |
| Packaging | Docker Compose (no Maven/Spring in this tree) |

## Related

- [Components](components.md) — packages and servlet catalog  
- [Deployment](deployment.md) — runbooks and env vars  
- [Database](database.md) — schema details  
