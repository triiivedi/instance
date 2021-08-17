
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@ page import="connection.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<td width="80%" background="PoliceCrimeBkng.jpg">
</td>
<p>Print This FIR File</p>
<hr>

<button onclick="myFunction()">Print this fir</button>

<script>
function myFunction() {
    window.print();
}
</script>
</center>
<%! 
    static String  crime_nature_id;
    static String  address;
    static String  details;
    static String  FIR_REGISTRATION_DATE;
    static String  VICTIM_ID;
    static String  INVESTIGATION_OFFICER_ID;
    static String  CRIME_DATE;
    static String FIR_NO;
%>
<center>
    <img alt="logo" src="pic1.png" style="width: 1000px;height: 400px">
      
      </center>
<%          ArrayList list=(ArrayList)session.getAttribute("firdata");
            String firno=(String)list.get(0);
            try{
            	Connection con=new DataCon().getConnection1();
            	Statement st=con.createStatement();
  					ResultSet rs=st.executeQuery("select * from victims_fir_master where FIR_NO='"+firno+"'");          	
  					out.println(rs);
  					while(rs.next()){
            		out.println("true");
            		
            		FIR_NO=rs.getString(1);
            		address =rs.getString(2);
            		details =     rs.getString(3);
            		FIR_REGISTRATION_DATE   = rs.getString(4);
            		VICTIM_ID =  rs.getString(5);
            		INVESTIGATION_OFFICER_ID = rs.getString(6);
            		CRIME_DATE = rs.getString(7);
            	}
            	
            }catch(Exception e){
            	
            	System.out.println(e);
            }
 /*
 out.println(list);
 out.println(" ");
out.println(crime_nature_id);
out.println(address);
System.out.println(" ");
out.println(details);
out.println(FIR_REGISTRATION_DATE);
out.println(VICTIM_ID);
out.println(INVESTIGATION_OFFICER_ID);
out.println(CRIME_DATE);*/


%>


<center>
<p> INFORMATION REPORT</p></hr>
</center>
<center>
<br><h6>  <%=list%></h6></br>
<h6>CRIME TYPE   <%=crime_nature_id%></h6><br>
<h6>VICTIM ADDRESS  <%=address%></h6>
<h6> CRIME DETAILS  <%=details%></h6>
<h6>REGISTRATION DATE  <%=FIR_REGISTRATION_DATE%></h6>
<h6>VICTIM D  <%=VICTIM_ID%></h6>
<h6>INVESTIGATION ID  <%=INVESTIGATION_OFFICER_ID%></h6>
<h6>CRIME DATE  <%=CRIME_DATE%></h6></center>
</body>
</html>