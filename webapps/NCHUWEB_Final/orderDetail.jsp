<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>

<%@include file="./layout/beforeBody.jsp" %>
<%@include file="./layout/sidenav.jsp" %>

<%
	if(session.getAttribute("accountName") == null){
		response.sendRedirect("./login.jsp");
	}
	String adminName = (String)session.getAttribute("accountName");
	String adminId = (String)session.getAttribute("accountID");
%>
<%
  String orderID = request.getParameter("id");
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
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
<style media="screen">
.flat-table {
  display: block;
  font-family: sans-serif;
  -webkit-font-smoothing: antialiased;
  font-size: 115%;
  overflow: auto;
  width: auto;

	}
  .my-td{
    background-color: rgb(238, 238, 238);
    color: rgb(111, 111, 111);
    padding: 20px 30px;
  }
  .my-th{
    background-color: rgb(112, 196, 105);
    color: white;
    font-weight: normal;
    padding: 20px 30px;
    text-align: center;
  }

</style>
    <script type="text/javascript">
      $(document).ready(function(){
        $('.tooltipped').tooltip({delay: 50});
        $('.button-collapse').sideNav({
            closeOnClick: true
          });

      });
    </script>
  </head>

  <body>



  <div class="container" style="margin-left:20%">

    <div class="col s12 m7">
      <h2 class="header">訂單查詢</h2>
      <hr>
    </div>

    <div class="card">
      <div class="line4"><br>
        <div class="row">

<div class="col-md-1">
</div>
        <div class="col-md-2" style="background-color:rgba(0,0,0,0.15);">
          <h5 >訂單編號</h5>
        </div>
        <div class="col-md-3" style="background-color:rgba(0,0,0,0.05);">
          <h5><%=orderID%></h5>
        </div>
        <div class="col-md-2" style="background-color:rgba(0,0,0,0.15);">
          <h5>  狀態  </h5>
        </div>
        <div class="col-md-3" style="background-color:rgba(0,0,0,0.05);">
          <h5> <%=status%> </h5>
        </div>
        <div class="col-md-1">
        </div>

        </div>


        <div class="row">
          <div class="col-md-1">
          </div>
          <div class="col-md-2" style="background-color:rgba(0,0,0,0.15);">
            <h5>訂購人id</h5>
          </div>
          <div class="col-md-3" style="background-color:rgba(0,0,0,0.05);">
            <h5><%=accountName%></h5>
          </div>
          <div class="col-md-2" style="background-color:rgba(0,0,0,0.15);">
            <h5>時間</h5>
          </div>
          <div class="col-md-3" style="background-color:rgba(0,0,0,0.05);">
            <h5><%=orderTime%></h5>
          </div>
          <div class="col-md-1">
          </div>
        </div>

        <div class="row">
          <div class="col-md-1">
          </div>
          <div class="col-md-2" style="background-color:rgba(0,0,0,0.15);">
            <h5>地址</h5>
          </div>

          <div class="col-md-8" style="background-color:rgba(0,0,0,0.05);">
            <h5><%=address%></h5>
          </div>
          <div class="col-md-1">
          </div>
        </div>

<div class="row">
        <div class="col-md-12">
          <br><hr><br>
        </div></div>


        <div class="row">
<div class="col-md-1">

</div>
<div class="col-md-10">

          <table  class="highlight">
            <tr>
            		<th class="th11" height="70px" >項目</th>
            		<th class="th11">圖片</th>
                <th class="th11">名稱</th>
            		<th class="th11">單價</th>
            		<th class="th11">數量</th>
            		<th class="th11">小計</th>
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
                <th class="th11" height="70px" ><%=countNumber%></th>
                <th class="th11"><img src="<%= productImage %>" width="100px" height="100px"></th>
                <th class="th11"><%=productName%></th>
                <th class="th11"><%=amount%></th>
                <th class="th11"><%=productPrice%></th>
                <th class="th11"><%=totalPrice%></th>
            </tr>

            <%
    						countNumber++;
    						}
    					}
    					database.closeDB2();
    				%>


          </table>
        </div>
<div class="col-md-1">

</div>
        </div>


      </div>


      <div class="center">
        <a href="./order.jsp" class="btn">返回</a>
        <br><br>
      </div>
    </div>


<br><br><br><br>

  </body>
</html>
