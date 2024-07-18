# Hi Care

Hospital Management System — Java servlet/JSP application for staff, doctor, and patient workflows, backed by MySQL and runnable with Docker.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

## Documentation

Full documentation lives in [`docs/`](docs/README.md):

| Topic | Link |
|-------|------|
| Docs home | [docs/README.md](docs/README.md) |
| Architecture | [docs/architecture.md](docs/architecture.md) |
| Components | [docs/components.md](docs/components.md) |
| Flows | [docs/flows.md](docs/flows.md) |
| Database & SQL schemas | [docs/database.md](docs/database.md) |
| Frontend | [docs/frontend.md](docs/frontend.md) |
| Deployment | [docs/deployment.md](docs/deployment.md) |

## Features

- **Staff:** manage departments, doctors, patients, nurses; view feedback; update profile
- **Doctors:** view appointments; update profile
- **Patients:** book visits, view/cancel appointments, submit feedback

## Quick start

```bash
docker compose up --build
```

Open [http://localhost:8080](http://localhost:8080).

| Role | Email | Password |
|------|-------|----------|
| Staff | `kumudu@gmail.com` | `admin@123` |
| Doctor | `sunil@yahoomail.com` | `sunil@123` |
| Patient | `kumari329@yahoo.com` | `123@123` |

If port 8080 is busy, change the mapping in [`docker-compose.yml`](docker-compose.yml).

## Stack

- Java 17, Tomcat 9 (`javax.servlet`), JSP
- MySQL 8 + JDBC
- Docker Compose for app + database

See [docs/architecture.md](docs/architecture.md) for diagrams.

## Project layout

```text
├── docs/                   Documentation
├── database/hospital_db/   MySQL dumps (hms)
├── src/com/                Servlets, beans, DAO
├── WebContent/             JSP, CSS, JS, images
├── Dockerfile
├── docker-compose.yml
└── LICENSE
```

## License

[MIT](LICENSE) — see the license file for terms.
