<html>
<body bgcolor="#CCFFFF">
<%@  page language="java"  import="java.sql.*"  %>
<%@ page   import="java.io.*"  %>
<%! Statement st=null; %>
<%! Connection con=null; %>
<%@ page import="connection.*" %>
<%
	ResultSet rs=null;
    DataCon ds = new DataCon();
	
 	String a=request.getParameter("D1");
	String b=request.getParameter("cdate");
	String c=request.getParameter("cdetails");
	String d=request.getParameter("D2");
	String e=request.getParameter("court");
	String f=request.getParameter("by");
	
		
		try
		{
 
           con = ds.getConnection1();
			PreparedStatement stat=con.prepareStatement("INSERT INTO CRIME_CHARGESHEET_MASTER values(?,?,?,?,?,?)");
			stat.setString(1,a);
			stat.setString(2,b);
			stat.setString(3,c);
            stat.setString(4,d);
			stat.setString(5,e);
			stat.setString(6,f);
			stat.executeUpdate(); 

           response.sendRedirect("crime_chargesheet_master.jsp");
		}
		catch(Exception E)
		{
			out.println("Error inserting value"+E);
		}	
		finally
		{
			con.close();
		}
		
		
%>
</body>
</html>