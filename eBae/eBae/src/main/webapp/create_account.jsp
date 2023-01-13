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
<title>Create accoun</title>
</head>
<body>
		<form method=post action="cr_account.jsp">
		Username:&nbsp;<input type="text" name="username"><br><br>
		Password:&nbsp;<input type="text" name="pwd"><br><br>
		<input type="submit" value="Create account">
		</form>
</body>
</html>