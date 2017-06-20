<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.lang.*"%>
<%@include file="./layout/beforeBody.jsp" %>
		<script>
      $(document).ready(function(){
        $('.tooltipped').tooltip({delay: 50});
        $('.button-collapse').sideNav({
            closeOnClick: true
          });

      });
    </script>
<%
	String productID = "";
	if(request.getParameter("id") != null) {
		productID = request.getParameter("id");
	}
	if(request.getParameter("puid") != null) {
		String productUserID = request.getParameter("puid");
		String[] tokens = productUserID.split("-");
		productID = tokens[0];
		session.setAttribute("suggestID", tokens[1]);
	}
	String productName = "", productImage = "", productDescription = "";
	String productPrice = "", productFirmID = "", productCreatedAt = "";
	String accountID = (String)session.getAttribute("accountID");
	String sql = "SELECT * FROM products WHERE id = " + productID;
	database.connectDB();
	database.query(sql);
	ResultSet rs = database.getRS();
	if(rs != null) {
		while(rs.next()) {
			productName = rs.getString("name");
			productImage = rs.getString("image");
			productDescription = rs.getString("description");
			productPrice = rs.getString("price");
			productFirmID = rs.getString("firm_id");
			productCreatedAt = rs.getString("created_at");
		}
	}

	String[][] cart = (String[][])session.getAttribute("cartProduct");
	//session.removeAttribute("cartProduct");

	if(request.getParameter("addCart") != null) {
		String cartProductID = request.getParameter("cartProductID");
		int addCartProductAmount = Integer.parseInt(request.getParameter("cartProductAmount"));
		int checkSameID = 0;
		if(session.getAttribute("cartProduct") != null) { //session中本來有cart
			//String[][] cart = (String[][])session.getAttribute("cartProduct");
			cart = (String[][])session.getAttribute("cartProduct");
			int cartSize = cart.length;

			for(int i=0;i<cartSize;i++) {
				if(cart[i][0].equals(cartProductID)){ //session的cart本來就有這個id
					int inCartAmount = Integer.parseInt((String)cart[i][1]);
					inCartAmount += addCartProductAmount;
					cart[i][1] = Integer.toString(inCartAmount);

					checkSameID = 1;
				}
			}

			if(checkSameID != 1) { //session中的cart本來沒有這個id
				int newCartSize = cartSize+1;
				String[][] newCart = new String[newCartSize][2];
				for(int i=0;i<cartSize;i++) {
					newCart[i][0] = cart[i][0];
					newCart[i][1] = cart[i][1];
				}
				newCart[cartSize][0] = cartProductID;
				newCart[cartSize][1] = Integer.toString(addCartProductAmount);

				session.setAttribute("cartProduct", newCart);
			} else {
				session.setAttribute("cartProduct", cart);
			}
		} else { //session中本來沒有cart
			//String[][] cart = new String[1][2];
			cart = new String[1][2];
			cart[0][0] = cartProductID;
			cart[0][1] = Integer.toString(addCartProductAmount);
			session.setAttribute("cartProduct", cart);
		}

		response.sendRedirect("cart.jsp");
	}
%>


  <div class="row">
    <div class="col-md-2"></div>

    <div class="col-md-8 center" >


    </div>



    <div class="col-md-2"></div>

  </div>

  <div class="row">

    <div class="col-md-2"></div>

<div class="col-md-8" >

<a href="./index.jsp?cat=0" class="a1">全部商品</a><%
int count=1;
	String queryCode = "SELECT * FROM  product_cates";
	database.connectDB1();
	database.query1(queryCode);
	ResultSet rs1 = database.getRS1();
	if(rs1 != null) {
		while(rs1.next()){
      count++;
			String id = rs1.getString("id");
			String name = rs1.getString("name");
%><a href="./index.jsp?cat=<%=id%>" class="a1"><%=name%></a><%
		}
	}
	database.closeDB1();
%>
<style media="screen">
  .a1{
    width: calc(100%/<%=count%>)!important;
  }
</style>



</div>
    <div class="col-md-2"></div>
</div>






<hr>
<div class="row">

  <div class="col-md-2">

  </div>
<div class="col-md-8">

  <div class="card horizontal " >
    <div class="card-image">
      <img src="<%= productImage %>" width="600px" height="auto">
    </div>
    <div class="card-stacked">
      <div class="card-content" >
          <h3><%= productName %><h5>$ <%= productPrice %></h5> </h3>

        	<a data-toggle="tooltip" href="https://www.facebook.com/sharer/sharer.php?u=http://nchuteam10.azurewebsites.net/NCHUWEB_Final/detail.jsp?puid=<%=productID%>-<%=accountID %>"  title="" data-original-title="Share on Facebook" target="_blank">
        		<img src="https://facebookbrand.com/wp-content/themes/fb-branding/prj-fb-branding/assets/images/fb-art.png" width="48" height="48">
        	</a>

        	<a href="http://line.naver.jp/R/msg/text/?<%=productName %>%0D%0Ahttp://nchuteam10.azurewebsites.net/NCHUWEB_Final/detail.jsp?id=<%=productID%>&uid=<%=accountID %>">
        		<img src="https://camo.githubusercontent.com/564036504b76c84af19353e39e7155a1e89f15f0/68747470733a2f2f662e636c6f75642e6769746875622e636f6d2f6173736574732f323634303031312f313739373137312f39643732373464632d366162332d313165332d383065622d3161383534333833373433312e6a7067" width="48" height="48" alt="用LINE傳送" />
        	</a>

          <hr>
          <p><%= productDescription %></p>
      </div>
      <div class="card-action center">
        <form class="" action="detail.jsp" method="post">
          <span style="font-size:22px">數量</span>
          <input name="cartProductID" type="hidden" value="<%=productID%>">
          <select name="cartProductAmount" style="display: inline; width: 120px">
          	<% for(int i=1; i<=10; i++){ %>
          		<option><%= i %></option>
          	<% } %>
          </select>
          <br><br>
          <input type="submit" name="addCart" value="訂購" class="btn" style="text-align:center;">
        </form>
        </div>
    </div>
  </div>

</div>

  <div class="col-md-2">

  </div>
</div>

<%@include file="./layout/afterBody.jsp" %>
