<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.*"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@2.1.1/dist/dark.css">
		
<meta charset="ISO-8859-1">
<title>Auctions</title>
</head>
<body>

	<div align = "center">				
				<br></div>
				<form method="post" action="auction_desktops.jsp">
				<input type="submit" value="desktops">
				</form>
				<br>
				
				<br>
				<form method="post" action="auction_laptops.jsp">
				<input type="submit" value="laptops">
				</form>
				<br>
				
				<br>
				<form method="post" action="auction_tablets.jsp">
				<input type="submit" value="tablets">
				</form>
				
				<br>

				<form method="post" action="login.jsp">
				<input type="submit" value="Home">
				
		</div>
				
</body>
</html>