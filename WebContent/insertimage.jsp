<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %> 
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%> 
<%@ page import="org.apache.commons.fileupload.*"%> 
<%@ page import="java.util.*, java.io.*" %> 
<%@ page import="java.util.Iterator"%> 
<%@ page import="java.util.List"%> 
<%@ page import="java.io.File"%> 
<%@ page contentType="text/html;charset=UTF-8" %> 
<%@ include file="getcon.jsp"%> <!-- to connect a database--> 

<% 
String ivid=(String)session.getAttribute("ivid");
try 
{ 
String ImageFile=""; 
String itemName = ""; 
boolean isMultipart = ServletFileUpload.isMultipartContent(request); 
if (!isMultipart) 
{ 
} 
else 
{ 
FileItemFactory factory = new DiskFileItemFactory(); 
ServletFileUpload upload = new ServletFileUpload(factory); 
List items = null; 
try 
{ 
items = upload.parseRequest(request); 
} 
catch (FileUploadException e) 
{ 
e.getMessage(); 
} 

Iterator itr = items.iterator(); 
while (itr.hasNext()) 
{ 
FileItem item = (FileItem) itr.next(); 
if (item.isFormField()) 
{ 
String name = item.getFieldName(); 
String value = item.getString(); 
if(name.equals("ImageFile")) 
{ 
ImageFile=value; 
} 

} 
else 
{ 
try 
{ 
itemName = item.getName();
System.out.println(config.getServletContext().getRealPath("Example"));
File savedFile = new File(config.getServletContext().getRealPath("Example")+"\\"+itemName); 
item.write(savedFile); 
} 
catch (Exception e) 
{ 
out.println("Error"+e.getMessage()); 
} 
} 
} 
try 
{ 
st.executeUpdate("insert into test(vid,image) values ('"+ivid+"','"+itemName+"')"); 
response.sendRedirect("printReport.jsp");
} 
catch(Exception el) 
{ 
out.println("Inserting error"+el.getMessage()); 
} 
} 
} 
catch (Exception e){ 
out.println(e.getMessage()); 
} 
%> 
