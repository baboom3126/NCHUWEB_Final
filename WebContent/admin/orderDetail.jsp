<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>

<%@ include file="layout/beforeBody.jsp" %>

<%@ include file="layout/sideNav.jsp" %>

<%
	String orderID = request.getParameter("oid");
	String firmID = (String)session.getAttribute("adminFirmID"); 
	String accountID = "";
	String status = "";
	String orderTime = "";
	String address = "";
	String accountName = "";
	String queryCode = "SELECT account_id, status, address, order_time FROM orders WHERE id = " + orderID;
	database.connectDB();
	database.query(queryCode);
	ResultSet rs = database.getRS();
	if(rs != null) {
		while(rs.next()) {
			accountID = rs.getString("account_id");
			status = rs.getString("status");
			orderTime = rs.getString("order_time");
			address = rs.getString("address");
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
		}
	}
	database.closeDB();
%>

<div class="div_main">

<div class="header_main">
  	<span style="font-size:36px; font-weight:border;">訂單資料</span>
</div>

<div class="div_main1">
	<div class="orderdetail card">
  		<div class="line1">
  			<div class="od_11">ID</div>
  			<div class="od_12"><%= orderID %></div>
  			<div class="od_11">USER</div>
  			<div class="od_12"><%= accountName %></div>
  			<div class="od_11">TIME</div>
  			<div class="od_12"><%= orderTime %></div>
		</div>

		<div class="line2">
			<div class="od_21">STATUS</div>
			<div class="od_23"><%= status %></div>
			<div class="od_21">ADDRESS</div>
			<div class="od_22"><%= address %></div>
		</div>
		<%-- <div class="line3">目錄</div> --%>
		<div class="content_table">
			<table border="1px" class="highlight">
				<tr>
  					<th class="th1" height="40px">no.</th>
  					<th class="th1">image</th>
  					<th class="th1">name</th>
  					<th class="th1">price</th>
  					<th class="th1">amount</th>
  					<th class="th1">total</th>
  					<th></th>
				</tr>
				<%
					int countNumber = 1;
					String queryCode2 = "SELECT product_id, amount FROM order_details WHERE order_id = " + orderID;
					database.connectDB2();
					database.query2(queryCode2);
					ResultSet rs2 = database.getRS2();
					if(rs2 != null) {
						while(rs2.next()) {
							String productID = rs2.getString("product_id");
							String amount = rs2.getString("amount");
							String queryCode3 = "SELECT name, image, price FROM products WHERE id = " + productID;
							String productName = "";
							String productImage = "";
							String productPrice = "";
							int totalPrice = 0;
							database.connectDB3();
							database.query3(queryCode3);
							ResultSet rs3 = database.getRS3();
							if(rs3 != null) {
								while(rs3.next()){
									productName = rs3.getString("name");
									productImage = rs3.getString("image");
									productPrice = rs3.getString("price");
									totalPrice = Integer.parseInt(productPrice) * Integer.parseInt(amount);
								}
							}
							database.closeDB3();
				%>
				<tr>
  					<th class="th1" height="40px"><%= countNumber %></th>
  					<th class="th1">
  						<img src="<%= productImage %>" width="70px" height="70px">
  					</th>
  					<th class="th1"><%= productName %></th>
  					<th class="th1"><%= productPrice %></th>
  					<th class="th1"><%= amount %></th>
  					<th class="th1"><% out.println(totalPrice); %></th>
  					<th></th>
				</tr>
				<%
						countNumber++;
						}
					}
					database.closeDB2();
				%>
			</table>
		</div>
		<div class="line5">
  			<a href="./orderIndex.jsp" class="waves-effect waves-light btn">返回</a>
		</div>
	</div>
</div>

</div>

<%@ include file="layout/afterBody.jsp" %>
