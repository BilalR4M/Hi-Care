<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
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
	<h1 class="card__title">Book a visit</h1>
	<ul class="tabs">
		<li><a class="tabs__link is-active" href="#list">Doctor list</a></li>
		<li><a class="tabs__link" href="#book">Book a visit</a></li>
	</ul>

	<div id="list" class="panel is-visible">
		<div class="table-wrap">
			<table class="table">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Department</th>
						<th>Email</th>
					</tr>
				</thead>
				<tbody>
				<%
					Connection con = ConnectionProvider.getCon();
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("select * from doctor");
					while (rs.next()) {
				%>
					<tr>
						<td class="table__id"><%=rs.getInt(1)%></td>
						<td><%=rs.getString(2)%></td>
						<td><%=rs.getString(7)%></td>
						<td><%=rs.getString(3)%></td>
					</tr>
				<%
					}
				%>
				</tbody>
			</table>
		</div>
	</div>

	<div id="book" class="panel">
		<form class="form form--wide" action="appointmentProcess.jsp" method="post">
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
				<input class="form__control" id="contact" type="text" name="contact" required>
			</div>
			<div class="form__field">
				<label class="form__label" for="age">Age</label>
				<input class="form__control" id="age" type="text" name="age">
			</div>
			<div class="form__field">
				<label class="form__label" for="day">Day</label>
				<input class="form__control" id="day" type="date" name="day" required>
			</div>
			<div class="form__field">
				<label class="form__label" for="speciality">Speciality</label>
				<input class="form__control" id="speciality" type="text" name="speciality">
			</div>
			<div class="form__field">
				<label class="form__label" for="description">Description</label>
				<input class="form__control" id="description" type="text" name="description">
			</div>
			<div class="form__field">
				<label class="form__label" for="id">Doctor ID</label>
				<input class="form__control" id="id" type="text" name="id" required>
			</div>
			<div class="form__actions">
				<button class="btn btn--primary" type="submit">Book a visit</button>
			</div>
		</form>
	</div>
</section>

<%@ include file="includes/shell-close.jsp" %>
