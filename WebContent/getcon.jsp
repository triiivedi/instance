<%@ page import="java.sql.*" %> 
<%!Statement st=null; 
Connection con=null; 
%> 
<% 
Class.forName("com.mysql.jdbc.Driver");  
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crime","root","root");


st=con.createStatement(); 
%> 
