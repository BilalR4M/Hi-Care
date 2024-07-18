<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<%
	if (session.getAttribute("uname") == null || "".equals(session.getAttribute("uname"))) {
		response.sendRedirect("doctorLogin.jsp");
		return;
	}
	request.setAttribute("nav", "doctor");
	request.setAttribute("profileHref", "UpdateDoctorProfile.jsp");
%>
<%@ include file="includes/head.jsp" %>
<%@ include file="includes/shell-open.jsp" %>

<section class="card">
	<h1 class="card__title">Appointments</h1>
	<p class="card__subtitle">Visits booked under your doctor ID.</p>
	<div class="table-wrap">
		<table class="table">
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Email</th>
					<th>Contact</th>
					<th>Age</th>
					<th>Day</th>
					<th>Speciality</th>
					<th>Description</th>
					<th>Doctor ID</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
			<%
				Connection con = ConnectionProvider.getCon();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(
						"select * from appointment where id='" + session.getAttribute("doctor_id") + "' order by day");
				while (rs.next()) {
			%>
				<tr>
					<td class="table__id"><%=rs.getInt(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=rs.getString(7)%></td>
					<td><%=rs.getString(8)%></td>
					<td><%=rs.getInt(9)%></td>
					<td>
						<form action="DeleteAppointment" method="post">
							<input type="hidden" name="apid" value="<%=rs.getInt(1)%>">
							<button class="btn btn--danger" type="submit">
								<svg class="btn__icon" viewBox="0 0 24 24" aria-hidden="true"><path d="M3 6h18"/><path d="M8 6V4h8v2"/><path d="M19 6l-1 14H6L5 6"/></svg>
								Delete
							</button>
						</form>
					</td>
				</tr>
			<%
				}
			%>
			</tbody>
		</table>
	</div>
</section>

<%@ include file="includes/shell-close.jsp" %>
