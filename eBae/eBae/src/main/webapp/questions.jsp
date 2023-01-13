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
<title>Ask a question</title>
</head>
<body>
		<h4>Ask your question below</h4><br>
		<form method=post action="create_q.jsp">
		<input type="text" name="question">
		<br><br>
		<input type="submit" value="Submit question">
		</form>
</body>
</html>