<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header class="shell__header">
	<h1 class="shell__title"><%=request.getAttribute("pageTitle") != null ? request.getAttribute("pageTitle") : "Hi Care"%></h1>
	<span class="shell__user"><%=session.getAttribute("uname")%></span>
</header>
