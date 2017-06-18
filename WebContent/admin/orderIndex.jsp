<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>

<%@ include file="layout/beforeBody.jsp" %>

<%@ include file="layout/sideNav.jsp" %>

<div class="div_main">

<div class="header_main">
	<span style="font-size:36px; font-weight:border;">訂單管理主頁</span>
</div>
<div class="div_main1">
	<div class="orderdetail card">
		<div class="line4"></div>

		<div class="content_table">
  			<table border="1px" class="striped" style="border-style:dashed;">
  				<tr>
    				<th class="th11" height="70px">ID</th>
    				<th class="th11">訂購人</th>
    				<th class="th11">時間</th>
    				<th class="th11">狀態</th>
    				<th class="th11">詳細內容</th>
    				<th></th>
  				</tr>
  				<%
  					String firmID = (String)session.getAttribute("adminFirmID");
  					//SELECT DISTINCT might include logic error!
  					String queryCode = "SELECT DISTINCT o.id, o.account_id, o.status, o.order_time FROM  orders AS o, order_details AS od WHERE od.firm_id = " + firmID;
  					database.connectDB();
  					database.query(queryCode);
  					ResultSet rs = database.getRS();
  					if(rs != null) {
  						while(rs.next()) {
  							String orderID = rs.getString("o.id");
  							String accountID = rs.getString("o.account_id");
  							String accountName = "";
  							String status = rs.getString("o.status");
  							String orderTime = rs.getString("o.order_time");
  							String queryCode1 = "SELECT name FROM accounts WHERE id = " + accountID;
  							database.connectDB1();
  							database.query1(queryCode1);
  							ResultSet rs1 = database.getRS1();
  							if(rs1 != null) {
  								while(rs1.next()) {
  									accountName = rs1.getString("name");
  								}
  							}
  							database.closeDB1();
  				%>
  				<tr>
    				<th class="th1" height="60px"><%= orderID %></th>
    				<th class="th1"><%= accountName %></th>
    				<th class="th1"><%= orderTime %></th>
    				<th class="th1"><%= status %></th>
    				<th class="th1">
    					<a href="./orderDetail.jsp?oid=<%= orderID %>" class="waves-effect waves-light btn">查看</a>
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
	</div>
</div>

</div>

<%@ include file="layout/afterBody.jsp" %>
