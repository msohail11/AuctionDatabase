<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@2.1.1/dist/dark.css">
		
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Login Page</title>
	</head>
	
	<body>
		<h2>Welcome to eBae!</h2>
		<% 
		HttpSession ssn = request.getSession(true);
    	session.setAttribute("logged_in", "false");
		%>
	
	<br>
		<form method="get" action="login.jsp">
		<table>
		<tr>    
		<td>Username</td><td><input type="text" name="username"></td>
		</tr>
		<tr>
		<td>Password</td><td><input type="text" name="password"></td>
		</tr>
		</table>
		<br>
		<input type="submit" value="Login">
		</form>
	<br>
	
	<form method="get" action="RegisterPage.jsp">
	<input type="submit" value="Register">
	</form>
	
	

</body>
</html>