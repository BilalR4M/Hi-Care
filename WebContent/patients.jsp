<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<%
	if (session.getAttribute("uname") == null || "".equals(session.getAttribute("uname"))) {
		response.sendRedirect("index.jsp");
		return;
	}
	request.setAttribute("nav", "staff");
	request.setAttribute("profileHref", "profile.jsp");
%>
<%@ include file="includes/head.jsp" %>
<%@ include file="includes/shell-open.jsp" %>

<section class="card">
	<h1 class="card__title">Patients</h1>
	<ul class="tabs">
		<li><a class="tabs__link is-active" href="#list">Patient list</a></li>
		<li><a class="tabs__link" href="#add">Add patient</a></li>
	</ul>

	<div id="list" class="panel is-visible">
		<div class="table-wrap">
			<table class="table">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Age</th>
						<th>Sex</th>
						<th>Blood group</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
				<%
					Connection con = ConnectionProvider.getCon();
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("select * from patient");
					while (rs.next()) {
				%>
					<tr>
						<td class="table__id"><%=rs.getInt(1)%></td>
						<td><%=rs.getString(2)%></td>
						<td><%=rs.getString(9)%></td>
						<td><%=rs.getString(7)%></td>
						<td><%=rs.getString(10)%></td>
						<td>
							<div class="table__actions">
								<a class="btn btn--edit" href="editPatients.jsp?id=<%=rs.getInt(1)%>">
									<svg class="btn__icon" viewBox="0 0 24 24" aria-hidden="true"><path d="M12 20h9"/><path d="M16.5 3.5a2.1 2.1 0 0 1 3 3L7 19l-4 1 1-4 12.5-12.5z"/></svg>
									Edit
								</a>
								<form action="DeletePatient" method="post">
									<input type="hidden" name="pid" value="<%=rs.getInt(1)%>">
									<button class="btn btn--danger" type="submit">
										<svg class="btn__icon" viewBox="0 0 24 24" aria-hidden="true"><path d="M3 6h18"/><path d="M8 6V4h8v2"/><path d="M19 6l-1 14H6L5 6"/></svg>
										Delete
									</button>
								</form>
							</div>
						</td>
					</tr>
				<%
					}
				%>
				</tbody>
			</table>
		</div>
	</div>

	<div id="add" class="panel">
		<form class="form form--wide" action="patientProcess.jsp" method="post">
			<div class="form__field">
				<label class="form__label" for="patientname">Name</label>
				<input class="form__control" id="patientname" type="text" name="patientname" required>
			</div>
			<div class="form__field">
				<label class="form__label" for="email">Email</label>
				<input class="form__control" id="email" type="email" name="email" required>
			</div>
			<div class="form__field">
				<label class="form__label" for="pwd">Password</label>
				<input class="form__control" id="pwd" type="password" name="pwd" required>
			</div>
			<div class="form__field">
				<label class="form__label" for="add">Address</label>
				<input class="form__control" id="add" type="text" name="add" required>
			</div>
			<div class="form__field">
				<label class="form__label" for="phon">Phone</label>
				<input class="form__control" id="phon" type="text" name="phon" required>
			</div>
			<div class="form__field">
				<label class="form__label" for="sex">Sex</label>
				<select class="form__control" id="sex" name="sex">
					<option>Male</option>
					<option>Female</option>
				</select>
			</div>
			<div class="form__field">
				<label class="form__label" for="bdate">Birth date</label>
				<input class="form__control" id="bdate" type="date" name="bdate">
			</div>
			<div class="form__field">
				<label class="form__label" for="age">Age</label>
				<input class="form__control" id="age" type="text" name="age">
			</div>
			<div class="form__field">
				<label class="form__label" for="bgroup">Blood group</label>
				<select class="form__control" id="bgroup" name="bgroup">
					<option>A+</option>
					<option>A-</option>
					<option>B+</option>
					<option>B-</option>
					<option>AB+</option>
					<option>AB-</option>
					<option>O+</option>
					<option>O-</option>
				</select>
			</div>
			<div class="form__actions">
				<button class="btn btn--primary" type="submit">Add patient</button>
			</div>
		</form>
	</div>
</section>

<%@ include file="includes/shell-close.jsp" %>
