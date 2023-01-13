<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.time.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@2.1.1/dist/dark.css">
<meta charset="ISO-8859-1">
<title>Alerts</title>
</head>
<body>
		<% 
		try{
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			Statement stmt = con.createStatement();
			String username = (String)session.getAttribute("username");
			String password = (String)session.getAttribute("pwd");
			
			ResultSet uresult = stmt.executeQuery("SELECT endUserID from end_user where login='"+username+"' and pwd='"+password+"';");
			uresult.next();
			int userid = uresult.getInt(1);
		
			String select = "SELECT * FROM alert where userID="+userid+";";
			ResultSet results = stmt.executeQuery(select);
			while(results.next()){
				%>
				<div align = "center">
				<table>
			 	<tr>
			 	<th style="padding:5px">computers_ID</th>
			 	<th style="padding:5px">User_ID</th>
			 	<th style="padding:5px">Available</th>
			 	</tr>
				<tr>    
					<td style="padding:5px"><%= results.getString("cID") %></td>
					<td style="padding:5px"><%= results.getString("userID") %></td>
					<td style="padding:5px"><%= results.getString("status") %></td>
				</tr>
				</table>
				</div>
				<%
			}
			%>
			<div align = "center">
			<br>
			<form method="post" action="login.jsp">
			<input type="submit" value="Go Back">
			</form>
			<br>
			<br>
			<form method="post" action="delete_alerts.jsp">
			<input type="submit" value="Clear all alerts">
			</form>
			<br>
			<br>
			<form method="post" action="login.jsp">
			<input type="submit" value="Home">
			</form>
			</div>
			<%
		}
		catch(Exception e){
			out.print(e);
		}
		%>
</body>
</html>