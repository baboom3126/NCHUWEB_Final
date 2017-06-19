<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*,java.text.*"%>
<%@ page import="java.util.List,java.util.Iterator,java.util.Date,java.io.File" %>
<%@ page import="org.apache.commons.fileupload.*"%>

<%@ include file="layout/beforeBody.jsp" %>
<%@ include file="layout/sideNav.jsp" %>



<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script language="JavaScript">
	$(document).ready(function() {
		$('#email').blur(function(){
			//alert("blur");
			var email= $('#email').val();
			//alert(email);
			$.post("check.jsp", {email:email}, function(response){
				$('#check').html(response.trim());
				$('#check_input').val(response.trim());
				//alert($('#check_input').val());
				if(response.trim()=="OK!"){
				$('#check').css("color","blue");
				}else{$('#check').css("color","red");}

			//alert(response);
			} );
		});
	});
</script>
<%
if(!session.getAttribute("adminFirmID").equals("1")){
	response.sendRedirect("./index.jsp");
}%>

<%
	request.setCharacterEncoding("UTF-8");
	if(request.getParameter("submit") != null && request.getParameter("check").equals("OK!")) {
		String firm_id="";
		String firmname = request.getParameter("firmname");
		String description = request.getParameter("description");
		String birthday = request.getParameter("birthday");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		String queryCode = "SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_SCHEMA =  'team10' AND TABLE_NAME =  'firms' LIMIT 0 , 30";
		database.connectDB();
		database.query(queryCode);
		ResultSet rs = database.getRS();
		if(rs != null) {
			while(rs.next()){
			firm_id = rs.getString("AUTO_INCREMENT");
			}
		}

		String sql="INSERT INTO team10.firms (name,description,page_id)VALUES(?,?,?);";
		PreparedStatement ps = database.getCon().prepareStatement(sql);
		ps.setString(1, firmname);
		ps.setString(2, description);
		ps.setString(3, "1");
		ps.executeUpdate();

		sql="INSERT INTO team10.accounts(firm_id,status,name,birthday,email,password) VALUES (?,?,?,?,?,?);";
		ps = database.getCon().prepareStatement(sql);
		ps.setString(1, firm_id);
		ps.setString(2, "1");
		ps.setString(3, name);
		ps.setString(4, birthday);
		ps.setString(5, email);
		ps.setString(6, password);
		ps.executeUpdate();


		response.sendRedirect("./index.jsp");
	}database.closeDB();
%>

<div class="div_main">

<div class="header_main">
  <span style="font-size:36px; font-weight:border;">新增廠商</span>
</div>

<div class="div_main1">
	<div class="orderdetail card">
		<div class="line4"></div>

		<div class="div_form1">
			<form action="newfirm.jsp" method="post">
    			廠商名稱<input type="text" name="firmname" required/>
				描述<textarea name="description" required></textarea>
				使用者名稱<input type="text" name="name" required/>
    			生日<input type="date" name="birthday" required/>
    			帳號(信箱)<p id="check"></p><input id="check_input" type="hidden" name="check"/><input type="email" id="email" name="email" required/>
				密碼<input type="password" name="password" required/>
    			<input type="submit" name="submit" class="btn" value="新增">
    			<button type="submit" name="button" class="btn" onclick="history.back(-1)">返回</button>
			</form>
		</div>
		<div class="line4"></div>
	</div>
</div>

</div>

<%@ include file="layout/afterBody.jsp" %>
