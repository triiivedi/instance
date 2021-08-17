package connection;

import java.sql.*;
import java.io.*;

public class DataCon {
public DataCon(){
	
	
}

  Connection con;
  
 public Connection getConnection1()
{
   try
 {
	   Class.forName("com.mysql.jdbc.Driver");  
	  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crime","root","root");
       System.out.println("Connection connet Sucessfully");
}
catch(Exception e)
{
   e.toString();
}
return con;

}
public void close(Connection con)
	{
	  try{
		   con.close();
	  }catch(Exception e1)
		{}
	}

public static void main(String args[]){
	
	System.out.println(new DataCon().getConnection1());;
}
}