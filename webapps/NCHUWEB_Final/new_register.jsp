<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@include file="./layout/beforeBody.jsp" %>
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
		<script>
      $(document).ready(function(){
        $('.tooltipped').tooltip({delay: 50});
        $('.button-collapse').sideNav({
            closeOnClick: true
          });

      });
    </script>
<%
///////////產生亂數///////////
int strLen = 10;		// default length:10
int num = 0;			// 隨機字符碼
String outStr = "";		// 產生的密碼

while(outStr.length() < strLen)  {
	num = 0;
	num = (int)(Math.random()*(90-50+1))+50;	//亂數取編號為 50~90 的字符	(排除 0 和 1)
	if (num > 57 && num < 65)
		continue;			//排除非數字非字母
	else if (num == 73 || num == 76 || num == 79)
		continue;			//排除 I、L、O
	outStr += (char)num;
}
%>

<%
String messageDB="";

request.setCharacterEncoding("UTF-8");
String name=request.getParameter("name1");
String email=request.getParameter("email");
String pwd=request.getParameter("pwd");
String birth=request.getParameter("date1");
String fatherEmail=request.getParameter("fatherEmail");
String fatherID = request.getParameter("fatherID");


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
        messageDB="<font color='red'>註冊失敗<br>已有重複的帳號</font>";
        check=1;
    }
  }
}}
catch(Exception e){out.print(e);}

database.closeDB();
///////////////////////////////



String sql = "insert into accounts (name, birthday,email,password,father_id,firm_id,validation_code) values (?,?,?,?,?,?,?)";

if(name!=null&&check!=1){
  database.connectDB();
try{

PreparedStatement ps=database.getCon().prepareStatement(sql);
ps.setString(1,name);
ps.setString(2,birth);
ps.setString(3,email);
ps.setString(4,pwd);
ps.setString(5,fatherID);
ps.setInt(6,firm_id);
ps.setString(7,outStr);
int a=ps.executeUpdate();

messageDB="註冊成功<br>請至信箱進行認證";
}

catch(Exception e){
messageDB="註冊失敗";
}


database.closeDB();

}

if(name==null){
  messageDB="<font color='red'>無資料輸入</font>";
}
%>

<%
/////////認證信/////////

//mail content
String recipients = email;
String subject = "會員認證信";
String urlHead = "http://nchuteam10.azurewebsites.net/NCHUWEB_Final/login.jsp?mode=activate&code=";
String link = urlHead + outStr;
String hyper = "<a href='" + link +"'>"+link+"</a>";
String content = "您好，" + name + "，請點選這個網址來開通帳號<br/>" + hyper;

//get properties and se
final String userName = "nchuwebfinal@gmail.com";
final String password = "asdf1234-";

Properties props = new Properties();

props.put("mail.smtp.host", "smtp.gmail.com");
props.put("mail.smtp.from", userName);
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.sendpartial",true);
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
props.put("mail.smtp.socketFactory.port", "465");

Session se = Session.getInstance(props, new Authenticator() {  //use javax.mail.Session
protected PasswordAuthentication getPasswordAuthentication() {
 return new PasswordAuthentication(userName, password);
}
});

try {

// Define message
MimeMessage message = new MimeMessage(se);
try{
  message.setReplyTo(InternetAddress.parse(recipients));
  message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipients, false));
} catch(Exception e){
  System.out.println("## Bad address:"+InternetAddress.parse(recipients, false));
  return;
}
message.setSubject(subject , "UTF-8");

Multipart multipart = new MimeMultipart();

// create the message part
MimeBodyPart messageBodyPart = new MimeBodyPart();
messageBodyPart.setContent(content, "text/html; charset=utf-8");
multipart.addBodyPart(messageBodyPart);

// Put parts in message
message.setContent(multipart);

// Send message
Transport.send(message);
} catch (MessagingException e) {
    if (e.getMessage().equals("No recipient addresses")) {
    } else {
        throw new RuntimeException(e);
    }
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
<h5><%=messageDB%></h5>


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

database.closeDB1();
