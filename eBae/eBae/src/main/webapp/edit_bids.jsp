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
<title>Edit bids</title>


<style type="text/css">
      @media print {
        table td, table th {
          border: none;
        }
      
      }
    </style>
    
</head>
<body>
		<% 
		try{
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			Statement stmt = con.createStatement();
			
			ResultSet show = stmt.executeQuery("SELECT * FROM bid");
			%>
			<div align = "center">
			<table>
			 	<tr>
			 	<th style="padding:5px">Bid</th>
			 	<th style="padding:5px">Upper limit</th>
			 	<th style="padding:5px">UserID</th>
			 	<th style="padding:5px">ItemID</th>
			 	</tr>
			 </div>
			 
			 	<%
			while(show.next()){
				%>
			
			 <div align = "center">
				<tr>    
					<td style="padding:5px"><%= show.getString("initBid") %></td>
					<td style="padding:5px"><%= show.getString("upperLimit") %></td>
					<td style="padding:5px"><%= show.getString("userID") %></td>
					<td style="padding:5px"><%= show.getString("cID") %></td>
				</tr>
			</div>
			<%

			}
			%>
			<div align = "center">
			</table>
			<br><br>
			<form method=post action="delete_bid.jsp">
			Enter UserID:&nbsp;<input type="text" name="userid"><br><br>
			Enter ItemID:&nbsp;<input type="text" name="cID"><br><br>
			Enter Bid amount:&nbsp;<input type="text" name="amount"><br><br>
			<input type="submit" name="choice" value="Delete bid"><br><br>
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