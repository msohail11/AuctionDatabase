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
<title>Edit user details</title>
<style type="text/css">
      @media print {
        table td, table th {
          border: none;
        }
      
      }
    </style>
</head>
<body>
		<h3>Registered Users</h3>
		<%
		try{
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			Statement stmt = con.createStatement();
			
			ResultSet show = stmt.executeQuery("SELECT * FROM end_user");
			%>
			
			<div align = "center">
			<table>
			 	<tr>
			 	<th style="padding:5px">UserID</th>
			 	<th style="padding:5px">Login</th>
			 	<th style="padding:5px">Password</th>
			 	<th style="padding:5px">Email</th>
			 	<th style="padding:5px">Bank A/C</th>
			 	<th style="padding:5px">Balance</th>
			 	</tr>
			 </div>
			 
			 	<%
			while(show.next()){
				%>
			
			<div align = "center">
				<tr>    
					<td style="padding:5px"><%= show.getString("endUserID") %></td>
					<td style="padding:5px"><%= show.getString("login") %></td>
					<td style="padding:5px"><%= show.getString("pwd") %></td>
					<td style="padding:5px"><%= show.getString("email") %></td>
					<td style="padding:5px"><%= show.getString("bankac") %></td>
					<td style="padding:5px"><%= show.getString("balance") %></td>
				</tr>
			</div>
			
			<%

			}
			%>
			
			</table>
			<br><br>
			<div align = "center">
		
			<form method=post action="change_user.jsp">
			Enter UserID:&nbsp;<input type="text" name="userid"><br><br>
			<input type="submit" name="choice" value="Edit"><br><br>
			<input type="submit" name="choice" value="Delete"><br><br>

			</form>
				
			<form method=post action="customer_rep.jsp">
			<input type="submit" value="Customer Rep Home"> </form>
			
			</div>
			
			<%
			
		}
		catch(Exception e){
			out.print(e);
		}
		%>
</body>
</html>