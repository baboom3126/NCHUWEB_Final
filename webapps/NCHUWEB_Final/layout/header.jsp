<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="navbar-fixed">
<nav>
  <div class="nav-wrapper row" style="background-color:#233142;">

  <div class="col m8">

   <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
    <a href="./index.jsp" class="brand-logo center"><i class="material-icons">cloud</i>生活電商</a>    </div>

    <div class="">

    <ul class="right hide-on-med-and-down">
     <li><a href="./cart.jsp" class="a_nav"><i class="material-icons left">shopping_cart</i>購物車</a></li>
     <%
     	if(session.getAttribute("accountName") != null) {
     %>
     		<li><a class="dropdown-button a_nav" href="./member.jsp" data-activates="dropdown1" ><i class="material-icons left">list</i>會員中心<i class="material-icons right">arrow_drop_down</i></a></li>
     <%
     	} else {
     %>
     		<li><a href="./login.jsp" class="a_nav"><i class="material-icons left">perm_contact_calendar</i>登入/註冊</a></li>
     <%
     	}
     %>

   </ul>

   <ul id="dropdown1" class="dropdown-content" style="background-color:#616161 ;">
   	<%
     	if(session.getAttribute("accountName") != null) {
   	%>
			<li><a href="./member.jsp" style=" color:white;"><i class="material-icons left">list</i>會員中心</a></li>
     		<li class="divider"></li>
     		<li><a href="./order.jsp" style=" color:white;"><i class="material-icons left">info</i>查詢訂單</a></li>
     		<li><a href="./member.jsp?query" style=" color:white;"><i class="material-icons left">forward_30</i>查詢積分</a></li>
     		<li><a href="./logout.jsp?logout=1" style=" color:white;"><i class="material-icons left">undo</i>登出</a></li>
    <%
     	}
   	%>


   </ul>
  </div>
</div>
</nav>
</div>
<ul id="mobile-demo" class="side-nav">
  <%
   	  if(session.getAttribute("accountName") != null) {
  %>
        <li class="bold"><a href="./member.jsp" class="waves-effect waves-teal"><i class="material-icons left">assignment_ind</i><span style="font-size:14pt">會員中心</span></a></li>
        <li class="bold"><a href="./order.jsp" class="waves-effect waves-teal"><i class="material-icons left">info</i><span style="font-size:14pt">查詢訂單</span></a></li>
        <li class="bold"><a href="./member.jsp?query" class="waves-effect waves-teal"><i class="material-icons left">forward_30</i><span style="font-size:14pt">查詢積分</span></a></li>
      	<li class="divider"></li>
        <li class="bold"><a href="./logout.jsp?logout=1" class="waves-effect waves-teal"><i class="material-icons left">undo</i><span style="font-size:14pt">登出</span></a></li>
  <%  }
      else
      { %>
        <li class="bold"><a href="./login.jsp" class="waves-effect waves-teal"><i class="material-icons left">touch_app</i><span style="font-size:14pt">登入</span></a></li>
  <%  }%>
  <li class="bold"><a href="./cart.jsp" class="waves-effect waves-teal"><i class="material-icons left">shopping_cart</i><span style="font-size:14pt">購物車</span></a></li>

  <li><a href="index.jsp" class="waves-effect waves-light btn yellow darken-2 grey-text text-darken-4 " ><span style="font-size:14pt">Home</span></a></li>

</ul>

<div class="row" style="background-color:#FCE38A;background-image:url(./image/4.jpg); height:430px; color:white; text-align:center; opacity:0.85;">
<div class="col-md-12" >
  <img src="" alt="">
</div>
</div>
