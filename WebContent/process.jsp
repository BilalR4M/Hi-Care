<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.user.RegisterDao"%>
<jsp:useBean id="obj" class="com.bean.User" />
<jsp:setProperty property="*" name="obj" />
<%
	int status = RegisterDao.register(obj);
%>
<%@ include file="includes/head.jsp" %>
<div class="gate">
	<div class="gate__card">
		<p class="gate__brand"><img class="gate__logo" src="images/logo.png" alt="">Hi Care</p>
		<%
			if (status > 0) {
		%>
		<h1 class="gate__title">Account created</h1>
		<p class="gate__lead">Your staff account is ready.</p>
		<a class="btn btn--primary" href="index.jsp">Sign in</a>
		<%
			} else {
		%>
		<h1 class="gate__title">Account was not created</h1>
		<p class="gate__lead">Check the name, email, and password, then try again.</p>
		<a class="btn btn--primary" href="user_register.jsp">Back to the form</a>
		<%
			}
		%>
	</div>
</div>
</body>
</html>
