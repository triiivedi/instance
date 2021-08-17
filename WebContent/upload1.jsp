<%@ page import="com.oreilly.servlet.MultipartRequest" %>  
<%  
String path=new java.net.URL(request.getScheme(),request.getServerName(),request.getServerPort(),request.getContextPath()).toString();
String path1=config.getServletContext().getRealPath("vimages");
//String upath=path1+"/vimages";
//System.out.println(upath);
MultipartRequest m = new MultipartRequest(request,path1);  
out.print("successfully uploaded");  



  
%>
<div>
<img alt="" src="vimages/mobile.png">

</div>  