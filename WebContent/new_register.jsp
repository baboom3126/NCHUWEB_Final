<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@include file="./layout/beforeBody.jsp" %>

<%
String message="";

request.setCharacterEncoding("UTF-8");
String name=request.getParameter("name1");
String email=request.getParameter("email");
String pwd=request.getParameter("pwd");
String birth=request.getParameter("date1");
String father_id=request.getParameter("father_id");

int firm_id=0;

///////////驗證email重複///////////
int check=0;
try{
String query="select * from accounts";
database.connectDB();
database.query(query);
ResultSet rs = database.getRS();
if(rs!=null){
  while(rs.next()){
    String db_account=rs.getString("email");
    if(db_account.equals(email)){
        message="<font color='red'>註冊失敗<br>已有重複的帳號</font>";
        check=1;
    }
  }
}}
catch(Exception e){out.print(e);}

database.closeDB();
///////////////////////////////



String sql = "insert into accounts (name, birthday,email,password,father_id,firm_id) values (?,?,?,?,?,?)";

if(name!=null&&check!=1){
  database.connectDB();
try{

PreparedStatement ps=database.getCon().prepareStatement(sql);
ps.setString(1,name);
ps.setString(2,birth);
ps.setString(3,email);
ps.setString(4,pwd);
ps.setString(5,father_id);
ps.setInt(6,firm_id);
int a=ps.executeUpdate();

message="註冊成功";
}

catch(Exception e){
message="註冊失敗";
}


database.closeDB();

}

if(name==null){
  message="<font color='red'>無資料輸入</font>";
}
%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <div class="container">
     <div class="col s12 m7">
       <h2 class="header">註冊</h2>
       <hr>
       <div class="card row">

<div class="col-md-3">

</div>

<div class="col-md-6 center">


<h5>您好!</h5>
<h5><%=name%></h5>
<h5><%=message%></h5>

<button type="button" class="btn " name="button" onclick="location.href='login.jsp'">繼續</button>

<div class="line4"></div>


</div>


<div class="col-md-3">

</div>

       </div>
     </div>
   </div>

<br><br><br><br><br><br><br><br><br>

  </body>



</html>
