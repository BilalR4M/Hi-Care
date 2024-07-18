<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes/head.jsp" %>
<div class="gate">
	<div class="gate__card">
		<p class="gate__brand"><img class="gate__logo" src="images/logo.png" alt="">Hi Care</p>
		<p class="gate__lead">A staff account can keep departments, doctors, nurses, and patients up to date.</p>
		<form class="form" action="process.jsp" method="post">
			<h1 class="gate__title">Create a staff account</h1>
			<div class="form__field">
				<label class="form__label" for="name">Name</label>
				<input class="form__control" id="name" name="name" type="text" autocomplete="name" required>
			</div>
			<div class="form__field">
				<label class="form__label" for="email">Email</label>
				<input class="form__control" id="email" name="email" type="email" autocomplete="email" required>
			</div>
			<div class="form__field">
				<label class="form__label" for="address">Address</label>
				<input class="form__control" id="address" name="address" type="text" autocomplete="street-address" required>
			</div>
			<div class="form__field">
				<label class="form__label" for="phone">Phone</label>
				<input class="form__control" id="phone" name="phone" type="text" autocomplete="tel" required>
			</div>
			<div class="form__field">
				<label class="form__label" for="password">Password</label>
				<input class="form__control" id="password" name="password" type="password" autocomplete="new-password" required>
			</div>
			<div class="form__actions">
				<button class="btn btn--primary" type="submit">Create account</button>
			</div>
		</form>
		<p class="gate__links">
			<a href="index.jsp">Staff sign in</a>
		</p>
	</div>
</div>
</body>
</html>
