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
<title>Delete bids</title>
</head>
<body>
		<% 
		try{
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			Statement stmt = con.createStatement();
			
			String cID = request.getParameter("cID");
			String userid = request.getParameter("userid");
			String bid = request.getParameter("amount");
			
			stmt.executeUpdate("delete from bid where userid="+Integer.parseInt(userid)+" and initBid="+Double.parseDouble(bid)+" and cID="+Integer.parseInt(cID)+";");
			%>
			<br>
			<h4>Bid successfully deleted!</h4>
			<form method=post action="customer_rep.jsp"><br><br>
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