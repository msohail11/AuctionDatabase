<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@2.1.1/dist/dark.css">
		
<meta charset="ISO-8859-1">
<title>Create customer rep account</title>
</head>
<body>
		<%
		try{
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			Statement stmt = con.createStatement();
			
			int userid=0;
			boolean exists = false;
			while(!exists){
				userid = (int)Math.floor(Math.random()*(99999999-10000000+1)+10000000);
				String query = "SELECT * FROM app_user where userID="+userid+";";
				ResultSet result=stmt.executeQuery(query);
				if(!result.next()){
					exists=true;
				}
			}
			String username = request.getParameter("username");
			String password = request.getParameter("pwd");
			
			String insert = "INSERT INTO app_user values("+userid+", '"+username+"', '"+password+"', 'help@auction.com');";
			stmt.executeUpdate(insert);
			
			String insert2 = "INSERT INTO customer_rep values("+userid+");";
			stmt.executeUpdate(insert2);
			%>
				<br>
				<form method=post action="admin.jsp"><br>
				<input type="submit" value="Go to homepage">
				</form>
			<%
			
		}
		catch(Exception e){
			out.print(e);
		}
		%>
</body>
</html>