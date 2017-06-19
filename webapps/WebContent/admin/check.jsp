<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@include file="layout/accessDB.jsp" %>
<%
	String email=request.getParameter("email");
	database.connectDB();
	String sql = "select * from accounts where email=?;";
	PreparedStatement pstmt=database.getCon().prepareStatement(sql);
	pstmt.setString(1,request.getParameter("email"));
	ResultSet rs=pstmt.executeQuery();
	if (rs.next()){
		out.print("This account has been registered");
	}else{
		out.print("OK!");
	}
%>