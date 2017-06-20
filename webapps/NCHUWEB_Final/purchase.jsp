<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@include file="./layout/beforeBody.jsp" %>
		<script>
      $(document).ready(function(){
        $('.tooltipped').tooltip({delay: 50});
        $('.button-collapse').sideNav({
            closeOnClick: true
          });

      });
    </script>
<%
	if(session.getAttribute("cartProduct") == null) { //若購物車為空，回到首頁
		response.sendRedirect("index.jsp");
	}

	//再跳到登入畫面前先收集訂單資料
	String orderName = request.getParameter("order_name");
	String orderAddress = request.getParameter("order_address");

	session.setAttribute("orderName", orderName);
	session.setAttribute("orderAddress", orderAddress);

	if(session.getAttribute("accountName") == null) { //判斷是否登入
		response.sendRedirect("login.jsp");
	}else{

	//開始撈資料放資料
	//orders table需要資料：account_id, total, address
	//order_details table 需要資料：order_id, product_id, firm_id, amount
	String[][] cart = (String[][])session.getAttribute("cartProduct");
	String accountID = (String)session.getAttribute("accountID");
	String address = (String)session.getAttribute("orderAddress");
	int total = 0;
	//開始迴圈
	for(int i=0; i<cart.length;i++) {
		database.connectDB();
		database.query("SELECT price FROM products WHERE id =" + cart[i][0]);
		int amount = Integer.parseInt(cart[i][1]);
		ResultSet rs = database.getRS();
		int productPrice = 0;
		if(rs != null) {
			while(rs.next()){
				productPrice = rs.getInt("price");
			}
		}
		total += productPrice * amount;
		database.closeDB();
	}
	database.connectDB();
	String sql = "INSERT INTO orders (account_id, total, address) VALUES (?,?,?)";
	PreparedStatement ps=database.getCon().prepareStatement(sql);
	ps.setString(1,accountID);
	ps.setInt(2,total);
	ps.setString(3,address);
	int a=ps.executeUpdate();

	int orderID = -1;
	database.query("SELECT LAST_INSERT_ID()");
	ResultSet rs = database.getRS();
	if (rs.next()) {
        orderID = rs.getInt(1);
    }
	out.println(orderID);
	database.closeDB();

	for(int i=0;i<cart.length;i++) {
		String productID = cart[i][0];
		String amount = cart[i][1];
		database.connectDB1();
		database.query1("SELECT firm_id FROM products WHERE id = " + productID);
		ResultSet rs1 = database.getRS1();
		int firmID = 0;
		if(rs1 != null) {
			while(rs1.next()){
				firmID = rs1.getInt("firm_id");
			}
		}
		database.closeDB1();
		database.connectDB();
		String sql1 = "INSERT INTO order_details (order_id, product_id, firm_id, amount) VALUES (?,?,?,?)";
		PreparedStatement ps1 = database.getCon().prepareStatement(sql1);
		ps1.setInt(1,orderID);
		ps1.setString(2,productID);
		ps1.setInt(3,firmID);
		ps1.setString(4,amount);
		int a1 = ps1.executeUpdate();
	}


	//結束後，清除購物車，返回首頁
	session.removeAttribute("cartProduct");
	session.removeAttribute("orderAddress");
	session.removeAttribute("orderName");

	response.sendRedirect("order.jsp");
	}
%>


<%@include file="./layout/afterBody.jsp" %>
