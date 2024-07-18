<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes/head.jsp" %>
<div class="gate">
	<div class="gate__card">
		<p class="gate__brand"><img class="gate__logo" src="images/logo.png" alt="">Hi Care</p>
		<p class="gate__lead">Book a visit, check the day, and leave a note for the ward.</p>
		<form class="form" action="PatientLogin" method="post">
			<h1 class="gate__title">Patient sign in</h1>
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
			<a href="index.jsp">Staff sign in</a>
			<a href="doctorLogin.jsp">Doctor sign in</a>
		</p>
	</div>
</div>
</body>
</html>
