# Hi Care documentation

Structured documentation for the **Hi Care** Hospital Management System — a Java servlet/JSP web application with MySQL, packaged with Docker.

## Contents

| Document | Description |
|----------|-------------|
| [Architecture](architecture.md) | System context, deployment topology, layered design |
| [Components](components.md) | Package map, UI shell, servlet catalog |
| [Flows](flows.md) | Auth, CRUD, and appointment sequences |
| [Database](database.md) | Schema reference, ER diagram, logical relationships |
| [Frontend](frontend.md) | JSP layout, includes, CSS theme |
| [Deployment](deployment.md) | Docker, environment variables, sample accounts |

## Quick start

```bash
docker compose up --build
```

Open [http://localhost:8080](http://localhost:8080).

See [Deployment](deployment.md) for ports, credentials, and troubleshooting.

## Repository map

```text
HospitalManagementSystem/
├── README.md                 # Project overview (entry point)
├── LICENSE                   # MIT
├── Dockerfile                # Tomcat 9 + JDK 17 image
├── docker-compose.yml        # App + MySQL
├── docs/                     # This documentation set
├── database/hospital_db/     # MySQL init dumps (hms)
├── src/com/                  # Java packages (servlets, beans, DAO)
└── WebContent/               # JSP, CSS, JS, images, WEB-INF
```

## License

This project is released under the [MIT License](../LICENSE).
