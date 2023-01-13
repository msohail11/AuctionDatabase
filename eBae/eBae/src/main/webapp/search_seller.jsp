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
<title>Seller history</title>
</head>
<body>
		<br>
		<form method=post action="seller.jsp">
		Enter seller ID:&nbsp;<input type="text" name="userid">
		<br>
		<input type="submit" value="Search">	
		</form>
		
</body>
</html>