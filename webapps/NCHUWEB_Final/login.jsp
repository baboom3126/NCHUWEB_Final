<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*,java.text.*"%>
<%@ page import="java.util.List,java.util.Iterator,java.util.Date,java.io.File" %>
<%@include file="./layout/beforeBody.jsp" %>

<%
	if(session.getAttribute("accountName") != null) {
		response.sendRedirect("./index.jsp");
	}

	String validateStatus = "";
	String validationCode = "";

	if(request.getParameter("mode") != null) {
		validationCode = request.getParameter("code");
		database.connectDB();
		try{
			String sql = "UPDATE accounts SET status = 1 WHERE validation_code = ?";
			PreparedStatement ps=database.getCon().prepareStatement(sql);
			ps.setString(1,validationCode);
			ps.executeUpdate();

			validateStatus = "認證成功";
		} catch (Exception ex) {
			out.println(ex);
		}

		database.closeDB();
	}
%>



<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>登入</title>

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


    <div class="container">
			<div class="col s12 m12 l12">
    		<span style="color:green;font-size:20pt;"><%= validateStatus %></span>

			</div>
    <div class="col s12 m7">
      <h2 class="header">LOGIN</h2>
      <hr>
      <div class="card horizontal row">
        <div class="card-image row" style="width:40%; ">
          <img src="./admin/images/logo.png" width="330px" height="330px">
        </div>
        <div class="card-stacked row" style="width:50%;">
          <div class="card-content">
            <p></p>
          </div>
          <form class="form1" action="login.jsp" method="post">
          <div class="card-content" style="text-align:left;">
<div class="container">
              <label for="id" id="label1">帳號(E-mail)</label>
              <input type="text" name="id" id="id1" placeholder="" >
              <label for="pwd" id="label2">密碼</label>
              <input type="password" name="pwd" id="pwd1" placeholder="">
          </div></div>
          <div class="card-action center">

          <%
          if(request.getParameter("login") != null) {
      		String email = request.getParameter("id");
      		String password = request.getParameter("pwd");
				String failMessage = "<p style='color:red;font-size:18pt;' class='center'>帳號密碼錯誤或尚未認證</p>";
				database.connectDB();
				database.query("SELECT id, name, password FROM accounts WHERE email = '" + email + "' AND status = 1");
				ResultSet rs = database.getRS();
				if(rs != null) {
					while(rs.next()){
						String dbPassword = rs.getString("password");
						String id = rs.getString("id");
						String name = rs.getString("name");
						if(dbPassword.equals(password)) {
							session.setAttribute("accountName", name);
							session.setAttribute("accountEmail", email);
							session.setAttribute("accountID", id);
							response.sendRedirect("./index.jsp");
						}
					}
				}
				out.println(failMessage);
				database.closeDB();
			}
		%>

<button type="submit" name="login" class="waves-effect waves-light btn" style="background-color:#176D81;">登入</button>
<button type="button" class="btn" name="button2" onclick="location.href='register.jsp'" style="background-color:#176D81;">註冊</button>
          </div>
        </form>

        </div>
      </div>
    </div>
  </div>

  </body>
  <script type="text/javascript">

  $(document).ready(function(){
    $("form").submit(function(e){
      var x=0;
      if($('#id1').val().length==0){
        $('#label1').css("color","red");
        $('#id1').attr("placeholder","請輸入帳號");
        x=1;
    }else{      $('#label1').css("color","black");}
    if($('#pwd1').val().length==0){
      $('#label2').css("color","red");
      $('#pwd1').attr("placeholder","請輸入名字");
      x=1;
  }else{    $('#label2').css("color","black");}

  if(x==1){
    return false;
  }
    });
  });

</script>

</html>
