<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@include file="./layout/beforeBody.jsp" %>

<%
	String[][] cart = (String[][])session.getAttribute("cartProduct");
	String adminName = (String)session.getAttribute("accountName");
	if(request.getParameter("cancel") != null) {
		int cancelID = Integer.parseInt(request.getParameter("cancel"));
		if(cart.length == 1) { //唯一一個被移除
			session.removeAttribute("cartProduct");
			//out.println("1");
		} else {
			String[][] newCart = new String[cart.length - 1][2];
			if(cancelID != 0) { //非第一或唯一者被移除
				for(int i=0;i<cancelID;i++) {
					newCart[i][0] = cart[i][0];
					newCart[i][1] = cart[i][1];
				}
				for(int j=cancelID+1;j<=newCart.length;j++) {
					newCart[j-1][0] = cart[j][0];
					newCart[j-1][1] = cart[j][1];
				}
				//out.println("2");
			} else { //第一個被移除
				for(int j=0;j<newCart.length;j++) {
					newCart[j][0] = cart[j+1][0];
					newCart[j][1] = cart[j+1][1];
				}
				//out.println("3");
			}
			session.setAttribute("cartProduct", newCart);
		}

		response.sendRedirect("cart.jsp");
	}
%>
		<script>
      $(document).ready(function(){
        $('.tooltipped').tooltip({delay: 50});
        $('.button-collapse').sideNav({
            closeOnClick: true
          });

      });
    </script>

  <div class="row">
    <div class="col-md-2"></div>
<div class="col-md-8 card" >

<div class="line4"><br></div>

  <div class="">
    <h5>
    <span style="font-size:36px;">Cart</span>
    購物車
</h5>
    <hr>
	<table  class="highlight">
    	<tr>
      		<th class="th11" height="70px" >項目</th>
      		<th class="th11">商品名稱</th>
            <th class="th11">相片</th>
      		<th class="th11">數量</th>
      		<th class="th11">單價</th>
      		<th class="th11">小計</th>
            <th class="th11">變更</th>
    	</tr>
    <%
    if(session.getAttribute("cartProduct") != null){
    	for(int i=0;i<cart.length;i++) {
    		String name = "";
    		String image = "";
    		int price = 0;
    		String queryID = cart[i][0];
    		database.connectDB();
    		database.query("SELECT name, image, price FROM products WHERE id = " + queryID);
    		ResultSet rs = database.getRS();
    		if(rs != null) {
    			while(rs.next()){
    				name = rs.getString("name");
    				image = rs.getString("image");
    				price = rs.getInt("price");
    			}
    		}
    %>

    	<tr>
      		<th class="th1" height="60px"><% out.println(i+1); %></th>
      		<th class="th1"><%= name %></th>
            <th class="th11"><img src="<%= image %>" alt="..." height="100px"></th>
      		<th class="th1" id="amount<%= i %>"><%= cart[i][1] %></th>
      		<th class="th1" id="price<%= i %>"><%= price %></th>
      		<th class="th1" id="total<%= i %>"></th>
      		<th class="th1"><a href="cart.jsp?cancel=<% out.println(i); %>">取消</a></th>
  		</tr>

    <%
	}%>
	<div class="center">
  			<h5>總價：<span id="grandTotal"></span></h5><br>
           <a href="#order_info"><button type="button" class="btn  #81c784 green lighten-2"name="button" id="btn1">下一步 訂購</button></a>
         </div>

			<%
    }
    %>
	</table>

	<div class="center">
		<br>
		<a href="./index.jsp" class="btn">繼續購物</a>
	</div>
          <hr>
    		</div>

<div class="line4">
<br>
</div>



        <div class="line4">
<br>
        </div>

</div>
    <div class="col-md-2"></div>
</div>

<script type="text/javascript">
$(document).ready(function(){
	var a;
	var grandTotal=0;
	var length = 1;
	<% if(session.getAttribute("cartProduct")!=null) { %>
		length = <% out.println(cart.length); %>;
	<% } %>
	for(a=0;a<length;a++){
		$("#total"+a).html($("#amount"+a).text()*$("#price"+a).text());
		grandTotal = grandTotal + ($("#amount"+a).text()*$("#price"+a).text());
	}
	$("#grandTotal").html(grandTotal);
});
</script>

<%
	String orderName = "";
	String orderAddress = "";
	if(session.getAttribute("orderName") != null) {
		orderName = (String)session.getAttribute("orderName");
		orderAddress = (String)session.getAttribute("orderAddress");
	}
%>

<form class="" action="purchase.jsp" method="post">

<div class="row" id="order_info">

 <div class="col-md-2"></div>
<div class="col-md-8 card" >
<br><br>
<div class="col-md-1">
</div>
  <div class="col-md-4">
   <label for="order_name">訂購人</label>
   <input type="text" name="order_name"  id="order_name" value="<%= adminName %> " disabled>
  </div>
<div class="col-md-1">
</div>

<div class="col-md-4">
 <label for="order_name">地址</label>
 <input type="text" name="order_address"  id="order_name" value="<%= orderAddress %>">
</div>

<div class="col-md-12 center" style="margin-bottom:40px;">
 <input type="submit" name=""  class="btn  #81c784 green lighten-2" value="送出">

</div>
</div>

<div class="col-md-1"></div>

</div>


</form>
<script type="text/javascript">
  $(document).ready(function() {

   $('#order_info').hide();

   $('#btn1').click(function(){
    $('#order_info').fadeIn(500);

   })

  })
</script>

<%@include file="./layout/afterBody.jsp" %>
