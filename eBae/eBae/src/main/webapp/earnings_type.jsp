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
<title>Earnings by type</title>
</head>
<body>
		<h3>Earnings by type</h3>
		<% 
		try{
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			Statement stmt = con.createStatement();
			
			ResultSet results = stmt.executeQuery("SELECT SUM(final_price) as total, cID from transactions where cID in (select cID from desktops);");
			%>
			<br><br>
			<h4>For desktops:</h4><br><br>
			<table>
			 	<tr>
			 	<th style="padding:5px">Final Price</th>
			 	<th style="padding:5px">ItemID</th>
			 	</tr>
			 	<%
			while(results.next()){
				%>
				<tr>    
					<td style="padding:5px"><%= results.getString("total") %></td>
					<td style="padding:5px"><%= results.getString("cID") %></td>
				</tr>
			<%

			}
			%></table>
			<% 
			ResultSet results2 = stmt.executeQuery("SELECT SUM(final_price) as total, cID from transactions where cID in (select cID from laptops);");
			%>
			<br><br>
			<h4>For laptops:</h4><br><br>
			<table>
			 	<tr>
			 	<th style="padding:5px">Final Price</th>
			 	<th style="padding:5px">ItemID</th>
			 	</tr>
			 	<%
			while(results2.next()){
				%>
				<tr>    
					<td style="padding:5px"><%= results2.getString("total") %></td>
					<td style="padding:5px"><%= results2.getString("cID") %></td>
				</tr>
			<%

			}
			%></table>
			<%
			ResultSet results3 = stmt.executeQuery("SELECT SUM(final_price) as total, cID from transactions where cID in (select cID from tablets);");
			%>
			<br><br>
			<h4>For tablets:</h4><br><br>
			<table>
			 	<tr>
			 	<th style="padding:5px">Final Price</th>
			 	<th style="padding:5px">ItemID</th>
			 	</tr>
			 	<%
			while(results3.next()){
				%>
				<tr>    
					<td style="padding:5px"><%= results3.getString("total") %></td>
					<td style="padding:5px"><%= results3.getString("cID") %></td>
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