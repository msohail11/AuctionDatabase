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
<title>Earnings by item</title>
</head>
<body>
		<h3>Earnings per item</h3>
		<% 
		try{
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			Statement stmt = con.createStatement();
			
			ResultSet results = stmt.executeQuery("SELECT final_price, cID from transactions group by cID;");
			%>
			<table>
			 	<tr>
			 	<th style="padding:5px">Final Price</th>
			 	<th style="padding:5px">ItemID</th>
			 	</tr>
			 	<%
			while(results.next()){
				%>
				<tr>    
					<td style="padding:5px"><%= results.getString("final_price") %></td>
					<td style="padding:5px"><%= results.getString("cID") %></td>
				</tr>
			<%

			}
			%></table>
			<br><br>
			<form method=post action="admin.jsp"><br><br>
			<input type="submit" value="Go back"><br><br>
			</form>
			<%
		}
		catch(Exception e){
			out.print(e);
		}
		%>
</body>
</html>