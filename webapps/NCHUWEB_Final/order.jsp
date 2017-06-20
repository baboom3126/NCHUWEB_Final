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


  <div class="container" >

    <div class="col s12 m7">
      <h2 class="header">訂單查詢</h2>
      <hr>
    </div>

    <div class="row">
			<div class="col-md-2 center" style="background-color:rgba(0,0,0,0.15);">
<h5>訂單序號</h5>
		</div>

		<div class="col-md-2 center" style="background-color:rgba(0,0,0,0.15);">
<h5>狀態</h5>
	</div>

	<div class="col-md-2 center" style="background-color:rgba(0,0,0,0.15);">
<h5>總金額</h5>
</div>

	<div class="col-md-4 center" style="background-color:rgba(0,0,0,0.15);">
<h5>訂購時間</h5>
</div>

<div class="col-md-2 center" style="background-color:rgba(0,0,0,0.15);">
<h5>詳細</h5>
</div>




</div>


<%

database.connectDB();
String sql = "Select * from orders where account_id = " + adminId+";";
database.query(sql);
ResultSet rs = database.getRS();
if(rs!=null)
{
	while(rs.next())
	{
		int id = rs.getInt("id");
		int status = rs.getInt("status");
		String address= rs.getString("address");
		String order_time = rs.getString("order_time");
		String total = rs.getString("total");




%>

<div class="row" style="font-size:20px;">

	<div class="col-md-2 center">
		<%=id%>
	</div>
	<div class="col-md-2 center">
		<%=status%>
	</div>
	<div class="col-md-2 center">
		<%=total%>
	</div>

	<div class="col-md-4 center">
		<%=order_time%>
	</div>
	<div class="col-md-2 center">
			<form class="" action="orderDetail.jsp" method="get">
				<input type="hidden" name="id" value="<%=id%>">
				<input type="submit"  class="btn" name="" value="詳細資訊">
			</form>
	</div>

</div>





<%
}}

database.closeDB();
%>



  </div>



    <div class="row"></div>
<br><br><br>
  </div>
	<br><br><br><br><br>

  </body>
</html>
