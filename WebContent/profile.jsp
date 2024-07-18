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

<%
	Connection con = ConnectionProvider.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from user where name='" + session.getAttribute("uname") + "' ");
	if (rs.next()) {
%>
<section class="card">
	<h1 class="card__title">Profile</h1>
	<form class="form" action="UpdateUserDao" method="post">
		<div class="form__field">
			<label class="form__label" for="name">Name</label>
			<input class="form__control" id="name" type="text" name="name" value="<%=rs.getString(2)%>">
		</div>
		<div class="form__field">
			<label class="form__label" for="email">Email</label>
			<input class="form__control" id="email" type="email" name="email" value="<%=rs.getString(3)%>">
		</div>
		<div class="form__field">
			<label class="form__label" for="address">Address</label>
			<input class="form__control" id="address" type="text" name="address" value="<%=rs.getString(4)%>">
		</div>
		<div class="form__field">
			<label class="form__label" for="phone">Phone</label>
			<input class="form__control" id="phone" type="text" name="phone" value="<%=rs.getString(5)%>">
		</div>
		<div class="form__actions">
			<button class="btn btn--primary" type="submit">Save profile</button>
		</div>
	</form>
</section>

<section class="card">
	<h1 class="card__title">Password</h1>
	<form class="form" action="UpdateUserPassword" method="post">
		<div class="form__field">
			<label class="form__label" for="password">Current password</label>
			<input class="form__control" id="password" type="password" name="password" value="<%=rs.getString(6)%>">
		</div>
		<div class="form__field">
			<label class="form__label" for="newpwd">New password</label>
			<input class="form__control" id="newpwd" type="password" name="newpwd">
		</div>
		<div class="form__field">
			<label class="form__label" for="conpwd">Confirm new password</label>
			<input class="form__control" id="conpwd" type="password" name="conpwd">
		</div>
		<div class="form__actions">
			<button class="btn btn--primary" type="submit">Save password</button>
		</div>
	</form>
</section>
<%
	}
%>

<%@ include file="includes/shell-close.jsp" %>
