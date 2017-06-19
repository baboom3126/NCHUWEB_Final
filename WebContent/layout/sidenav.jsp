<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



    <%-- <ul id="slide-out" class="side-nav fixed">
      <li><a href="./member.jsp"><span style="font-size:18px;">個人資料</span></a></li>
      <li><a href="./order.jsp"><span style="font-size:18px;">查詢訂單</span></a></li>
      <li><a href="./point.jsp"><span style="font-size:18px;">查詢積分</span></a></li>
    </ul> --%>



    <div class="fixed-action-btn vertical hide-on-med-and-down" style="margin-right:90%">
    <a class="btn-floating btn-large red">
      <i class="large material-icons">view_list</i>
    </a>
    <ul>
      <li><a class="btn-floating red tooltipped" data-position="right" data-delay="50" data-tooltip="個人資料" href="./member.jsp"><i class="material-icons" alt="Test">account_circle</i></a></li>
      <li><a class="btn-floating blue darken-1 tooltipped" data-position="right" data-delay="50" data-tooltip="查詢訂單" href="./order.jsp"><i class="material-icons">info</i></a></li>
      <li><a class="btn-floating green tooltipped" data-position="right" data-delay="50" data-tooltip="查詢積分" href="./point.jsp"><i class="material-icons">forward_30</i></a></li>
    </ul>
  </div>


<style>
#slide-out
{
    width: 20%;
    top: 50%;
    height: calc(20% + 60px);
    background-color: orange;
}
</style>
