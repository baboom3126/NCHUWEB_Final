<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@include file="./layout/beforeBody.jsp" %>

<%
	String[][] cart = (String[][])session.getAttribute("cartProduct");
%>

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
      		<th class="th1"><%= cart[i][1] %></th>
      		<th class="th1"><%= price %></th>
      		<th class="th1"><% out.println(Integer.parseInt(cart[i][1]) * price); %></th>
      		<th class="th1"><a href="#">取消</a></th>
  		</tr>
    
    <%
    	}
    }
    %>
	</table>
          <hr>
    		</div>

<div class="line4">
<br>
</div>

 <div class="center">
          <button type="button" class="btn  #81c784 green lighten-2"name="button">下一步 訂購</button>
        </div>

        <div class="line4">
<br>
        </div>

</div>
    <div class="col-md-2"></div>
</div>




