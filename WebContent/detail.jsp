<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@include file="./layout/beforeBody.jsp" %>
  <div class="row">
    <div class="col-md-2"></div>

    <div class="col-md-8 center" >


    </div>



    <div class="col-md-2"></div>

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






<hr>
<div class="row">

  <div class="col-md-2">

  </div>
<div class="col-md-8">

  <div class="card horizontal " >
    <div class="card-image">
      <img src="http://i.imgur.com/uPOvrN7.jpg" width="600px" height="600px">
    </div>
    <div class="card-stacked">
      <div class="card-content" >
          <h3>粉紅衣服 <h5>100$</h5> </h3>
          <hr>
          <p>這是一件衣服</p>
      </div>
      <div class="card-action center">
        <form class="" action="index.html" method="post">
          <span style="font-size:22px">數量</span>
          <input type="number" name="" value="" style="text-align:center; width:20%;">
            <input type="submit" name="" value="訂購" class="btn" style="text-align:center;">
        </form>
        </div>
    </div>
  </div>

</div>

  <div class="col-md-2">

  </div>
</div>

<%@include file="./layout/afterBody.jsp" %>
