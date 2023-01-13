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
<title>Search</title>
</head>
<body>
	
	<div align = "center">
		<h4> Select an option:</h4>
		<br>
		<form method=post action="setup_bid.jsp">
		<input type="submit" value="By type">
		</form>
		<br>
		<br>
		<form method=post action="price.jsp">
		<input type="submit" value="By price">
		</form>
		<br>
		<br>
		<form method="post" action="login.jsp">
			<input type="submit" value="Home">
		</form>
	</div>
</body>
</html>