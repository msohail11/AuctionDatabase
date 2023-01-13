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
<title>Add answer</title>
</head>
<body>
		<% 
			try{
				
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();	
				
				Statement stmt = con.createStatement();
				
				String q_id = request.getParameter("q_id");
				String answer = request.getParameter("answer");
				stmt.executeUpdate("update questions set answer='"+answer+"' where questionID="+q_id+";");
					
	
				%>
				<br><br>
				Question answered successfully<br><br>
				<form method=post action="customer_rep.jsp">
				<input type="submit" value="Go back">
				</form>
				<%
			}
			catch(Exception e){
				out.print(e);
			}
				%>
</body>
</html>