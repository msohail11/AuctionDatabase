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
<title>History of transactions</title>
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
				
				String computers_id = request.getParameter("cID");
				try{
					int cID = Integer.parseInt(computers_id);
					String search = "SELECT distinct * FROM bid where cID="+cID+";";
					ResultSet results = stmt.executeQuery(search);
					%>
					<h4>This is the history of bids for the item</h4>
					
					<table>
				 	<tr>
				 	<th style="padding:5px">Bid</th>
				 	<th style="padding:5px">UserID</th>
				 	</tr>
				 	<%
					while(results.next()){
						%>
							<tr>    
								<td style="padding:5px"><%= results.getString("initBid") %></td>
								<td style="padding:5px"><%= results.getString("userID") %></td>
							</tr>
						<%
					}
				 	%>
				 	</table>
				 	
					<br>
					<br>
					<form method="post" action="search.jsp">
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