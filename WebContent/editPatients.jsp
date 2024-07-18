<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bean.Patient"%>
<%@ page import="com.patient.*"%>
<%
	if (session.getAttribute("uname") == null || "".equals(session.getAttribute("uname"))) {
		response.sendRedirect("index.jsp");
		return;
	}
	request.setAttribute("nav", "staff");
	request.setAttribute("profileHref", "profile.jsp");
	String id = request.getParameter("id");
	Patient p = PatientDao.getRecordById(Integer.parseInt(id));
%>
<%@ include file="includes/head.jsp" %>
<%@ include file="includes/shell-open.jsp" %>

<section class="card">
	<h1 class="card__title">Edit patient</h1>
	<form class="form form--wide" action="editPatie.jsp" method="post">
		<input type="hidden" name="patient_id" value="<%=p.getPatient_id()%>">
		<div class="form__field">
			<label class="form__label" for="patientname">Name</label>
			<input class="form__control" id="patientname" type="text" name="patientname" value="<%=p.getPatientname()%>" required>
		</div>
		<div class="form__field">
			<label class="form__label" for="email">Email</label>
			<input class="form__control" id="email" type="email" name="email" value="<%=p.getEmail()%>" required>
		</div>
		<div class="form__field">
			<label class="form__label" for="pwd">Password</label>
			<input class="form__control" id="pwd" type="password" name="pwd" value="<%=p.getPwd()%>" required>
		</div>
		<div class="form__field">
			<label class="form__label" for="add">Address</label>
			<input class="form__control" id="add" type="text" name="add" value="<%=p.getAdd()%>" required>
		</div>
		<div class="form__field">
			<label class="form__label" for="phon">Phone</label>
			<input class="form__control" id="phon" type="text" name="phon" value="<%=p.getPhon()%>" required>
		</div>
		<div class="form__field">
			<label class="form__label" for="sex">Sex</label>
			<select class="form__control" id="sex" name="sex">
				<option<%= "Male".equals(p.getSex()) ? " selected" : "" %>>Male</option>
				<option<%= "Female".equals(p.getSex()) ? " selected" : "" %>>Female</option>
			</select>
		</div>
		<div class="form__field">
			<label class="form__label" for="age">Age</label>
			<input class="form__control" id="age" type="text" name="age" value="<%=p.getAge()%>">
		</div>
		<div class="form__field">
			<label class="form__label" for="bgroup">Blood group</label>
			<select class="form__control" id="bgroup" name="bgroup">
				<option<%= "A+".equals(p.getBgroup()) ? " selected" : "" %>>A+</option>
				<option<%= "A-".equals(p.getBgroup()) ? " selected" : "" %>>A-</option>
				<option<%= "B+".equals(p.getBgroup()) ? " selected" : "" %>>B+</option>
				<option<%= "B-".equals(p.getBgroup()) ? " selected" : "" %>>B-</option>
				<option<%= "AB+".equals(p.getBgroup()) ? " selected" : "" %>>AB+</option>
				<option<%= "AB-".equals(p.getBgroup()) ? " selected" : "" %>>AB-</option>
				<option<%= "O+".equals(p.getBgroup()) ? " selected" : "" %>>O+</option>
				<option<%= "O-".equals(p.getBgroup()) ? " selected" : "" %>>O-</option>
			</select>
		</div>
		<div class="form__actions">
			<button class="btn btn--primary" type="submit">Save patient</button>
			<a class="btn btn--ghost" href="patients.jsp">Cancel</a>
		</div>
	</form>
</section>

<%@ include file="includes/shell-close.jsp" %>
