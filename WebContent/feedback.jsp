<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("uname") == null || "".equals(session.getAttribute("uname"))) {
		response.sendRedirect("patientLogin.jsp");
		return;
	}
	request.setAttribute("nav", "patient");
	request.setAttribute("profileHref", "updatePatientProfile.jsp");
%>
<%@ include file="includes/head.jsp" %>
<%@ include file="includes/shell-open.jsp" %>

<section class="card">
	<h1 class="card__title">Feedback</h1>
	<p class="card__subtitle">Leave a note for the ward after your visit.</p>
	<form class="form" action="feedbackProcess.jsp" method="post">
		<div class="form__field">
			<label class="form__label" for="name">Name</label>
			<input class="form__control" id="name" type="text" name="name" required>
		</div>
		<div class="form__field">
			<label class="form__label" for="email">Email</label>
			<input class="form__control" id="email" type="text" name="email" required>
		</div>
		<div class="form__field">
			<label class="form__label" for="contact">Contact</label>
			<input class="form__control" id="contact" type="text" name="contact">
		</div>
		<div class="form__field">
			<label class="form__label" for="suggestion">Suggestion</label>
			<input class="form__control" id="suggestion" type="text" name="suggestion" required>
		</div>
		<div class="form__actions">
			<button class="btn btn--primary" type="submit">Submit feedback</button>
		</div>
	</form>
</section>

<%@ include file="includes/shell-close.jsp" %>
