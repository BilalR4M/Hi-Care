# Flows

[Documentation home](README.md) · [Architecture](architecture.md) · [Components](components.md) · [Database](database.md)

## Staff authentication

```mermaid
sequenceDiagram
  actor Staff
  participant Index as index.jsp
  participant Login as LoginDao
  participant DB as MySQL user
  participant Dept as department.jsp

  Staff->>Index: Open / enter email password
  Index->>Login: POST /LoginDao
  Login->>DB: SELECT name,email,password WHERE email and password
  alt match
    Login->>Login: session.uname = name
    Login->>Dept: 302 department.jsp
  else no match
    Login->>Index: 302 index.jsp
  end
```

## Doctor authentication

```mermaid
sequenceDiagram
  actor Doctor
  participant Page as doctorLogin.jsp
  participant Login as DoctorLogin
  participant DB as MySQL doctor
  participant Home as afterDoctorLogin.jsp

  Doctor->>Page: Submit credentials
  Page->>Login: POST /DoctorLogin
  Login->>DB: SELECT doc_name,password,doctor_id
  alt match
    Login->>Login: session.uname, session.doctor_id
    Login->>Home: 302 afterDoctorLogin.jsp
  else no match
    Login->>Page: 302 doctorLogin.jsp
  end
```

## Patient authentication and booking

```mermaid
sequenceDiagram
  actor Patient
  participant LoginPage as patientLogin.jsp
  participant Login as PatientLogin
  participant Book as afterPatientLogin.jsp
  participant Process as appointmentProcess.jsp
  participant DB as MySQL

  Patient->>LoginPage: Sign in
  LoginPage->>Login: POST /PatientLogin
  Login->>DB: SELECT patient_name,password
  Login->>Book: 302 afterPatientLogin.jsp
  Patient->>Book: Fill book form doctor id
  Book->>Process: POST appointmentProcess.jsp
  Process->>DB: INSERT appointment
  Process->>Book: 302 afterPatientLogin.jsp
```

## Staff CRUD (department example)

```mermaid
flowchart TD
  A[department.jsp authenticated] --> B{User action}
  B -->|List| C[SELECT * FROM department]
  B -->|Add| D[POST departmentProcess.jsp]
  D --> E[INSERT department]
  E --> A
  B -->|Edit| F[editDepartment.jsp?id]
  F --> G[DepartmentDao.getRecordById]
  G --> H[POST editDept.jsp]
  H --> I[UPDATE department]
  I --> A
  B -->|Delete| J[POST /DeleteServlet did]
  J --> K[DELETE FROM department]
  K --> A
```

The same pattern applies to doctors, patients, and nurses with their list pages, process JSPs, edit pages, and delete servlets.

## Session and navigation

```mermaid
stateDiagram-v2
  [*] --> Anonymous
  Anonymous --> StaffSession: LoginDao OK
  Anonymous --> DoctorSession: DoctorLogin OK
  Anonymous --> PatientSession: PatientLogin OK
  StaffSession --> Anonymous: logout.jsp
  DoctorSession --> Anonymous: logout.jsp
  PatientSession --> Anonymous: logout.jsp

  state StaffSession {
    [*] --> Departments
    Departments --> Doctors
    Doctors --> Patients
    Patients --> Nurses
    Nurses --> Feedback
    Feedback --> Profile
  }

  state DoctorSession {
    [*] --> Appointments
    Appointments --> DoctorProfile
  }

  state PatientSession {
    [*] --> BookVisit
    BookVisit --> AppointmentsList
    AppointmentsList --> PatientFeedback
    PatientFeedback --> PatientProfile
  }
```

Unauthenticated access to desk pages redirects to the role’s login page (`index.jsp`, `doctorLogin.jsp`, or `patientLogin.jsp`).

## Appointment lifecycle

```mermaid
flowchart LR
  P[Patient books] --> A[(appointment row)]
  A --> D[Doctor views afterDoctorLogin]
  D --> X[DeleteAppointment]
  A --> V[Patient views viewAppointment]
  V --> C[CancelAppointment]
  X --> G[(row removed)]
  C --> G
```

Logical link: `appointment.id` stores the doctor’s `doctor_id` (no database foreign key).

## Related

- [Database](database.md) — tables touched by these flows  
- [Components](components.md) — servlet and process page names  
