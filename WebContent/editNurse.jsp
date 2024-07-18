<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bean.Nurse"%>
<%@ page import="com.nurse.*"%>
<%
	if (session.getAttribute("uname") == null || "".equals(session.getAttribute("uname"))) {
		response.sendRedirect("index.jsp");
		return;
	}
	request.setAttribute("nav", "staff");
	request.setAttribute("profileHref", "profile.jsp");
	String id = request.getParameter("id");
	Nurse n = NurseDao.getRecordById(Integer.parseInt(id));
%>
<%@ include file="includes/head.jsp" %>
<%@ include file="includes/shell-open.jsp" %>

<section class="card">
	<h1 class="card__title">Edit nurse</h1>
	<form class="form" action="editNur.jsp" method="post">
		<div class="form__field">
			<label class="form__label" for="nurse_id">Nurse ID</label>
			<input class="form__control" id="nurse_id" type="text" name="nurse_id" value="<%=n.getNurse_id()%>" readonly>
		</div>
		<div class="form__field">
			<label class="form__label" for="name">Name</label>
			<input class="form__control" id="name" type="text" name="name" value="<%=n.getName()%>" required>
		</div>
		<div class="form__field">
			<label class="form__label" for="email">Email</label>
			<input class="form__control" id="email" type="email" name="email" value="<%=n.getEmail()%>" required>
		</div>
		<div class="form__field">
			<label class="form__label" for="password">Password</label>
			<input class="form__control" id="password" type="password" name="password" value="<%=n.getPassword()%>" required>
		</div>
		<div class="form__field">
			<label class="form__label" for="address">Address</label>
			<input class="form__control" id="address" type="text" name="address" value="<%=n.getAddress()%>" required>
		</div>
		<div class="form__field">
			<label class="form__label" for="phone">Phone</label>
			<input class="form__control" id="phone" type="text" name="phone" value="<%=n.getPhone()%>" required>
		</div>
		<div class="form__actions">
			<button class="btn btn--primary" type="submit">Save nurse</button>
			<a class="btn btn--ghost" href="nurse.jsp">Cancel</a>
		</div>
	</form>
</section>

<%@ include file="includes/shell-close.jsp" %>
