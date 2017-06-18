<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@include file="./layout/accessDB.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String email="";
email=request.getParameter("email");
int check=0;
String message="";
if("".equals(email))
{
  check=1;
}
else{

String sql="select * from accounts";
database.connectDB();
database.query(sql);
ResultSet rs = database.getRS();

String db_account;

if(rs!=null){
  while(rs.next())
  {
    db_account=rs.getString("email");
    if(db_account.equals(email))
    {
      check=2;
    }
  }
}

database.closeDB();
}


switch(check){


  case 0:
  message="帳號OK";
  break;

  case 1:
  message="不得輸入空白";
  break;

  case 2:
  message="已有重複的帳號";
}
out.print(message);%>
