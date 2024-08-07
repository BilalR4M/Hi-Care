# Hi Care

Java servlet/JSP hospital desk for staff, doctors, and patients. MySQL backend. Docker Compose to run.

## Run

```bash
docker compose up --build
```

App: [http://localhost:8080](http://localhost:8080) · MySQL: `localhost:3306` / `hms` / `root` / `bilz999`

| | Email | Password |
|---|---|---|
| Staff | `kumudu@gmail.com` | `admin@123` |
| Doctor | `sunil@yahoomail.com` | `sunil@123` |
| Patient | `kumari329@yahoo.com` | `123@123` |

## What’s included

- **Staff** — departments, doctors, patients, nurses, feedback, profile  
- **Doctor** — appointments, profile  
- **Patient** — book visit, appointments, feedback, profile  

Stack: Java 17, Tomcat 9, JSP, MySQL 8, JDBC.

## Docs

[docs/](docs/README.md) — architecture, components, flows, database, frontend, deployment.

## License

[MIT](LICENSE)
