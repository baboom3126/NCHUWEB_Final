<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*" %>

<%@ include file="layout/beforeBody.jsp" %>

<%@ include file="layout/sideNav.jsp" %>

<div class="div_main">

<div class="header_main">
  <span style="font-size:36px; font-weight:border;">新增商品</span>
</div>

<div class="div_main1">
	<div class="orderdetail card">
		<div class="line4"></div>
		<p class="p3">創建中....</p>
		<%-- 成功自動導回 --%>

		<div class="line4">
			<a href="./productIndex.jsp" class="btn">返回</a>
		</div>
		
		<div class="line4"></div>
	</div>
</div>

</div>

<%@ include file="layout/afterBody.jsp" %>
