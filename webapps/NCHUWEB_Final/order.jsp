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


  <div class="container" style="margin-left:20%">

    <div class="col s12 m7">
      <h2 class="header">訂單查詢</h2>
      <hr>
    </div>

    <div class="row">
			<div class="col-md-2 center" style="background-color:rgba(0,0,0,0.15)">
<h5>id</h5>
		</div>

		<div class="col-md-2 center" style="background-color:rgba(0,0,0,0.15)">
<h5>狀態</h5>
	</div>

	<div class="col-md-4 center" style="background-color:rgba(0,0,0,0.15)">
<h5>地址</h5>
</div>

<div class="col-md-4 center" style="background-color:rgba(0,0,0,0.15)">
<h5>訂購時間</h5>
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
		int id = rs.getInt("account_id");
		int status = rs.getInt("status");
		String address= rs.getString("address");
		String order_time = rs.getString("order_time");




%>

<div class="row">

	<div class="col-md-2 center">
		<h5><%=id%></h5>
	</div>
	<div class="col-md-2 center">
		<h5><%=status%></h5>
	</div>
	<div class="col-md-4 center">
		<h5><%=address%></h5>
	</div>
	<div class="col-md-4 center">
		<h5><%=order_time%></h5>
	</div>

</div>





<%
}}

database.closeDB();
%>



  </div>



    <div class="row"></div>

  </div>
	<br><br><br><br><br>

  </body>
</html>
