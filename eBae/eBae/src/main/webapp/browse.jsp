<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.time.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@2.1.1/dist/dark.css">
		
<meta charset="ISO-8859-1">
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
<title>Insert title here</title>
</head>
<body>

		<% 
			try{
				
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();	
				
				Statement stmt = con.createStatement();
				
				//HttpSession temp_session = request.getSession();
				
				String search = (String)session.getAttribute("search");
				String username = (String)session.getAttribute("username");
				String password = (String)session.getAttribute("pwd");
				
				if(search.equals("desktops")){
					String size = request.getParameter("size");
					String desktoptype = request.getParameter("desktoptype");
					String ram  = request.getParameter("ram");
					
					String query = "select s.desktopsID, c.descript as Description, c.compname as Name, c.quantity, a.maxBid as Current_Bid, a.closing, a.userID as SellerID from desktops s join computers c on s.desktopsID=c.cID join auction a on c.cID = a.cID where s.size='"+size+"' and s.type='"+desktoptype+"' and s.ram='"+ram+"';";	
					ResultSet results = stmt.executeQuery(query);
					%>
					<h4>We have these products available</h4>
					<table>
					 	<tr>
					 	<th style="padding:5px">desktopsID</th>
					 	<th style="padding:5px">Description</th>
					 	<th style="padding:5px">Name</th>
					 	<th style="padding:5px">Quantity</th>
					 	<th style="padding:5px">Current_Bid</th>
					 	<th style="padding:5px">Closing D/T</th>
					 	<th style="padding:5px">SellerID</th>
					 	</tr>
					 	<%
						while(results.next()){
							%>
								<tr>    
									<td style="padding:5px"><%= results.getString("desktopsID") %></td>
									<td style="padding:5px"><%= results.getString("Description") %></td>
									<td style="padding:5px"><%= results.getString("Name") %></td>
									<td style="padding:5px"><%= results.getString("quantity") %></td>
									<td style="padding:5px"><%= results.getString("Current_Bid") %></td>
									<td style="padding:5px"><%= results.getString("closing") %></td>
									<td style="padding:5px"><%= results.getString("SellerID") %></td>
								</tr>
							<%

							
						}
						%>
					 </table>
					<br>
					<br>
					<form method="post" action="login.jsp">
					<input type="submit" value="Go Back">
					</form>
					<br>
					<%
				}
				else if(search.equals("laptops")){
					try{
						String size = request.getParameter("size");
						int size_val=Integer.parseInt(size);
						String laptoptype = request.getParameter("laptoptype");
						
						String query="select p.laptopsID, c.descript as Description, c.compname as Name, c.quantity, a.maxBid as Current_Bid, a.closing, a.userID as SellerID from laptops p join computers c on p.laptopsID=c.cID join auction a on c.cID = a.cID where p.size="+size_val+" and p.laptoptype='"+laptoptype+"';";
						ResultSet results = stmt.executeQuery(query);
						%>
						<h4>We have these products available</h4>
						
						<table>
					 	<tr>
					 	<th style="padding:5px">laptopsID</th>
					 	<th style="padding:5px">Description</th>
					 	<th style="padding:5px">Name</th>
					 	<th style="padding:5px">Quantity</th>
					 	<th style="padding:5px">Current_Bid</th>
					 	<th style="padding:5px">Closing D/T</th>
					 	<th style="padding:5px">SellerID</th>
					 	</tr>
					 	<%
						while(results.next()){
							%>
								<tr>    
									<td style="padding:5px"><%= results.getString("laptopsID") %></td>
									<td style="padding:5px"><%= results.getString("Description") %></td>
									<td style="padding:5px"><%= results.getString("Name") %></td>
									<td style="padding:5px"><%= results.getString("quantity") %></td>
									<td style="padding:5px"><%= results.getString("Current_Bid") %></td>
									<td style="padding:5px"><%= results.getString("closing") %></td>
									<td style="padding:5px"><%= results.getString("SellerID") %></td>
								</tr>
							<%

							
						}
						%>
					 	</table>
						<br>
						<br>
						<form method="post" action="login.jsp">
						<input type="submit" value="Go Back">
						</form>
						<br>
						<%
					}
					catch (NumberFormatException e){
						out.print(e);
						
						%>
						<br>
						<br>
						<form method="post" action="bid_laptops.jsp">
						<input type="submit" value="Go Back">
						</form>
						<br>
						<%
					}
				}
				else if(search.equals("tablets")){
					String size_str = request.getParameter("size");
					String type  = request.getParameter("type");
					try{
						double size = Double.parseDouble(size_str);
						String query = "select s.tabletsID, c.descript as Description, c.compname as Name, c.quantity, a.maxBid as Current_Bid, a.closing, a.userID as SellerID from tablets s join computers c on s.tabletsID=c.cID join auction a on c.cID = a.cID where s.size="+size+" and s.type='"+type+"';";
						ResultSet results = stmt.executeQuery(query);
						%>
						<h4>We have these products available</h4>
						
						<table>
					 	<tr>
					 	<th style="padding:5px">tabletsID</th>
					 	<th style="padding:5px">Description</th>
					 	<th style="padding:5px">Name</th>
					 	<th style="padding:5px">Quantity</th>
					 	<th style="padding:5px">Current_Bid</th>
					 	<th style="padding:5px">Closing D/T</th>
					 	<th style="padding:5px">SellerID</th>
					 	</tr>
					 	<%
						while(results.next()){
							%>
								<tr>    
									<td style="padding:5px"><%= results.getString("tabletsID") %></td>
									<td style="padding:5px"><%= results.getString("Description") %></td>
									<td style="padding:5px"><%= results.getString("Name") %></td>
									<td style="padding:5px"><%= results.getString("quantity") %></td>
									<td style="padding:5px"><%= results.getString("Current_Bid") %></td>
									<td style="padding:5px"><%= results.getString("closing") %></td>
									<td style="padding:5px"><%= results.getString("SellerID") %></td>
								</tr>
							<%

							
						}
						%>
					 	</table>
						<br>
						<br>
						<form method="post" action="login.jsp">
						<input type="submit" value="Go Back">
						</form>
						<br>
						<%
					}
					catch (NumberFormatException e){
						out.print("Invalid input for tablet size");
						
						%>
						<br>
						<br>
						<form method="post" action="bid_tablets.jsp">
						<input type="submit" value="Go Back">
						</form>
						<br>
						<%
						
					}
				}
				else if(search.equals("price")){
					String lower_str = request.getParameter("lower");
					String upper_str = request.getParameter("upper");
					try{
						double lower = Double.parseDouble(lower_str);
						double upper = Double.parseDouble(upper_str);
						String query1 = "select s.desktopsID as ItemID, c.descript as Description, c.compname as Name, c.quantity, a.maxBid as Current_Bid, a.closing, a.userID as SellerID from desktops s join computers c on s.desktopsID=c.cID join auction a on c.cID = a.cID where maxBid<="+upper+" and maxBid>="+lower+";";	
						String query2 = "select p.laptopsID as ItemID, c.descript as Description, c.compname as Name, c.quantity, a.maxBid as Current_Bid, a.closing, a.userID as SellerID from laptops p join computers c on p.laptopsID=c.cID join auction a on c.cID = a.cID where maxBid<="+upper+" and maxBid>="+lower+";";
						String query3 = "select s.tabletsID as ItemID, c.descript as Description, c.compname as Name, c.quantity, a.maxBid as Current_Bid, a.closing, a.userID as SellerID from tablets s join computers c on s.tabletsID=c.cID join auction a on c.cID = a.cID where maxBid<="+upper+" and maxBid>="+lower+";";
						
						ResultSet results1 = stmt.executeQuery(query1);
						
					
						
						%>
						<h4>We have these products available</h4>
						<table>
					 	<tr>
					 	<th style="padding:5px">ItemID</th>
					 	<th style="padding:5px">Description</th>
					 	<th style="padding:5px">Name</th>
					 	<th style="padding:5px">Quantity</th>
					 	<th style="padding:5px">Current_Bid</th>
					 	<th style="padding:5px">Closing D/T</th>
					 	<th style="padding:5px">SellerID</th>
					 	</tr>
					 	<%
						while(results1.next()){
							%>
								<tr>    
									<td style="padding:5px"><%= results1.getString("ItemID") %></td>
									<td style="padding:5px"><%= results1.getString("Description") %></td>
									<td style="padding:5px"><%= results1.getString("Name") %></td>
									<td style="padding:5px"><%= results1.getString("quantity") %></td>
									<td style="padding:5px"><%= results1.getString("Current_Bid") %></td>
									<td style="padding:5px"><%= results1.getString("closing") %></td>
									<td style="padding:5px"><%= results1.getString("SellerID") %></td>
								</tr>
							<%	
						}
					 	ResultSet results2 = stmt.executeQuery(query2);
					 	while(results2.next()){
							%>
								<tr>    
									<td style="padding:5px"><%= results2.getString("ItemID") %></td>
									<td style="padding:5px"><%= results2.getString("Description") %></td>
									<td style="padding:5px"><%= results2.getString("Name") %></td>
									<td style="padding:5px"><%= results2.getString("quantity") %></td>
									<td style="padding:5px"><%= results2.getString("Current_Bid") %></td>
									<td style="padding:5px"><%= results2.getString("closing") %></td>
									<td style="padding:5px"><%= results2.getString("SellerID") %></td>
								</tr>
							<%	
						}
						ResultSet results3 = stmt.executeQuery(query3);
					 	while(results3.next()){
							%>
								<tr>    
									<td style="padding:5px"><%= results3.getString("ItemID") %></td>
									<td style="padding:5px"><%= results3.getString("Description") %></td>
									<td style="padding:5px"><%= results3.getString("Name") %></td>
									<td style="padding:5px"><%= results3.getString("quantity") %></td>
									<td style="padding:5px"><%= results3.getString("Current_Bid") %></td>
									<td style="padding:5px"><%= results3.getString("closing") %></td>
									<td style="padding:5px"><%= results3.getString("SellerID") %></td>
								</tr>
							<%	
						}
						%>
					 	</table>
					 	<br>
						<br>
						<form method="post" action="login.jsp">
						<input type="submit" value="Go Back">
						</form>
						<br>
						<%
					}
					catch(NumberFormatException e){
						out.print("Invalid input for limits. Try again.");
						
						%>
						<br>
						<br>
						<form method="post" action="price.jsp">
						<input type="submit" value="Go Back">
						</form>
						<br>
						<%
					}
				}
				
				
				%>
				<br>
				
				<h3>Do you want to view the history of an item?</h3>
				<form method=post action="history.jsp">
				ItemID:&nbsp;<input type="text" name="cID">
				<br>
				<br>
				<input type="submit" value="View history">
				</form>
				
				
				<br><h3>Interested in making a bid?</h3><br>
				Enter the following details:<br><br>
				<form method="post" action="create_bid.jsp">
				<%if(search.equals("desktops")){ 
					out.print("desktopsID: "); 
					}
				   else if(search.equals("laptops")){
					   out.print("laptopsID: ");
				   }
				   else if(search.equals("tablets")){
					   out.print("tabletsID: ");
				   }
				   else if(search.equals("price")){
					   out.print("ItemID: ");
				   }	
				%>
				<input type="text" name="cID">
				<br>
				<br>
				SellerID:&nbsp;<input type="text" name="sellerid">
				<br>
				<br>
				Bid Amount:&nbsp;<input type="text" name="bid">
				<br>
				<br>
				<input type="submit" value="Create Bid">
				</form>
				<%
			}
			catch(Exception e){
				out.print(e);
			}
		%>


</body>
</html>