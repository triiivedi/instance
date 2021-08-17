

<html> 
<body> 
<form name="form1" method="post" enctype="multipart/form-data" action="insertimage.jsp"> 

<p> 
<input type="file" name="ImageFile" id="ImageFile" /> 
</p> 
<p> 
<input type="submit" name="submit" value="submit" /> 
</p> 
</form> 
</body> 
</html> 


code of getcon.jsp 

<%@ page import="java.sql.*" %> 
<%!Statement st=null; 
Connection cn=null; 
%> 
<% 
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
cn=DriverManager.getConnection("jdbc:odbc:data","root",""); 
<!-- database name= data, username=root, password=blank--> 
st=cn.createStatement(); 
%> 


Code of insertimage.jsp 


 
<%@ page import="java.util.*, java.io.*" %> 
<%@ page import="java.util.Iterator"%> 
<%@ page import="java.util.List"%> 
<%@ page import="java.io.File"%> 
<%@ page contentType="text/html;charset=UTF-8" %> 
<%@ include file="getcon.jsp"%> <!-- to connect a database--> 

<% 
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
File savedFile = new File("config.getServletContext().getRealPath("/")+"Example\\image-folder\\"+itemName); 
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
st.executeUpdate("insert into test(image) values ('"+itemName+"')"); 

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

After inserting image Path into database retrieve image by following JSP code?.. 

</span> 

<%@ include file="getcon.jsp"%> 
<html> 
<head> 
<title>View Image Page</title> 
</head> 
<body> 
<table width="100%" border="0"> 
<!-- main content --> 
<% 
ResultSet rs=null; 
try 
{ 

rs=st.executeQuery("select image from test"); 

while(rs.next()) 
{ 
%> 
<table width="70%" height="160" border="1" align="center"> 
<tr> 
<!-- Mention Directory where your images has been saved--> 

<td><img src="image/<%=rs.getString("image") %>" width="115" height="128" /></td> 
</tr> 
</table> 
<% 
} 
} 
catch(Exception e) 
{ 
out.print(""+e.getMessage()); 
} 
%> 

</table> 
</body> 
</html> 
<pre>0 