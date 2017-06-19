<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
    
<%@ include file="layout/beforeBodyLogin.jsp" %>

<%
	if(session.getAttribute("adminName") != null) {
		response.sendRedirect("./index.jsp");
	}
%>

<div class="div_form1">
	<h1 style="text-align:center;">管理者登入</h1>

	<form style="text-align:center;" method="post" action="login.jsp">
		帳號<input type="text" name="email">
		密碼<input type="password" name="password">
		
		<%
			if(request.getParameter("submit") != null) {
				String email = request.getParameter("email");
				String password = request.getParameter("password");
				String failMessage = "<p style='color:red'>Wrong Name or Password</p>";
				database.connectDB();
				database.query("SELECT id, name, password, firm_id FROM accounts WHERE email = '" + email + "'");
				ResultSet rs = database.getRS();
				if(rs != null) {
					while(rs.next()){
						String dbPassword = rs.getString("password");
						String id = rs.getString("id");
						String firmID = rs.getString("firm_id");
						String name = rs.getString("name");
						if(dbPassword.equals(password)&& !firmID.equals("0")) {
							session.setAttribute("adminName", name);
							session.setAttribute("adminEmail", email);
							session.setAttribute("adminID", id);
							session.setAttribute("adminFirmID", firmID);
							response.sendRedirect("./index.jsp");
						}
					}
				}
				out.println(failMessage);
				database.closeDB();
			}
		%>
		
		<input type="submit" name="submit" value="登入">
	</form>
</div>

<%@ include file="layout/afterBody.jsp" %>
