<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*,java.text.*"%>
<%@ page import="java.util.List,java.util.Iterator,java.util.Date,java.io.File" %>

<%@ include file="layout/beforeBody.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	if(request.getParameter("submit") != null) {
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		String price = request.getParameter("price");
		String firmID = request.getParameter("firmID");
		String cateID = request.getParameter("cateID");
		String redirectURL = "productCate.jsp?id="+cateID;
		String image = request.getParameter("image");
		String imageFile="";
		String imageName = "";
		database.connectDB();

		out.println("here");
		out.println(redirectURL);
		//out.println(imageName);
		database.addProduct(name, image, description, price, firmID, cateID);
		//database.addProduct(name, description, price, firmID, cateID);

		database.closeDB();

		response.sendRedirect(redirectURL);


	    /* //檔案上傳存放位置
	    String saveDirectory = application.getRealPath("/upload");
	    //設定編碼
	    request.setCharacterEncoding("UTF-8");
	    //檢查是否有檔案上傳的request
	    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	    //判斷是否有request
	    out.println("isMultipart="+isMultipart+"<br>");
	    // Create a factory for disk-based file items
	    FileItemFactory factory = new DiskFileItemFactory();
	    // Create a new file upload handler
	    ServletFileUpload upload = new ServletFileUpload(factory);
	    // Create a progress listener
	    ProgressListener progressListener = new ProgressListener(){
	       public void update(long pBytesRead, long pContentLength, int pItems) {
	           long mBytes = pBytesRead / 1000000;
	       }
	    };
	    upload.setProgressListener(progressListener);
	    // 上傳檔案資料
	    List items = upload.parseRequest(request);
	    // Process the uploaded items
	    Iterator iter = items.iterator();
	    while (iter.hasNext()) {
	        FileItem item = (FileItem) iter.next();
	        if (item.isFormField()) {
	            imageName = item.getFieldName();
	            String value = item.getString();
	            value = new String(value.getBytes("ISO-8859-1"), "UTF-8");
	            out.println(name + "=" + value+"<br>");
	        } else {
	            String fieldName = item.getFieldName();
	            //取得檔案名稱
	            String fileName = item.getName();
	            //字串分割，取得檔案副檔名
	            int startIndex = fileName.lastIndexOf(46) + 1;
	            int endIndex = fileName.length();
	            String fileNameExtension = fileName.substring(startIndex, endIndex);
	            //取得現在時間（儲存檔案名稱）
	            SimpleDateFormat dateformat2 = new SimpleDateFormat("yyyyMMddhhmmss");
	            String timedata = dateformat2.format(new Date());
	            timedata = timedata + "." + fileNameExtension;
	            //取得檔案類型
	            String contentType = item.getContentType();
	            //判斷檔案是否存在於記憶體
	            boolean isInMemory = item.isInMemory();
	            //取得檔案大小
	            long sizeInBytes = item.getSize();
	            out.println("fieldName="+fieldName+"<br>");
	            out.println("fileName="+fileName+"<br>");
	            out.println("contentType="+contentType+"<br>");
	            out.println("isInMemory="+isInMemory+"<br>");
	            out.println("sizeInBytes="+sizeInBytes+"<br>");
	            if (fileName != null && !"".equals(fileName)) {
	                fileName= FilenameUtils.getName(fileName);
	                out.println("fileName saved="+fileName+"<br>");
	                File uploadedFile = new File(saveDirectory, timedata);
	                item.write(uploadedFile);
	            }
	        }
	    } */



	}





	if(request.getParameter("modify") != null) {
		String id = request.getParameter("proID");
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		String price = request.getParameter("price");
		String firmID = request.getParameter("firmID");
		String cateID = request.getParameter("cateID");
		String redirectURL = "productCate.jsp?id="+cateID;
		String image = request.getParameter("image");
		database.connectDB();
		database.modProduct(id, name, image, description, price);
		database.closeDB();

		response.sendRedirect(redirectURL);
	}

	if(request.getParameter("delete") != null) {
		String pc_id = request.getParameter("proID");
		String cateID = request.getParameter("cateID");
		String redirectURL = "productCate.jsp?id="+cateID;
		database.connectDB();
		String sql = "DELETE FROM products WHERE id = " + pc_id;
		PreparedStatement ps = database.getCon().prepareStatement(sql);
		ps.executeUpdate();
		database.closeDB();
		response.sendRedirect(redirectURL);

	}


%>

<%@ include file="layout/sideNav.jsp" %>

<%
	String pageTitle = "新增商品";
	String pageButton = "新增";
	String productName = "";
	String productImage = "";
	String productDescription = "";
	String productPrice = "";
	String pcID = request.getParameter("id");
	String proID = request.getParameter("proid");
	String submitName = "submit";
	String firmID = (String)session.getAttribute("adminFirmID");
	if(request.getParameter("mode") != null) {
		pageTitle = "修改商品";
		pageButton = "修改";
		submitName = "modify";
		pcID = request.getParameter("cateid");
		database.connectDB();
		database.query("SELECT name, image, description, price FROM products WHERE id = " + proID + " AND firm_id = " + firmID);
		ResultSet rs = database.getRS();
		if(rs != null) {
			while(rs.next()) {
				productName = rs.getString("name");
				productImage = rs.getString("image");
				productDescription = rs.getString("description");
				productPrice = rs.getString("price");
			}
		}
	}

%>

<div class="div_main">

<div class="header_main">
  <span style="font-size:36px; font-weight:border;"><%= pageTitle %></span>
</div>

<div class="div_main1">
	<div class="orderdetail card">
		<div class="line4"></div>

		<div class="div_form1">
			<form action="newProduct.jsp" method="get" enctype="multipart/form-data">
    			名稱<input type="text" name="name" value="<%= productName %>">
    			價格<input type="text" name="price" value="<%= productPrice %>">
    			照片URL
    			<textarea name="image"><%= productImage %></textarea>
    			<!-- <div class="div_center">
    				<input type="file" name="imageFile" value="" >
        		</div> -->
        		描述<textarea name="description"><%= productDescription %></textarea>
        		<input type="hidden" name="firmID" value="<%= firmID %>">
        		<input type="hidden" name="cateID" value="<%= pcID %>">
        		<input type="hidden" name="proID" value="<%= proID %>">
    			<button type="submit" name="<%= submitName %>" class="btn"><%= pageButton %></button>
    			<button type="submit" name="delete" class="btn" >刪除</button>

    			<button type="submit" name="button" class="btn" onclick="history.back(-1)">返回</button>
			</form>
		</div>
		<div class="line4"></div>
	</div>
</div>

</div>

<%@ include file="layout/afterBody.jsp" %>
