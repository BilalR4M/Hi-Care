<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.bean.Department"%>
<%@ page import="com.department.*"%>
<%
	if (session.getAttribute("uname") == null || "".equals(session.getAttribute("uname"))) {
		response.sendRedirect("index.jsp");
		return;
	}
	request.setAttribute("nav", "staff");
	request.setAttribute("profileHref", "profile.jsp");
	String id = request.getParameter("id");
	Department d = DepartmentDao.getRecordById(Integer.parseInt(id));
	if (d == null) {
		response.sendRedirect("department.jsp");
		return;
	}
%>
<%@ include file="includes/head.jsp" %>
<%@ include file="includes/shell-open.jsp" %>

<section class="card">
	<h1 class="card__title">Edit department</h1>
	<form class="form" action="editDept.jsp" method="post">
		<input type="hidden" name="dept_id" value="<%=d.getDept_id()%>">
		<div class="form__field">
			<label class="form__label" for="deptName">Department name</label>
			<input class="form__control" id="deptName" type="text" name="deptName" value="<%=d.getDeptName()%>" required>
		</div>
		<div class="form__field">
			<label class="form__label" for="deptDesc">Description</label>
			<input class="form__control" id="deptDesc" type="text" name="deptDesc" value="<%=d.getDeptDesc()%>" required>
		</div>
		<div class="form__actions">
			<button class="btn btn--primary" type="submit">Save changes</button>
			<a class="btn btn--ghost" href="department.jsp">Cancel</a>
		</div>
	</form>
</section>

<%@ include file="includes/shell-close.jsp" %>
