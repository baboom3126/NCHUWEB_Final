<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>

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
    <script type="text/javascript">
      $(document).ready(function(){
        $('.tooltipped').tooltip({delay: 50});
        $('.button-collapse').sideNav({
            closeOnClick: true
          });

      });
    </script>


		<script type="text/javascript">
			 $(document).ready(function() {

				 $('#member_info').hide();
				 $('#point_info').hide();

				 $('#btn1').click(function(){
					 $('#member_info').fadeToggle(500);

				 })


				 $('#btn2').click(function(){
					 $('#point_info').fadeToggle(500);

				 })

			 })
		</script>
  </head>
  <body>


    <div class="container">

<div class="row">


    <div class="col s12 m7">
      <h2 class="header">個人資訊</h2>
      <hr>
    </div>
  </div>

	<button type="button" class="a1" name="button" id="btn1">修改資料</button>
	<button type="button" class="a1" name="button" id="btn2">查詢積分</button>
	<button type="button" class="a1" name="button" id="btn3" onclick="location.href='./order.jsp'">查詢訂單</button>

<%
String name="";
String birthday="";
String father_id="";
int point=0;


database.connectDB();
String sql = "select * from accounts where name = '" + adminName + "';";
database.query(sql);
ResultSet rs = database.getRS();

if(rs!=null){
	while(rs.next())
	{
		name = rs.getString("name");
		birthday = rs.getString("birthday");
		father_id = rs.getString("father_id");
		point = rs.getInt("points");

	}
}


database.closeDB();
%>


<div class="memeber_info" id="member_info">
    <div class="row">
			<br><br><br>
      <form class="col s12">
        <div class="row">
          <div class="input-field col s12 m6 l6">
            <i class="material-icons prefix">account_circle</i>
            <input id="icon_account" type="text" class="validate" value="<%=name%>">
            <label for="icon_account">姓名</label>
          </div>
          <div class="input-field col s12 m6 l6">
            <i class="material-icons prefix">vpn_key</i>
            <input id="icon_passwd" type="text" class="validate">
            <label for="icon_passwd">密碼</label>
          </div>
        </div>


        <div class="row">
          <div class="input-field col s12 m6 l6">
            <i class="material-icons prefix">today</i>
            <input id="icon_birthday" type="date" class="validate" style="text-align:center;" value="<%=birthday%>">
            <label for="icon_birthday">生日</label>
          </div>
          <div class="input-field col s12 m6 l6">
            <i class="material-icons prefix">comment</i>
            <input id="icon_memo" type="tel" class="validate">
            <label for="icon_memo">備註</label>
          </div>
        </div>
				<input type="submit" name="" class="btn waves-effect waves-light right" value="送出">
      </form>
    </div>


	</div>



	<div class="point_info" id="point_info">
		<hr><br><br>
		<div class="row">
			<div class="col-md-6">
				<h5>有效積分 : </h5>
				<input type="text" name="" value="<%=point%>" disabled >

			</div>


			<div class="col-md-6">
				<h5>推薦人 : </h5>
				<input type="text" name="" value="<%=father_id%>" disabled >
			</div>

		</div>
	</div>





    <div class="row"></div>

  </div>

	<br>

<br><br><br><br><br><br><br><br>

  </body>
</html>
