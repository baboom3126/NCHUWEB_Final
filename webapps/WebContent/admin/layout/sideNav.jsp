<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	
<div class="ui vertical inverted sticky menu fixed top" style="left: 0px; top: -1px; width: 250px !important; height: 1813px !important; margin-top: 0px;">
	<div class="item">
		<a class="ui logo icon image" href="./index.jsp">
			<img src="./images/logo_bac.png" width="70px" height="70px">
		</a>
		<a href="./index.jsp">
			<b style="font-size:18pt">後台</b>
		</a>
	</div>
	<div class="item">
		
		<div class="menu">
			<a class="item" href="./productIndex.jsp">
				<span style="font-size:14pt">商品管理</span>
			</a>
			<br/>
			<a class="item" href="./orderIndex.jsp">
				<span style="font-size:14pt">訂單管理</span>
			</a>
			<br/>
			<a class="item" href="./design.jsp">
				<span style="font-size:14pt">品牌形象館設計</span>
			</a>
			<br/>
			<a class="item" href="./analyze.jsp">
				<span style="font-size:14pt">報表分析</span>
			</a>
			<br/>
			<a class="item" href="#">
				<span style="font-size:14pt">會員管理</span>
			</a><br/>
			<%
			String adminFirmID="123";
			if(session.getAttribute("adminFirmID") != null){
			adminFirmID = (String)session.getAttribute("adminFirmID");
			}
			if (adminFirmID.equals("1")){
			%><a class="item" href="newfirm.jsp">
				<span style="font-size:14pt">新增廠商</span>
			</a><%}%>
			
		</div>
	</div>
</div>