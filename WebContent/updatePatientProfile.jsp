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

<%
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from patient where patient_name='" + session.getAttribute("uname") + "'");
	if (rs.next()) {
		String sex = rs.getString(7);
		String bgroup = rs.getString(10);
%>
<section class="card">
	<h1 class="card__title">Profile</h1>
	<form class="form form--wide" action="UpdatePatientInfo" method="post">
		<input type="hidden" name="patient_id" value="<%=rs.getInt(1)%>">
		<div class="form__field">
			<label class="form__label" for="patientname">Name</label>
			<input class="form__control" id="patientname" type="text" name="patientname" value="<%=rs.getString(2)%>">
		</div>
		<div class="form__field">
			<label class="form__label" for="email">Email</label>
			<input class="form__control" id="email" type="email" name="email" value="<%=rs.getString(3)%>">
		</div>
		<div class="form__field">
			<label class="form__label" for="pwd">Password</label>
			<input class="form__control" id="pwd" type="password" name="pwd" value="<%=rs.getString(4)%>">
		</div>
		<div class="form__field">
			<label class="form__label" for="add">Address</label>
			<input class="form__control" id="add" type="text" name="add" value="<%=rs.getString(5)%>">
		</div>
		<div class="form__field">
			<label class="form__label" for="phon">Phone</label>
			<input class="form__control" id="phon" type="text" name="phon" value="<%=rs.getString(6)%>">
		</div>
		<div class="form__field">
			<label class="form__label" for="sex">Sex</label>
			<select class="form__control" id="sex" name="sex">
				<option<%= "Male".equals(sex) ? " selected" : "" %>>Male</option>
				<option<%= "Female".equals(sex) ? " selected" : "" %>>Female</option>
			</select>
		</div>
		<div class="form__field">
			<label class="form__label" for="age">Age</label>
			<input class="form__control" id="age" type="text" name="age" value="<%=rs.getInt(9)%>">
		</div>
		<div class="form__field">
			<label class="form__label" for="bgroup">Blood group</label>
			<select class="form__control" id="bgroup" name="bgroup">
				<option<%= "A+".equals(bgroup) ? " selected" : "" %>>A+</option>
				<option<%= "A-".equals(bgroup) ? " selected" : "" %>>A-</option>
				<option<%= "B+".equals(bgroup) ? " selected" : "" %>>B+</option>
				<option<%= "B-".equals(bgroup) ? " selected" : "" %>>B-</option>
				<option<%= "AB+".equals(bgroup) ? " selected" : "" %>>AB+</option>
				<option<%= "AB-".equals(bgroup) ? " selected" : "" %>>AB-</option>
				<option<%= "O+".equals(bgroup) ? " selected" : "" %>>O+</option>
				<option<%= "O-".equals(bgroup) ? " selected" : "" %>>O-</option>
			</select>
		</div>
		<div class="form__actions">
			<button class="btn btn--primary" type="submit">Save patient</button>
		</div>
	</form>
</section>
<%
	}
%>

<%@ include file="includes/shell-close.jsp" %>
