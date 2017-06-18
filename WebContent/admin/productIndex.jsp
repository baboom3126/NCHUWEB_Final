<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>

<%@ include file="layout/beforeBody.jsp" %>

<%@ include file="layout/sideNav.jsp" %>

<div class="div_main">

<div class="header_main">
  	<span style="font-size:36px; font-weight:border;">商品管理主頁</span>
</div>

<div class="div_main1">
	<div class="orderdetail card">
		<div class="line4">
		</div>
		
		<div class="content_table1">
			<table border="1px" class="striped" style="border-style:dashed;">
				<tr>
  					<th class="th11" height="70px" width="100px">ID</th>
  					<th class="th11" width="auto">名稱</th>
  					<th class="th11" width="300px" >功能</th>
  					<th></th>
				</tr>
				
				<%
					String queryCode = "SELECT id, name FROM product_cates";
					database.connectDB();
					database.query(queryCode);
					ResultSet rs = database.getRS();
					if(rs != null) {
						while(rs.next()) {
							String name = rs.getString("name");
							String id = rs.getString("id");
				%>
				
				<tr>
  					<th class="th1" height="60px"><%= id %></th>
  					<th class="th1"><%= name %></th>
  					<th class="th1">
  						<a href="./productCate.jsp?id=<%= id %>" class="btn">查看</a>
  						<a href="./newCate.jsp?mode=mod&id=<%= id %>" class="btn">修改</a>
  					</th>
  					<th></th>
				</tr>
				
				<%
						}
					}
					database.closeDB();
				%>
				

			</table>
		</div>

		<div class="line4">
  			<a href="./newCate.jsp" class="btn">新增類別</a>
		</div>

		<div class="line4"></div>
		<div class="line4"></div>
	</div>
</div>

</div>

<%@ include file="layout/afterBody.jsp" %>
