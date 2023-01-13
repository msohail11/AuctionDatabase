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
<title>Customer Rep Home</title>
</head>
<body>

<div align = "center">

	<h3>Customer Representative Homepage</h3><br>
	<form method=post action="edit_users.jsp">
	<input type="submit" value="Edit customer account details">
	</form>
	<br><br>
	<form method=post action="edit_bids.jsp">
	<input type="submit" value="Edit bids"><br><br>
	</form><br>
	<form method=post action="edit_auctions.jsp">
	<input type="submit" value="Edit auctions">
	</form>
	<br><br>
	<form method=post action="answer_q.jsp">
	<input type="submit" value="Answer questions">
	</form>
	<br><br>
	<form method="post" action="LoginPage.jsp">
	<input type="submit" value="Logout">
	</form>
	
</div>
</body>
</html>