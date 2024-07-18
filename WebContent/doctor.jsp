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
	<h1 class="card__title">Doctors</h1>
	<ul class="tabs">
		<li><a class="tabs__link is-active" href="#list">Doctor list</a></li>
		<li><a class="tabs__link" href="#add">Add doctor</a></li>
	</ul>

	<div id="list" class="panel is-visible">
		<div class="table-wrap">
			<table class="table">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Department</th>
						<th>Phone</th>
						<th>Actions</th>
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
						<td><%=rs.getString(6)%></td>
						<td>
							<div class="table__actions">
								<a class="btn btn--edit" href="editDoctor.jsp?id=<%=rs.getInt(1)%>">
									<svg class="btn__icon" viewBox="0 0 24 24" aria-hidden="true"><path d="M12 20h9"/><path d="M16.5 3.5a2.1 2.1 0 0 1 3 3L7 19l-4 1 1-4 12.5-12.5z"/></svg>
									Edit
								</a>
								<form action="DeleteDoctor" method="post">
									<input type="hidden" name="docId" value="<%=rs.getInt(1)%>">
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
		<form class="form" action="doctorProcess.jsp" method="post">
			<div class="form__field">
				<label class="form__label" for="doctname">Name</label>
				<input class="form__control" id="doctname" type="text" name="doctname" required>
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
				<label class="form__label" for="dept">Department</label>
				<select class="form__control" id="dept" name="dept" required>
					<option value="">Select department</option>
					<%
						Statement stmt = con.createStatement();
						ResultSet resultset = stmt.executeQuery("select dept_name from department");
						while (resultset.next()) {
					%>
					<option><%=resultset.getString(1)%></option>
					<%
						}
					%>
				</select>
			</div>
			<div class="form__actions">
				<button class="btn btn--primary" type="submit">Add doctor</button>
			</div>
		</form>
	</div>
</section>

<%@ include file="includes/shell-close.jsp" %>
