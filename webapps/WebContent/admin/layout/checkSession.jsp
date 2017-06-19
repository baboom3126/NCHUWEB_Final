<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("adminName") == null){
		response.sendRedirect("./login.jsp");	
	}
	String adminName = (String)session.getAttribute("adminName");
%>