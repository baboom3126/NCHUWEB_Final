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

<%
int count=0;

request.setCharacterEncoding("UTF-8");
String search=request.getParameter("search");


database.connectDB();
String sql="Select * from products where name like '%" + search + "%';";
database.query(sql);

ResultSet rs = database.getRS();



if(rs!=null){
  while(rs.next())
  {
    String name=rs.getString("name");
    String image=rs.getString("image");
    String description=rs.getString("description");
    int price=rs.getInt("price");
    int id=rs.getInt("id");
    count++;

    if(count%2==1)
    {
      out.print("<div class='row'><div class='col-md-3'></div>");
    }



%>




  		<div class="col-sm-6 col-md-3 card ">
  		<div class="thumbnail" style="margin-top:20px; height:475px;">
  		  <img src="<%=image%>" alt="..." height="150px" width="150px">
  		  <div class="caption">
  			<h3 class="center"><%=name%></h3>
  			<p>price:<%=price%></p>
  			<p><%=description%></p>
  			<p class="center"style="position:absolute;bottom:30px;left:30%;"><a href="./detail.jsp?id=<%=id%>" class="btn" role="button"style="background-color:#176D81; ">Button</a> </p>

  		  </div>
  		</div>
  		</div>




<%
if(count%2==0)
{
  out.print("<div class='col-md-3'></div></div>");
}


}
}


database.closeDB();
%>


<hr>

<div class="row">

  <div class="col-md-2">
</div>



<div class="col-md-2">
</div>
</div>

<%@include file="./layout/afterBody.jsp" %>
