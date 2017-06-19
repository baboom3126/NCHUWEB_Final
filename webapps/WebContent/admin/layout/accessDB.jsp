<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="140.120.57.34" />
  <jsp:setProperty property="port" name="database" value="3306" />
  <jsp:setProperty property="db" name="database" value="team10" />
  <jsp:setProperty property="user" name="database" value="team10" />
  <jsp:setProperty property="password" name="database" value="NCHUTeam10!" />
</jsp:useBean>