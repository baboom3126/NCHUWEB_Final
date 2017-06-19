<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="navbar-fixed">

<nav>
  <div class="nav-wrapper" style="background-color:#233142;">
<div class="row">

    <div class="col m4 hide-on-med-and-down">
      <span style="font-size:16px; margin-left:10px; ">搜尋 </span>
      <input  type="text" name="" value="" style="width:180px;height:30px;background-color:white;color:grey;margin-left:5px; display:inline-block;" >
      <a href="./index.jsp" class="brand-logo "><i class="material-icons">search</i></a>
    </div>
  <div class="col m8">

    <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
    <a href="./index.jsp" class="brand-logo center"><i class="material-icons">cloud</i>生活電商</a>
  </div>
    <ul class="right hide-on-med-and-down">
     <li><a href="./cart.jsp" class="a_nav"><i class="material-icons left">shopping_cart</i>購物車</a></li>
     <li><a class="dropdown-button a_nav" href="./member.jsp" data-activates="dropdown1" ><i class="material-icons left">list</i>會員中心<i class="material-icons right">arrow_drop_down</i></a></li>
     <li><a href="./login.jsp" class="a_nav"><i class="material-icons left">perm_contact_calendar</i>登入/登出</a></li>


    </ul>
</div>


   <ul id="dropdown1" class="dropdown-content" style="background-color:#616161 ;">
     <li><a href="./member.jsp" style=" color:white;"><i class="material-icons left">list</i>會員中心</a></li>
     <li class="divider"></li>
     <li><a href="./order.jsp" style=" color:white;"><i class="material-icons left">info</i>查詢訂單</a></li>
     <li><a href="./point.jsp" style=" color:white;"><i class="material-icons left">forward_30</i>查詢積分</a></li>
   </ul>

</div>

</nav>
</div>
    <ul id="mobile-demo" class="side-nav">
      <!-- <li><a href="index.html" class="waves-effect waves-light btn purple lighten-3 grey-text text-darken-4 "><span style="font-size:18pt">教學網站-許建民</span></a></li> -->

      <li class="bold"><a href="member.jsp" class="waves-effect waves-teal">會員中心</a></li>
      <li class="bold"><a href="order.jsp" class="waves-effect waves-teal">查詢訂單</a></li>
      <li class="bold"><a href="point.jsp" class="waves-effect waves-teal">查詢積分</a></li>
      <li><a href="index.html" class="waves-effect waves-light btn yellow darken-2 grey-text text-darken-4 " >Home</a></li>

    </ul>
<div class="row" style="background-color:#FCE38A;background-image:url(./image/4.jpg); height:430px; color:white; text-align:center; opacity:0.85;">
<div class="col-md-12" >
  <img src="" alt="">
</div>
</div>
