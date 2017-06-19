<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="layout/beforeBody.jsp" %>

<%@ include file="layout/sideNav.jsp" %>

<%
	if(request.getParameter("logout") != null) {
		session.invalidate();
	}
%>

<h1 style="text-align:center;">歡迎回來，<%= adminName %></h1><br>
<form action="index.jsp" method="post" style="text-align:center">
	<button type="submit" name="logout" class="btn" style="text-align:center">登出</button>
</form>

<%@ include file="layout/afterBody.jsp" %>
