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
  					<th class="th11" height="70px" width="300px">ID</th>
  					<th class="th11" width="300px">名稱</th>
  					<th class="th11" width="300px">價格</th>
  					<th class="th11" width="300px">功能</th>
  					<th></th>
				</tr>
				
				<%
					String cateId = request.getParameter("id");
					String queryCode="";
					if (adminFirmID.equals("1")){
						queryCode = "SELECT id, name, price FROM products WHERE cate_id = " + cateId;
					}else{
						queryCode = "SELECT id, name, price FROM products WHERE cate_id = " + cateId+" and firm_id =" + adminFirmID;
					}
					database.connectDB();
					database.query(queryCode);
					ResultSet rs = database.getRS();
					if(rs != null) {
						while(rs.next()) {
							String id = rs.getString("id");
							String name = rs.getString("name");
							String price = rs.getString("price");
				%>
				
				<tr>
  					<th class="th11" height="70px"><%= id %></th>
  					<th class="th11"><%= name %></th>
  					<th class="th11"><%= price %></th>
  					<th class="th11">
  						<a href="./productDetail.jsp?id=<%= id %>" class="btn">查看</a>
  						<a href="./newProduct.jsp?mode=mod&cateid=<%= cateId %>&proid=<%= id %>" class="btn">修改</a>
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
  			<a href="./newProduct.jsp?id=<%= cateId %>" class="btn">新增商品</a>
  			<a href="./productIndex.jsp" class="btn">返回</a>
		</div>

		<div class="line4"></div>
		<div class="line4"></div>
	</div>
</div>

</div>

<%@ include file="layout/afterBody.jsp" %>
