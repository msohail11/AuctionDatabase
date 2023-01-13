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
<title>Admin Homepage</title>
</head>
<body>
	
<div align = "center">
	<h3>Admin Homepage</h3><br><br>
	<form method=post action="create_account.jsp">
	<input type="submit" value="Create Customer Rep Account"><br><br>
	</form><br>
	<form method=post action="total_earnings.jsp">
	<input type="submit" value="Sales Report of total earnings">
	</form>
	<br><br>
	<form method=post action="earnings_item.jsp">
	<input type="submit" value="Sales Report of earnings per item">
	</form>
	<br><br>
	<form method=post action="earnings_type.jsp">
	<input type="submit" value="Sales Report of earnings by type">
	</form>
	<br><br>
	<form method=post action="earnings_user.jsp">
	<input type="submit" value="Sales Report of earnings per user">
	</form>
	<br><br>
	<form method=post action="best_items.jsp">
	<input type="submit" value="Sales Report by best-selling items">
	</form>
	<br><br>
	<form method=post action="best_buyers.jsp">
	<input type="submit" value="Sales Report by best buyers">
	</form>
	<br><br>
	<form method="post" action="LoginPage.jsp">
	<input type="submit" value="Logout">
	</form>
</div>
	
</body>
</html>