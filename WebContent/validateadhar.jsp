<%@page import="connection.DataCon"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="connection.DataCon" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%
Connection  con=new DataCon().getConnection1();


String adharno=request.getParameter("ano");


PreparedStatement ps=con.prepareStatement("select * from adharvalidation where ano=?");
ps.setString(1, adharno);
ResultSet rs=ps.executeQuery();
if(rs.next()){
	
	response.sendRedirect("register.jsp");
	
}
else{
	
	out.println("not a valid adhar no. pls enter valid adhar no to continue..!!!");
	response.setHeader("refresh", "2;URL=adharform.html");
}


%>
</body>
</html>