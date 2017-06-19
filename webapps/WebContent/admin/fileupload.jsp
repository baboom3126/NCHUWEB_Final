<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.io.FilenameUtils"%>
<%
    //檔案上傳存放位置
    //String saveDirectory = application.getRealPath("/upload");
	String saveDirectory = "/Library/Tomcat9/webapps/ROOT/NCHUWEB_Final/upload";
	out.println(saveDirectory);
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
            String name = item.getFieldName();
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
            SimpleDateFormat dateformat2=new SimpleDateFormat("yyyyMMddhhmmss");
            String timedata=dateformat2.format(new Date());
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
    }
%>