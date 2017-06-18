<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>

<%@ include file="layout/beforeBody.jsp" %>

<%@ include file="layout/sideNav.jsp" %>

<%
	String id = "";
	id = request.getParameter("id");
	String productName = "";
	String productImage = "";
	String productDescription = "";
	String productPrice = "";
	String productCreate = "";
	String cateID = "";
	database.connectDB();
	String sql = "SELECT * FROM products WHERE id = " + id;
	database.query(sql);
	ResultSet rs = database.getRS();
	if(rs != null) {
		while(rs.next()) {
			productName = rs.getString("name");
			productImage = rs.getString("image");
			productDescription = rs.getString("description");
			productPrice = rs.getString("price");
			productCreate = rs.getString("created_at");
			cateID = rs.getString("cate_id");
		}
	}
	sql = "SELECT amount FROM order_details WHERE product_id = " + id;
	database.connectDB1();
	database.query1(sql);
	ResultSet rs1 = database.getRS1();
	//String productSold = "";
	int productSold = 0;
	if(rs1 != null) {
		while(rs1.next()){
			//productSold = rs1.getString("amount");
			productSold += Integer.parseInt(rs1.getString("amount"));
		}
	}
	database.closeDB1();
	database.closeDB();
%>

<div class="div_main">

<div class="header_main">
  	<span style="font-size:36px; font-weight:border;">商品資料</span>
</div>

<div class="div_main1">
	<div class="orderdetail card">
		<div class="div_img">
			<img src="<%= productImage %>" width="350px"alt="">
		</div>
		<div class="div_img1">
  			<div class="div_img11">編號</div>
  			<div class="div_img12"><%= id %></div>
			<br>
			<div class="div_img11">名稱</div>
  			<div class="div_img12"><%= productName %></div>
			<br>
			<div class="div_img11">價格</div>
    		<div class="div_img12"><%= productPrice %></div>
    		<br>
    		<div class="div_img11">已賣數量</div>
    		<div class="div_img12"><%= productSold %></div>
    		<br>
    		<div class="div_img11">建立時間</div>
    		<div class="div_img12"><%= productCreate %></div>
		</div>

		<div class="line4"></div>
		<div class="line4"></div>

		<div class="line5">
  			<div class="div_img51">
				<%= productDescription %>
  			</div>
		</div>



		<div class="line5">
  			<a href="./productCate.jsp?id=<%= cateID %>" class="waves-effect waves-light btn">返回</a>
		</div>
	</div>
</div>

</div>

<%@ include file="layout/afterBody.jsp" %>
