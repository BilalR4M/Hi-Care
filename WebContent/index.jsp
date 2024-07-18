<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes/head.jsp" %>
<div class="gate">
	<div class="gate__card">
		<p class="gate__brand"><img class="gate__logo" src="images/logo.png" alt="">Hi Care</p>
		<p class="gate__lead">Staff access to departments, doctors, nurses, and patients.</p>
		<form class="form" action="LoginDao" method="post">
			<h1 class="gate__title">Staff sign in</h1>
			<div class="form__field">
				<label class="form__label" for="email">Email</label>
				<input class="form__control" id="email" name="email" type="email" autocomplete="username" required>
			</div>
			<div class="form__field">
				<label class="form__label" for="password">Password</label>
				<input class="form__control" id="password" name="password" type="password" autocomplete="current-password" required>
			</div>
			<div class="form__actions">
				<button class="btn btn--primary" type="submit">Sign in</button>
			</div>
		</form>
		<p class="gate__links">
			<a href="doctorLogin.jsp">Doctor sign in</a>
			<a href="patientLogin.jsp">Patient sign in</a>
			<a href="user_register.jsp">Create a staff account</a>
		</p>
	</div>
</div>
</body>
</html>
