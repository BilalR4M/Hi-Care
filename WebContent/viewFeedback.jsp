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

<section class="card">
	<h1 class="card__title">Feedback</h1>
	<p class="card__subtitle">Notes left by patients after a visit.</p>
	<div class="table-wrap">
		<table class="table">
			<thead>
				<tr>
					<th>Name</th>
					<th>Email</th>
					<th>Contact</th>
					<th>Feedback</th>
				</tr>
			</thead>
			<tbody>
			<%
				Connection con = ConnectionProvider.getCon();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from feedback");
				while (rs.next()) {
			%>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
				</tr>
			<%
				}
			%>
			</tbody>
		</table>
	</div>
</section>

<%@ include file="includes/shell-close.jsp" %>
