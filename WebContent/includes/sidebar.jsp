<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String nav = (String) request.getAttribute("nav");
	if (nav == null) {
		nav = "staff";
	}
	String profileHref = (String) request.getAttribute("profileHref");
	if (profileHref == null || profileHref.trim().isEmpty()) {
		if ("doctor".equals(nav)) {
			profileHref = "UpdateDoctorProfile.jsp";
		} else if ("patient".equals(nav)) {
			profileHref = "updatePatientProfile.jsp";
		} else {
			profileHref = "profile.jsp";
		}
	}
%>
<aside class="shell__sidebar">
	<a class="shell__mark" href="#">
		<img class="shell__logo" src="images/logo.png" alt="">
		<span>Hi Care</span>
	</a>
	<nav class="shell__nav-wrap" aria-label="Main">
		<ul class="shell__nav">
			<%
				if ("staff".equals(nav)) {
			%>
			<li>
				<a class="shell__nav-link" href="department.jsp">
					<svg class="shell__nav-icon" viewBox="0 0 24 24" aria-hidden="true"><path d="M3 21V8l9-5 9 5v13"/><path d="M9 21v-8h6v8"/></svg>
					<span>Departments</span>
				</a>
			</li>
			<li>
				<a class="shell__nav-link" href="doctor.jsp">
					<svg class="shell__nav-icon" viewBox="0 0 24 24" aria-hidden="true"><circle cx="12" cy="7" r="3"/><path d="M5 21v-2a5 5 0 0 1 5-5h4a5 5 0 0 1 5 5v2"/><path d="M12 11v4"/><path d="M10 13h4"/></svg>
					<span>Doctors</span>
				</a>
			</li>
			<li>
				<a class="shell__nav-link" href="patients.jsp">
					<svg class="shell__nav-icon" viewBox="0 0 24 24" aria-hidden="true"><circle cx="12" cy="7" r="3"/><path d="M5 21v-2a5 5 0 0 1 5-5h4a5 5 0 0 1 5 5v2"/><path d="M16 4h4"/><path d="M18 2v4"/></svg>
					<span>Patients</span>
				</a>
			</li>
			<li>
				<a class="shell__nav-link" href="nurse.jsp">
					<svg class="shell__nav-icon" viewBox="0 0 24 24" aria-hidden="true"><path d="M12 3l7 4v5c0 5-3.5 8-7 9-3.5-1-7-4-7-9V7l7-4z"/><path d="M12 9v6"/><path d="M9 12h6"/></svg>
					<span>Nurses</span>
				</a>
			</li>
			<li>
				<a class="shell__nav-link" href="viewFeedback.jsp">
					<svg class="shell__nav-icon" viewBox="0 0 24 24" aria-hidden="true"><path d="M4 5h16v10H8l-4 4V5z"/></svg>
					<span>Feedback</span>
				</a>
			</li>
			<%
				} else if ("doctor".equals(nav)) {
			%>
			<li>
				<a class="shell__nav-link" href="afterDoctorLogin.jsp">
					<svg class="shell__nav-icon" viewBox="0 0 24 24" aria-hidden="true"><rect x="3" y="5" width="18" height="16" rx="2"/><path d="M3 10h18"/><path d="M8 3v4"/><path d="M16 3v4"/></svg>
					<span>Appointments</span>
				</a>
			</li>
			<%
				} else if ("patient".equals(nav)) {
			%>
			<li>
				<a class="shell__nav-link" href="afterPatientLogin.jsp">
					<svg class="shell__nav-icon" viewBox="0 0 24 24" aria-hidden="true"><rect x="3" y="5" width="18" height="16" rx="2"/><path d="M3 10h18"/><path d="M8 3v4"/><path d="M16 3v4"/></svg>
					<span>Book a visit</span>
				</a>
			</li>
			<li>
				<a class="shell__nav-link" href="viewAppointment.jsp">
					<svg class="shell__nav-icon" viewBox="0 0 24 24" aria-hidden="true"><path d="M8 6h13"/><path d="M8 12h13"/><path d="M8 18h13"/><path d="M3 6h.01"/><path d="M3 12h.01"/><path d="M3 18h.01"/></svg>
					<span>Appointments</span>
				</a>
			</li>
			<li>
				<a class="shell__nav-link" href="feedback.jsp">
					<svg class="shell__nav-icon" viewBox="0 0 24 24" aria-hidden="true"><path d="M4 5h16v10H8l-4 4V5z"/></svg>
					<span>Feedback</span>
				</a>
			</li>
			<%
				}
			%>
		</ul>
	</nav>
	<div class="shell__account-nav">
		<a class="shell__nav-link" href="<%=profileHref%>">
			<svg class="shell__nav-icon" viewBox="0 0 24 24" aria-hidden="true"><circle cx="12" cy="8" r="3.5"/><path d="M5 20a7 7 0 0 1 14 0"/></svg>
			<span>Profile</span>
		</a>
		<a class="shell__nav-link shell__nav-link--muted" href="logout.jsp">
			<svg class="shell__nav-icon" viewBox="0 0 24 24" aria-hidden="true"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><path d="M16 17l5-5-5-5"/><path d="M21 12H9"/></svg>
			<span>Sign out</span>
		</a>
	</div>
</aside>
