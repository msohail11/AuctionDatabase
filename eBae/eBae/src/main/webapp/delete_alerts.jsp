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
<title>Dismiss alerts</title>
</head>
<body>
		<% 
		try{
			String user_id = (String)session.getAttribute("userid_att");
			//out.print(user_id);
			int userid = Integer.parseInt(user_id);
			
			String delete = "DELETE FROM alert where userID="+userid+";";
			out.print("All alerts have been cleared now.");
			%>
			<br>
			<form method="post" action="login.jsp">
			<input type="submit" value="Go Back">
			</form>
			<br>
			<%
		}
		catch(Exception e){
			out.print(e);
		}
		%>
</body>
</html>