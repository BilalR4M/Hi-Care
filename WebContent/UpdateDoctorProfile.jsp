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

<%
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from doctor where doc_name='" + session.getAttribute("uname") + "'");
	if (rs.next()) {
%>
<section class="card">
	<h1 class="card__title">Profile</h1>
	<form class="form" action="UpdateDoctorInfo" method="post">
		<input type="hidden" name="doctor_id" value="<%=rs.getInt(1)%>">
		<div class="form__field">
			<label class="form__label" for="doctorname">Name</label>
			<input class="form__control" id="doctorname" type="text" name="doctorname" value="<%=rs.getString(2)%>">
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
			<label class="form__label" for="department">Department</label>
			<input class="form__control" id="department" type="text" name="department" value="<%=rs.getString(7)%>">
		</div>
		<div class="form__actions">
			<button class="btn btn--primary" type="submit">Save doctor</button>
		</div>
	</form>
</section>
<%
	}
%>

<%@ include file="includes/shell-close.jsp" %>
