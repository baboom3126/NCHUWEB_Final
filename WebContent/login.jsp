<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="./layout/beforeBody.jsp" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>登入</title>
  </head>
  <body>


    <div class="container">
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

              <label for="id" id="label1">帳號</label>
              <input type="text" name="id" id="id1" placeholder="" >
              <label for="pwd" id="label2">密碼</label>
              <input type="password" name="pwd" id="pwd1" placeholder="">
          </div></div>
          <div class="card-action center">
<button type="submit" name="button0" class="waves-effect waves-light btn" style="background-color:#176D81;">登入</button>
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
