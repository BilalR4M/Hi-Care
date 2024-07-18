<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bean.Doctor"%>
<%@ page import="com.doctor.*"%>
<%
	if (session.getAttribute("uname") == null || "".equals(session.getAttribute("uname"))) {
		response.sendRedirect("index.jsp");
		return;
	}
	request.setAttribute("nav", "staff");
	request.setAttribute("profileHref", "profile.jsp");
	String id = request.getParameter("id");
	Doctor d = DoctorDao.getRecordById(Integer.parseInt(id));
%>
<%@ include file="includes/head.jsp" %>
<%@ include file="includes/shell-open.jsp" %>

<section class="card">
	<h1 class="card__title">Edit doctor</h1>
	<form class="form" action="editDoc.jsp" method="post">
		<div class="form__field">
			<label class="form__label" for="doctor_id">Doctor ID</label>
			<input class="form__control" id="doctor_id" type="number" name="doctor_id" value="<%=d.getDoctor_id()%>" readonly>
		</div>
		<div class="form__field">
			<label class="form__label" for="doctname">Name</label>
			<input class="form__control" id="doctname" type="text" name="doctname" value="<%=d.getDoctname()%>" required>
		</div>
		<div class="form__field">
			<label class="form__label" for="email">Email</label>
			<input class="form__control" id="email" type="email" name="email" value="<%=d.getEmail()%>" required>
		</div>
		<div class="form__field">
			<label class="form__label" for="pwd">Password</label>
			<input class="form__control" id="pwd" type="password" name="pwd" value="<%=d.getPwd()%>" required>
		</div>
		<div class="form__field">
			<label class="form__label" for="add">Address</label>
			<input class="form__control" id="add" type="text" name="add" value="<%=d.getAdd()%>" required>
		</div>
		<div class="form__field">
			<label class="form__label" for="phon">Phone</label>
			<input class="form__control" id="phon" type="text" name="phon" value="<%=d.getPhon()%>" required>
		</div>
		<div class="form__field">
			<label class="form__label" for="dept">Department</label>
			<input class="form__control" id="dept" type="text" name="dept" value="<%=d.getDept()%>" required>
		</div>
		<div class="form__actions">
			<button class="btn btn--primary" type="submit">Save doctor</button>
			<a class="btn btn--ghost" href="doctor.jsp">Cancel</a>
		</div>
	</form>
</section>

<%@ include file="includes/shell-close.jsp" %>
