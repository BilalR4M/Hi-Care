<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String pageTitle = (String) request.getAttribute("pageTitle");
	if (pageTitle == null || pageTitle.trim().isEmpty()) {
		String uri = request.getRequestURI();
		String currentPage = uri.substring(uri.lastIndexOf('/') + 1);
		if ("department.jsp".equals(currentPage) || "editDepartment.jsp".equals(currentPage)) {
			pageTitle = "Departments";
		} else if ("doctor.jsp".equals(currentPage) || "editDoctor.jsp".equals(currentPage)) {
			pageTitle = "Doctors";
		} else if ("patients.jsp".equals(currentPage) || "editPatients.jsp".equals(currentPage)) {
			pageTitle = "Patients";
		} else if ("nurse.jsp".equals(currentPage) || "editNurse.jsp".equals(currentPage)) {
			pageTitle = "Nurses";
		} else if ("viewFeedback.jsp".equals(currentPage) || "feedback.jsp".equals(currentPage)) {
			pageTitle = "Feedback";
		} else if ("profile.jsp".equals(currentPage) || "UpdateDoctorProfile.jsp".equals(currentPage)
				|| "updatePatientProfile.jsp".equals(currentPage)) {
			pageTitle = "Profile";
		} else if ("afterDoctorLogin.jsp".equals(currentPage) || "viewAppointment.jsp".equals(currentPage)) {
			pageTitle = "Appointments";
		} else if ("afterPatientLogin.jsp".equals(currentPage)) {
			pageTitle = "Book a visit";
		} else if ("doctorLogin.jsp".equals(currentPage)) {
			pageTitle = "Doctor sign in";
		} else if ("patientLogin.jsp".equals(currentPage)) {
			pageTitle = "Patient sign in";
		} else if ("user_register.jsp".equals(currentPage)) {
			pageTitle = "Create account";
		} else if ("index.jsp".equals(currentPage) || currentPage.isEmpty()) {
			pageTitle = "Staff sign in";
		} else {
			pageTitle = "Hi Care";
		}
		request.setAttribute("pageTitle", pageTitle);
	}
%>
