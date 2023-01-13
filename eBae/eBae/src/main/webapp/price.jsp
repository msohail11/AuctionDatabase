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
<title>Price</title>
</head>
<body>
		<h4>Enter the price limits below:</h4>
			<% 
				HttpSession temp_session = request.getSession();
	        	session.setAttribute("search", "price");
			%>
		<form method=post action="browse.jsp">
		Lower limit:&nbsp;<input type="text" name="lower">
		<br><br>
		Upper limit:&nbsp;<input type="text" name="upper">
		<br><br>
		<input type="submit" value="Search">
		</form>
		
</body>
</html>