<%@ page  import="java.sql.*"%>
<%@ page  import="java.io.*"%>
<%@ page  import="connection.*"%>
<%! String c1;%>
<%! int c2;%>
<html>
<head>
<script language="JavaScript" src="header.js">
</script>
<script>
function validateAll() 
{
  var name =  document.forms[0].name .value;
  var hno = document.forms[0].hno.value;
  var city = document.forms[0].city.value;
  var state = document.forms[0].state.value;
  var country = document.forms[0].country.value;
  var pin = document.forms[0].pin .value;
  var phone = document.forms[0].phone .value;
  var email = document.forms[0].email .value;
  if(isEmpty(name  )) 
 {
   alert("Please type  victim name.");
   document.forms[0]. name .focus();
   return false;
 } 
else if(!isAlpha(name)) 
{
  alert("victim name contains invalid characters. Please re-enter.");
  document.forms[0].name.focus();
  return false;
}
 if(isEmpty(hno)) 
 {
   alert("Please type  flat no.");
   document.forms[0]. hno .focus();
   return false;
 } 
 if(isEmpty(city )) 
 {
   alert("Please type  city.");
   document.forms[0]. city .focus();
   return false;
 } 
else if(!isAlpha(city)) 
{
  alert("city name contains invalid characters. Please re-enter.");
  document.forms[0].city.focus();
  return false;
}
 if(isEmpty(state )) 
 {
   alert("Please type  state.");
   document.forms[0]. state .focus();
   return false;
 } 
else if(!isAlpha(state)) 
{
  alert("state name contains invalid characters. Please re-enter.");
  document.forms[0].state.focus();
  return false;
}
 if(isEmpty(country )) 
 {
   alert("Please type country.");
   document.forms[0]. country .focus();
   return false;
 } 
else if(!isAlpha(country)) 
{
  alert("Country name contains invalid characters. Please re-enter.");
  document.forms[0].country.focus();
  return false;
}
else if(isEmpty(pin))
    {
	    alert("Please type  pin.");
	    document.forms[0].pin.focus();
	    return false;
    } 
 else  if(!isPosIntegercheck(pin))
	{
       alert("Enter valid 6 characters in Zip Code. Please re-enter.");
      document.forms[0].pin .focus();
       return false;
	}
   else if(isEmpty(phone))
    {
	    alert("Please type  phone.");
	    document.forms[0].phone.focus();
	    return false;
    } 
	
	else if(isEmpty(email))
    {
	    alert("Please type  e-mail address.");
	    document.forms[0].email.focus();
	    return false;
    } 
	return true;
}
function func_sub()
{
	if(validateAll())
	{
 eve_form.action="dregister.jsp";
  eve_form.method="post";
  eve_form.submit();
}
}
</script>
</head>
<body bgcolor=aliceblue leftmargin=0 topmargin=0>
   <table border="0" width="80%">
    <div align="center">
    <center>
      <tr>
        <td width="100%"><img src="policecrime1.jpg" width="1340" height="150"><br>
        
            </tr>
			<tr>
        <td width="100%">
          <div align="center">
            <table border="0" width="100%" height="129">
              <tr>
                <td width="20%" height="125"><marquee direction="down"><img src="p1.jpg" width="150" height="80"><BR><BR><BR><img src="p2.jpg" width="150" height="80"><BR><BR><BR><img src="p3.jpg" width="150" height="80"><BR><BR><BR><img src="p4.jpg" width="150" height="80"><BR><BR><BR><img src="p5.jpg" width="150" height="80"></marquee></td>
                <td width="80%" height="125">
                <table border="0" width="368" height="225">
				</td>
				</tr>
   <form name="eve_form">
   <tr align="center">
   <td colspan=4 width="360" height="70">
    <p align="center"><font color="#996633" size="4"></font><font size="5">

Register Form&nbsp;</font></p>
 <p align="right">
 <font color="#996633" size="5">&nbsp;</font></p>
 </td>
 </tr>
  <tr>
    <td width="166" align="right" height="25"><b>
	<font face="Verdana" color="#000000" size="2">Victim
          ID</font></b></td>
        <td width="171"><font size="2" face="Verdana" color="#000000"><b>
		<select size="1" name="D1" style="WIDTH:144 PX">
         <%
         DataCon ds = new DataCon();
		Connection con=null;
		Statement st=null;
	 	ResultSet rs=null;
		String evid=null;
							  	 
 try{
	 
	con = ds.getConnection1(); 
	st=con.createStatement();
	rs=st.executeQuery("select max(VICTIM_ID) from VICTIMES_MASTER");
	System.out.println("rs:"+rs);
	int id=0;
	
	while(rs.next())
	 {     
		evid=rs.getString(1);
		System.out.println("inside while");
			 if(evid==null) 
			{	 
				 		System.out.println("inside if");

				 evid="VC101";
				 session.setAttribute("ivid", evid);
					 %><option value="<%=evid%>"><%=evid%></option>
		        	<%
			 }
	
		 else{
			 		System.out.println("inside else");
					   evid=rs.getString(1);
					   String str=evid.substring(2,5);
					   int x=Integer.parseInt(str);
					   x++;
                      
					   evid="VC"+x;; %>
				   <option value="<%=evid%>"><%=evid%></option>
				<%}
		 }


%>
<%
}catch(Exception e){}
rs.close();
st.close();
con.close();

%>

         </select></b></font></td>
        <td width="113" align="right"><font size="2" face="Verdana" color="#000000"><b>Country</b></font></td>
        <td width="149"><input type="text" name="country" size="20"></td>
      </tr>
      <tr>
        <td width="166" align="right"><font size="2" face="Verdana" color="#000000"><b>Victim
          Name</b></font></td>
        <td width="171"><font size="2" face="Verdana" color="#000000"><b><input type="text" name="name" size="20"></b></font></td>
        <td width="113" align="right"><font size="2" face="Verdana" color="#000000"><b>Pin</b></font></td>
        <td width="149"><input type="text" name="pin" size="20"></td>
      </tr>
      <tr>
        <td width="166" align="right"><font size="2" face="Verdana" color="#000000"><b>Flat
          No</b></font></td>
        <td width="171">
		<font size="2" face="Verdana" color="#000000"><b>
		<input type="text" name="hno" size="20"></b></font>
		</td>
        <td width="113" align="right"><font size="2" face="Verdana" color="#000000"><b>Phone</b></font></td>
        <td width="149"><input type="text" name="phone" size="20"></td>
      </tr>
      <tr>
        <td width="166" align="right"><font size="2" face="Verdana" color="#000000"><b>Street</b></font></td>
        <td width="171"><font size="2" face="Verdana" color="#000000"><b><input type="text" name="street"    size="20"></b></font></td>
        <td width="113" align="right"><font size="2" face="Verdana" color="#000000"><b>Date
          of birth</b></font></td>
        <td width="149">
		<input type="date" date-date-inline-picker="true" name="date" value="" size="20"></td>
      </tr>
      <tr>
        <td width="166" align="right">
        <p align="right"><font size="2" face="Verdana" color="#000000"><b>City</b></font></td>
        <center>
        <td width="171">
		<input type="text" name="city" size="20"></td>
        <td width="113" align="right"><font color="#000000"><b>Email ID</b></font>&nbsp;</td>
        <td width="149">
        <input type="text" name="email" size="20"></td>
      </tr>
      <tr>
        <td width="166" align="right"><font size="2" face="Verdana" color="#000000"><b>State </b></font></td>
        <td width="171"><input type="text" name="state" size="20"></td>
        <td width="113" align="right"><font size="2" face="Verdana" color="#000000"><b>&nbsp;Other Details</b></font></td>
        <td width="149">
        <textarea rows="2" name="other" cols="16"></textarea></td>
    </tr>
      <tr>
        <td width="166" align="right"><b><font face="Verdana" size="2" color="#000000">Registration
          Date</font></b></td>
        <td width="171"><input type="date" date-date-inline-picker="true" name="rdate" value="" size="20"></td>
        <td width="113" align="right"></td>
        <td width="149">
        </td>
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
