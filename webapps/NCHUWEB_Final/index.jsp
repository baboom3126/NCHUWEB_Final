<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@include file="./layout/beforeBody.jsp" %>

    <script type="text/javascript">
      $(document).ready(function(){
        $('.tooltipped').tooltip({delay: 50});
        $('.button-collapse').sideNav({
          closeOnClick: true
        });
      });
    </script>



  <div class="row">
    <div class="col-md-2"></div>

    <div class="col-md-8 center" >


    </div>



    <div class="col-md-2"></div>

  </div>

<div class="row">
  <div class="col-md-5">

  </div>
  <div class="col-md-2">
    <form class="" name="search_form" id="search_form" action="search.jsp" method="post">
    <input type="text" id="search" name="search" value="" style="100px;" placeholder="搜尋">
      </form>
  </div>
  <div class="col-md-1">
    <a href="#" onclick="document.getElementById('search_form').submit();" class="brand-logo" style="display:inline-block;"><i class="material-icons">search</i></a>

  </div>
</div>



  <div class="row">

    <div class="col-md-2"></div>

<div class="col-md-8" >

<a href="?cat=0" class="a1">全部商品</a><%
int count=1;
	String queryCode = "SELECT * FROM  `product_cates`";
	database.connectDB();
	database.query(queryCode);
	ResultSet rs = database.getRS();
	if(rs != null) {
		while(rs.next()){
      count++;
			String id = rs.getString("id");
			String name = rs.getString("name");
%><a href="?cat=<%=id%>" class="a1"><%=name%></a><%
		}
	}
%>
<style media="screen">
  .a1{
    width: calc(100%/<%=count%>)!important;
  }
</style>



</div>
    <div class="col-md-2"></div>
</div>


<%
if(request.getParameter("cat") != null){
	int cat =Integer.parseInt(request.getParameter("cat"));
	if (cat==0){queryCode = "SELECT  * from products";}
	else{queryCode = "SELECT  * from products where cate_id="+cat;}

	database.connectDB();
	database.query(queryCode);
	rs = database.getRS();
	if(rs != null) {
		int size;
		rs.last();
		size = rs.getRow();
		rs.beforeFirst();
		int i=1;
		while(rs.next()){
			if (i%4==1){
				%><div class="row">
				  <div class="col-md-2">
				  </div>
				<%
			}
			String id = rs.getString("id");
			String name = rs.getString("name");
			String price = rs.getString("price");
			String image = rs.getString("image");
			String description = rs.getString("description");
		%>
		<div class="col-sm-6 col-md-2 card ">
		<div class="thumbnail" style="margin-top:20px; height:475px;">
		  <img src="<%=image%>" alt="..." height="150px" width="150px">
		  <div class="caption">
			<h3 class="center"><%=name%></h3>
			<p>price:<%=price%></p>
			<p><%=description%></p>
			<p class="center"style="position:absolute;bottom:30px;left:30%;"><a href="./detail.jsp?id=<%=id%>" class="btn" role="button"style="background-color:#176D81; ">詳細資訊</a> </p>

		  </div>
		</div>
		</div>
		<%
			if (i%4==0 ||i==size){
		%><div class="col-md-2">
			</div>
		</div>
		<%
			}%>
		<%
			i++;
		}
	}database.closeDB();
}
%>



<hr>

<div class="row">

  <div class="col-md-2">
</div>

<div class="col-md-8 col-xs-12">

  <div class="card" style="background-color:#233142; color:white;">
    <div class="card-content">
      <p style="font-size:32px;"><i class="material-icons">thumb_up</i> 推薦商品區</p>
    </div>
    <div class="card-tabs">
      <ul class="tabs tabs-fixed-width">
        <li class="tab"><a class="active" href="#test4" style="font-size:22px">熱門商品</a></li>
        <li class="tab"><a href="#test5" style="font-size:22px">最新商品</a></li>
      </ul>
    </div>
    <div class="card-content grey lighten-4">
      <div id="test4">
		<%
		queryCode = "SELECT  `p`.* ,SUM(`od`.`amount`) FROM  `order_details` as `od`INNER JOIN `products` as `p` ON `od`.`product_id`=`p`.`id` GROUP BY  `od`.`product_id` ORDER BY SUM(`od`.`amount`) DESC LIMIT 0 , 6";
		database.connectDB();
		database.query(queryCode);
		rs = database.getRS();
		if(rs != null) {
			int size;
			rs.last();
			size = rs.getRow();
			rs.beforeFirst();
			int i=1;
			while(rs.next()){
				if (i%2==1){
					%><div class="row"><%
				}
				String id = rs.getString("id");
				String name = rs.getString("name");
				String price = rs.getString("price");
				String image = rs.getString("image");
				String description = rs.getString("description");
			%>
			<div class="col-md-6">
				<div class="thumbnail" style="margin-top:20px; height:400px;">
				  <a href="./detail.jsp?id=<%=id%>">
				  	<img src="<%=image%>" alt="..." height="150px" width="150px">
				  </a>
				  <div class="caption">
					<h3 class="center"><%=name%></h3>
					<p><%=description%></p>

					<p class="center" style="position:absolute;bottom:30px;left:40%;"><a href="./detail.jsp?id=<%=id%>" class="btn " role="button"style="background-color:#176D81; ">詳細資料</a> </p>

				  </div>
				</div>
			</div>
			<%
				if (i%2==0 ||i==size){
			%></div><%
				}%>
			<%
				i++;
			}
		}database.closeDB();
		%>

      </div>


      <div id="test5">
		<%
		queryCode = "SELECT * FROM products ORDER BY  created_at DESC LIMIT 0 , 6";
		database.connectDB();
		database.query(queryCode);
		rs = database.getRS();
		if(rs != null) {
			int size;
			rs.last();
			size = rs.getRow();
			rs.beforeFirst();
			int i=1;
			while(rs.next()){
				if (i%2==1){
					%><div class="row"><%
				}
				String id = rs.getString("id");
				String name = rs.getString("name");
				String price = rs.getString("price");
				String image = rs.getString("image");
				String description = rs.getString("description");
			%>
			<div class="col-md-6">
				<div class="thumbnail" style="margin-top:20px; height:400px;">
				  <a href="./detail.jsp?id=<%=id%>">
				  	<img src="<%=image%>" alt="..." height="150px" width="150px">
				  </a>
				  <div class="caption">
					<h3 class="center"><%=name%></h3>
					<p><%=description%></p>
					<p class="center"><a href="./detail.jsp?id=<%=id%>" class="btn " role="button"style="background-color:#176D81; ">詳細資料</a> </p>
				  </div>
				</div>
			</div>
			<%
				if (i%2==0 ||i==size){
			%></div><%
				}%>
			<%
				i++;
			}
		}database.closeDB();
		%>

      </div>
    </div>
  </div>
</div>

<div class="col-md-2">
</div>
</div>

<%@include file="./layout/afterBody.jsp" %>
