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
<title>Create bid</title>
</head>
<body>
		<br>	
			<div align = "center">
				<h4>Select type:</h4> <br>
				<form method="post" action="bid_desktops.jsp">
				<input type="submit" value="desktops">
				</form>
				
				<br>
				<form method="post" action="bid_laptops.jsp">
				<input type="submit" value="laptops">
				</form>
				
				<br>
				<form method="post" action="bid_tablets.jsp">
				<input type="submit" value="tablets">
				</form>
				<br>
				<br>
				
				<form method="post" action="login.jsp">
				<input type="submit" value="Home">
		</form>
			</div>
				
				

</body>
</html>