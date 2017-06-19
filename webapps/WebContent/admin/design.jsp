<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>

<%@ include file="layout/beforeBody.jsp" %>

<%@ include file="layout/sideNav.jsp" %>

<div class="div_main">

<div class="header_main">
  <span style="font-size:36px; font-weight:border;">商品管理主頁</span>
</div>

<div class="div_main1">
	<div class="orderdetail card">
		<div class="line4"></div>
		
		<div class="content_table">
			<table>
				<tr>
					<td colspan="2">
						<div class="div_design">
							<p class="p1">目前</p>
							<img src="./images/logo_bac.png" width="300px" height="300px">
							<br>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="div_design">
							<p class="p2" >造型1</p>
							<img src="./images/logo_bac.png" width="150px" height="150px">
							<br>
							<a href="#" class="btn">預覽</a>
						</div>
					</td>
    				<td>
    					<div class="div_design">
    						<p class="p2">造型2</p>
    						<img src="./images/logo_bac.png" width="150px" height="150px">
    						<br>
    						<a href="#" class="btn">預覽</a>
    					</div>
    				</td>
				</tr>
				<tr>
    				<td>
    					<div class="div_design">
    						<p class="p2">造型3</p>
							<img src="./images/logo_bac.png" width="150px" height="150px">
							<br>
							<a href="#" class="btn">預覽</a>
						</div>
					</td>
					<td>
						<div class="div_design">
							<p class="p2">造型4</p>
							<img src="./images/logo_bac.png" width="150px" height="150px">
							<br>
							<a href="#" class="btn">預覽</a>
						</div>
					</td>
				</tr>
			</table>
			<div class="line4"></div>
			<div class="line4"></div>
		</div>
	</div>
</div>

</div>

<%@ include file="layout/afterBody.jsp" %>
