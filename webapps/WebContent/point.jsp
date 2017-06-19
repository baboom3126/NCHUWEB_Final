<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="./layout/beforeBody.jsp" %>
<%@include file="./layout/sidenav.jsp" %>

<%
	if(session.getAttribute("accountName") == null){
		response.sendRedirect("./login.jsp");	
	}
	String adminName = (String)session.getAttribute("accountName");
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
      <h2 class="header">積分查詢</h2>
      <hr>
    </div>

    <div class="row">

    <table class="flat-table">
      <tbody>
        <tr>
          <th class="my-th">ID</th>
          <th class="my-th">Point amount</th>
          <th class="my-th">Reason</th>
          <th class="my-th">Time</th>
        </tr>
        <tr>
          <td class="my-td">1</td>
          <td class="my-td">Example 2</td>
          <td class="my-td">Example 3</td>
          <td class="my-td">Example 4</td>

        </tr>

      </tbody>
    	</table>



    </div>


  </div>



    <div class="row"></div>

  </div>

  </body>
</html>
