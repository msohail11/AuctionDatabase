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
<title>Buyer</title>
<style type="text/css">
      * {
        padding: 5px;
        margin: 0;
      }
      body {
        font-family: arial, helvetica, sans-serif;
      }
      table {
        border-collapse: collapse;
        margin: 10px;
      }
      table td, table th {
        border: 1px solid black;
      }
      @media print {
        table td, table th {
          border: none;
        }
        body {
          font-family: serif;
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
				
				String buyer_id = request.getParameter("userid");
				try{
					int userid = Integer.parseInt(buyer_id);
					String search = "SELECT a.maxBid as Bid, a.cID as ItemID, a.closing as Closing from auction a join bid b on a.cID=b.cID where b.userID="+userid+";";
					ResultSet results = stmt.executeQuery(search);
					%>
					<h4>This is the history of bids for this buyer</h4>
					
					<table>
				 	<tr>
				 	<th style="padding:5px">Bid</th>
				 	<th style="padding:5px">UserID</th>
				 	<th style="padding:5px">Closing</th>
				 	</tr>
				 	<%
					while(results.next()){
						%>
							<tr>    
								<td style="padding:5px"><%= results.getString("Bid") %></td>
								<td style="padding:5px"><%= results.getString("ItemID") %></td>
								<td style="padding:5px"><%= results.getString("Closing") %></td>
							</tr>
						<%
					}
				 	%>
				 	</table>
				 	
					<br>
					<br>
					<form method="post" action="search_buyer.jsp">
					<input type="submit" value="Go Back">
					</form>
					<br>
					<%
				}
				catch(NumberFormatException e){
					out.print("Invalid input for item id. Try again.");
					
					%>
					<br>
					<form method="post" action="search.jsp">
					<input type="submit" value="Go Back">
					</form>
					<br>
					<%
				}
			}
			catch(Exception e){
				out.print(e);
			}
			%>
</body>
</html>