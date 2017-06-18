<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%
try {
		String ImageFile="";
		String itemName = "";
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (!isMultipart) {}
		else {
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List items = null;
			try {
				items = upload.parseRequest(request);
			} catch (FileUploadException e) {
				e.getMessage();
			}
	 
			Iterator itr = items.iterator();
			while (itr.hasNext()) {
				FileItem item = (FileItem) itr.next();
				if (item.isFormField()) {
					String name = item.getFieldName();
					String value = item.getString();
					if(name.equals("ImageFile")) {
						ImageFile=value;
					}
				}
				else {
					try {
						itemName = item.getName();
						File savedFile = new File(config.getServletContext().getRealPath("/upload")+itemName);
						item.write(savedFile);
					} catch (Exception e) {
						out.println("Error"+e.getMessage());
					}
				}
			}
		}
	} catch (Exception e) {
		out.println(e.getMessage());
	}
%>