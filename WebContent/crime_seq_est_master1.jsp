<html>
<%@ page  import="java.sql.*"%>
<%@ page  import="java.io.*"%>
<%@ page  import="connection.*"%>
<%! String c1;%>
<%! int c2;%>
<head>
<script>
function func_sub()
{

      cse_form.action="crime_seq_insert1.jsp";
      cse_form.method="post";
      cse_form.submit();

}
</script>
</script>
<meta name="Microsoft Theme" content="none">
</head>
<body bgcolor=aliceblue leftmargin=0 topmargin=0>
   <table border="0" width="80%">
    <div align="center">
    <center>
      <tr>
        <td width="100%"><img src="policecrime.jpg" width="100%" height="60"><br>
        <%@ include file = "header3.htm"%></td>
      </tr>
      <tr>
        <td width="100%">
          <div align="center">
            <table border="0" width="100%" height="129">
              <tr>
                <td width="20%" height="125"><marquee direction="down"><img src="p1.jpg" width="150" height="80"><BR><BR><BR><img src="p2.jpg" width="150" height="80"><BR><BR><BR><img src="p3.jpg" width="150" height="80"><BR><BR><BR><img src="p4.jpg" width="150" height="80"><BR><BR><BR><img src="p5.jpg" width="150" height="80"></marquee></td>
                <td width="80%" height="125">
                 <table border="0" width="368" height="225">
   <form name="cse_form">
   <tr align="center">
   <td colspan=4 width="360" height="70">
    <p align="center"><font color="#996633" size="4"></font><font size="5">




Crime Sequence Estimation Master</font></p>
  <p align="center">&nbsp;</p>
  </td>
  </tr>
  <tr>
    
    <td width="404" align="right"><b><font face="Verdana" size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sequence
      ID</font></b></td>
    <td width="304">
	<select size="1" name="D1" style="WIDTH:144 PX">
 <%
         DataCon ds = new DataCon();
		Connection con=null;
		Statement st=null;
	 	ResultSet rs=null;
		String firid=null;
							  	 
 try{
	 
	con = ds.getConnection1(); 
	st=con.createStatement();
	rs=st.executeQuery("select max(SEQUENCE_ID) from CIRME_SEQ_ESTIMATION_MASTER");
	System.out.println("rs:"+rs);
	int id=0;
	
	while(rs.next())
	 {     
		firid=rs.getString(1);
		System.out.println("inside while");
			 if(firid==null) 
			{	 
				 		System.out.println("inside if");

				 firid="SEQ101";
					 %><option value="<%=firid%>"><%=firid%></option>
		        	<%
			 }
	
		 else{
			 		System.out.println("inside else");
					   firid=rs.getString(1);
					   String str=firid.substring(3,6);
					   int x=Integer.parseInt(str);
					   x++;
                      
					   firid="SEQ"+x;; %>
				   <option value="<%=firid%>"><%=firid%></option>
				<%}
		 }
 
}catch(Exception e){}
rs.close();
 

%>
     </select></td>
  </tr>
  <tr>
    <td width="404" align="right"><b><font face="Verdana" size="2">&nbsp;&nbsp;&nbsp;
      FIR
      NO</font></b></td>
    <td width="304"><select size="1" name="D2" style="WIDTH:144 PX">
	<%
       
	 	ResultSet rs1=null;
		String nid=null;
						  	 
 try{
	 
	 
	rs1=st.executeQuery("select * from VICTIMS_FIR_MASTER");
	System.out.println("rs:"+rs);
	int id=0;
	
	while(rs1.next())
	 {     
		nid=rs1.getString(1);
		System.out.println("inside while");
		%>
			 
				   <option value="<%=nid%>"><%=nid%></option>
					    
				<%}
	 
 
}catch(Exception e){}
rs1.close();
 

%>
      </select></td>
  </tr>
  
  <tr>
    <td width="404" align="right"><b><font face="Verdana" size="2">Description</font></b></td>
    <td width="304"><input type="text" name="T1" size="20" tabindex="4"></td>
  
    </tr>
   </form>
  <tr>
    <td colspan=4 width="370" align="center">

	  <input type=button value="Insert" name="submit" onClick="func_sub()" class=bu tabindex="4"> 
	
      </td>
  </tr>
  </table>
    </td>
    </tr>
    </center>
  </div>
 
  </table>
 </body>
</html>



