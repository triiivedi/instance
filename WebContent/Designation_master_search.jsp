<html>
<%@ page  import="java.sql.*"%>
<%@ page  import="java.io.*"%>
<%@ page  import="connection.*"%>
<%! String c1;%>
<%! int c2;%>
<head>
 <title>New Page 1</title>
 <meta name="Microsoft Theme" content="none">
</head>
<body bgcolor=aliceblue leftmargin=0 topmargin=0>
 <form method="POST" action="Designation_master_searchresult.jsp">
   <table border="0" width="80%">
      <tr>
        <td width="100%"><img src="policecrime.jpg" width="100%" height="60"><br>
        <%@ include file = "header.htm"%></td>
      </tr>
	  <tr>
         <td>   
            <table border="0" width="100%" height="129">
              <tr>
                <td width="20%" height="125"><marquee direction="down"><img src="p1.jpg" width="150" height="80"><BR><BR><BR><img src="p2.jpg" width="150" height="80"><BR><BR><BR><img src="p3.jpg" width="150" height="80"><BR><BR><BR><img src="p4.jpg" width="150" height="80"><BR><BR><BR><img src="p5.jpg" width="150" height="80"></marquee></td>
              <td width="80%" height="125">
              <table border="0" width="368" height="225">
   
   <tr align="center">
   <td colspan=4 width="360" height="70">
    <p align="center"><b><font face="Verdana" size="4"> Designation Master
     </font></b></td>
	 </tr>
    <tr>
     <td width="25%" align="right"><b>
             <font size="3">
	         Designation ID</font>
        </b></td>
      <td width="25%" align="left">
	  <select size="1" name="a">
	   <%
         DataCon ds =  new DataCon();
		Connection con=null;
		Statement st=null;
	 	ResultSet rs=null;

					  	 
 try{
	con = ds.getConnection1(); 
	st=con.createStatement();
	rs=st.executeQuery("select * from DESIGNATION_MASTER");
	while(rs.next())
	 {
		c1=rs.getString(1);
		%>
		       <option value="<%=c1%>"><%=c1%></option>
				<%}
	%>
<%
}catch(Exception e){}
con.close();
%>
</select>
</td>
</tr>
<tr align="center">
<td colspan=4>
  <input type="submit" value="view" name="submit">
</td>
</tr>
<table>
</td>
</tr>
</table>
  </form>
 </body>
</html>

