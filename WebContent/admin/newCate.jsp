<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>

<%@ include file="layout/beforeBody.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	if(request.getParameter("submit") != null) {
		String name = request.getParameter("name");
		database.connectDB();
		database.addProductCate(name);
		database.closeDB();
		response.sendRedirect("productIndex.jsp");
	}
	
	if(request.getParameter("modify") != null) {
		String name = request.getParameter("name");
		String pc_id = request.getParameter("id");
		database.connectDB();
		database.modProductCate(pc_id, name);
		database.closeDB();
		response.sendRedirect("productIndex.jsp");
	}
	
	if(request.getParameter("delete") != null) {
		String pc_id = request.getParameter("id");
		database.connectDB();
		database.delProductCate(pc_id);
		database.closeDB();
		response.sendRedirect("productIndex.jsp");
	}
%>

<%@ include file="layout/sideNav.jsp" %>

<%
	String pageTitle = "新增類別";
	String pageButton = "新增";
	String pageName = "";
	String pageID = "";
	String submitName = "submit";
	if(request.getParameter("mode") != null) {
		pageTitle = "修改類別";
		pageButton = "修改";
		submitName = "modify";
		pageID = request.getParameter("id");
		database.connectDB();
		database.query("SELECT name FROM product_cates WHERE id = " + pageID);
		ResultSet rs = database.getRS();
		if(rs != null) {
			while(rs.next()) {
				pageName = rs.getString("name");
			}
		}
	}
%>

<div class="div_main">

<div class="header_main">
  <span style="font-size:36px; font-weight:border;"><%= pageTitle %></span>
</div>

<div class="div_main1">
	<div class="orderdetail card">
		<div class="line4"></div>

		<div class="div_form1">
			<form action="newCate.jsp" method="post">
    			名稱<input type="text" name="name" placeholder="類別名稱" value="<%= pageName %>">
				<input type="hidden" name="id" value="<%= pageID %>">
				<button type="submit" name="<%= submitName %>" class="btn"><%= pageButton %></button>
		<%
			if(request.getParameter("mode") != null) {
		%>
				<button type="submit" name="delete" class="btn">刪除</button>
		<%
			}
		%>
				<button type="submit" name="button" class="btn" onclick="history.back(-1)">返回</button>
			</form>
		</div>
		<div class="line4"></div>
	</div>
</div>

</div>

<%@ include file="layout/afterBody.jsp" %>
