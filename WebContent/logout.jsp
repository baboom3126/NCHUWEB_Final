<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("accountName") != null) {
		session.removeAttribute("accountName");
		session.removeAttribute("accountID");
		session.removeAttribute("accountEmail");
	}

	response.sendRedirect("index.jsp");
%>
