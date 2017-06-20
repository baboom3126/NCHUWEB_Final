<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@include file="./layout/beforeBody.jsp" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
		<script>
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
     <div class="col s12 m7">
       <h2 class="header">註冊</h2>
       <hr>
       <div class="card horizontal">
         <%-- <div class="row " style="width:40%;">
           <img src="./admin/images/logo.png" style="width:100%; ">
         </div> --%>
         <div class="row" style="width:100%;">

           <form class="form1" action="new_register.jsp" method="post" id="form1">
           <div class="card-content" style="text-align:left;">
 <div class="container">
         <div class="col s12 m12 l12">
               <label for="name1" id="label1">姓名</label>
               <input type="text" name="name1" value="" id="name1">
        </div>

          <div class="col s12 m12 l12">
               <label for="id" id="label2">帳號(email)</label><button type="button" name="button" class="btn" onclick="validation()" style="float:right; background-color:#176D81;">驗證</button><br>
               <input type="email" name="email" placeholder="" id="account1" style="width:80%;">


          </div>

          <div class="col s12 m12 l12">

               <label for="password" id="label3">密碼</label>

               <input type="password" name="pwd" placeholder="" id="password">
           </div>
 <div class="col s12 m6">
   <label for="date1" id="label4">生日</label>

   <input type="date" name="date1" id="date1" class="datepicker">

 </div>
 <div class="col s12 m6">


               <label for="father_id">推薦人email(如無不用填寫)</label>
<%
String suggestEmail = "";
String suggestID = "";
if(session.getAttribute("suggestID")!=null){
	suggestID = (String)session.getAttribute("suggestID");
	database.connectDB();
    database.query("SELECT email FROM accounts WHERE id = " + suggestID);
    ResultSet rs = database.getRS();
    if(rs != null) {
    	while(rs.next()){
    		suggestEmail = rs.getString("email");
    	}
    }
}

%>
               <input type="email" name="fatherEmail" value="<%= suggestEmail %>" id="father_id">
               <input type="hidden" name="fatherID" value="<%=suggestID %>">
</div>

           </div>
           <div class="center col-md-12" >
 <button type="submit" name="button0" class="waves-effect waves-light btn" style="background-color:#176D81;">送出</button>
 <button type="reset" class="btn" name="button2" style="background-color:#176D81;">重設</button>

 </div>
           </div>

         </form>

         </div>
       </div>
     </div>
   </div>

<br><br><br><br><br><br><br><br><br>

  </body>
  <script type="text/javascript">
  function validation(){

      var url = "validation.jsp"; // the script where you handle the form input.

        $('#label2').html(
          '<div class="preloader-wrapper small active">'+
            '<div class="spinner-layer spinner-green-only">'+
              '<div class="circle-clipper left">'+
                '<div class="circle"></div>'+
              '</div><div class="gap-patch">'+
                '<div class="circle"></div>'+
              '</div><div class="circle-clipper right">'+
                '<div class="circle"></div>'+
              '</div>'+
            '</div>'+
          '</div>'
        );
      $.ajax({
             type: "POST",
             url: url,
             data: $("#account1").serialize(), // serializes the form's elements.


             success: function(data)
             {
               $('#label2').html(data.trim());
               if(data.trim()=="帳號OK"){
                 $('#label2').css("color","blue");
               }
               if(data.trim()=="已有重複的帳號"){
                 $('#label2').css("color","red");

               }
               if(data.trim()=="不得輸入空白"){
                 $('#label2').css("color","red");

               }
             }
           });

  }
  </script>

  <script type="text/javascript">

$(document).ready(function(){
$("form").submit(function(e){
  var x=0;
  if($('#account1').val().length==0){
    $('#label2').css("color","red");
    $('#account1').attr("placeholder","請輸入帳號");
    x=1;
}else{      $('#label2').css("color","blue");}
////////////////////////////////
if($('#name1').val().length==0){
  $('#label1').css("color","red");
  $('#name1').attr("placeholder","請輸入名字");
  x=1;
}else{    $('#label1').css("color","blue");}
///////////////////////
if($('#password').val().length<6){
  $('#label3').css("color","red");
  $('#password').attr("placeholder","請輸入密碼");
  $('#label3').html("密碼不得少於6字");
  x=1;
}else{  $('#label3').css("color","blue");
        $('#label3').html("密碼OK");
}
//////////////////////////////
if($('#date1').val().length==0){
$('#label4').css("color","red");
x=1;
}else{  $('#label4').css("color","blue");}
///////////////////////////////

if($('#label3').html()!="密碼OK"){
  x=1;
}
if($('#label2').html()!="帳號OK"){
  $('#label2').html("請先驗證帳號");
  $('#label2').css("color","red");
  x=1;

}


if(x==1){
return false;
}
});
});

</script>



</html>
