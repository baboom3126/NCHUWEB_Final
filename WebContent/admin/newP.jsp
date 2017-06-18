<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*,java.text.*"%>
<%@ page import="java.util.List,java.util.Iterator,java.util.Date,java.io.File" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.io.FilenameUtils"%>

<%@ include file="layout/beforeBody.jsp" %>

<%@ include file="layout/sideNav.jsp" %>

<%
/* String name = request.getParameter("name");
String description = request.getParameter("description");
String price = request.getParameter("price");
String firmID = request.getParameter("firmID");
String cateID = request.getParameter("cateID");
String redirectURL = "productCate.jsp?id="+cateID;
String imageFile="";
String imageName = "";
String fileName = "";
database.connectDB(); */

//檔案上傳存放位置
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
        String imageName = item.getFieldName();
        String value = item.getString();
        value = new String(value.getBytes("ISO-8859-1"), "UTF-8");
        out.println(imageName + "=" + value+"<br>");
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
        //timedata = timedata + "." + fileNameExtension;
        //取得檔案類型
        String contentType = item.getContentType();
        //判斷檔案是否存在於記憶體
        boolean isInMemory = item.isInMemory();
        //取得檔案大小
        long sizeInBytes = item.getSize();
        fileName = timedata + fileName;
        out.println("fieldName="+fieldName+"<br>");
        out.println("fileName="+fileName+"<br>");
        out.println("contentType="+contentType+"<br>");
        out.println("isInMemory="+isInMemory+"<br>");
        out.println("sizeInBytes="+sizeInBytes+"<br>");
        if (fileName != null && !"".equals(fileName)) {
            fileName= FilenameUtils.getName(fileName);
            out.println("fileName saved="+fileName+"<br>");
            File uploadedFile = new File(saveDirectory + fileName);
            //File uploadedFile = new File(fileName);
            item.write(uploadedFile);
        }
    }
}

/*out.println(name);
out.println(fileName);
out.println(description);

database.addProduct(name, fileName, description, price, firmID, cateID);*/
//database.addProduct(name, description, price, firmID, cateID);
database.closeDB();
%>

<%@ include file="layout/afterBody.jsp" %>
