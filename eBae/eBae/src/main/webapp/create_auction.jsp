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
<title>Create auction</title>
</head>
<body>
<%	try {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			Statement stmt = con.createStatement();
			
			//HttpSession temp_session = request.getSession();
			
			String product = (String)session.getAttribute("product");
			String username = (String)session.getAttribute("username");
			String password = (String)session.getAttribute("pwd");
			
			//out.print(username+" : "+password);
			//out.print("<br>");
			
			String closing = request.getParameter("closingdt");
			String min_price = request.getParameter("min_price");			
			String description = request.getParameter("desc");
			String quantity = request.getParameter("quantity");
			String name = request.getParameter("name");
			
			try{
				int quant=Integer.parseInt(quantity);
				double minp=Double.parseDouble(min_price);
			}
			catch (NumberFormatException e){
				out.print("Invalid input for quantity");
				%>
				<br>
				<form method="post" action="setup_auction.jsp">
				<input type="submit" value="Go Back">
				</form>
				<br>
				<%
			}
			int quant=Integer.parseInt(quantity);
			double minp=Double.parseDouble(min_price);
			if(quantity.length()==0 || description.length()==0 || name.length()==0 || quant==0 || minp==0){
				out.print("You missed a parameter!");
				%>
				<br>
				<form method="post" action="setup_auction.jsp">
				<input type="submit" value="Go Back">
				</form>
				<br>
				<%
			}
			
			else{
				boolean exists = false;
				int computers_id=0;
				while(!exists){
					computers_id = (int)Math.floor(Math.random()*(99999999-10000000+1)+10000000);
					String query = "SELECT * FROM computers where cID="+computers_id+";";
					ResultSet result = stmt.executeQuery(query);
					if(result.next()==false){
						exists=true;
					}
				}
				String computers_query = "INSERT INTO computers values("+computers_id+", '"+description+"', '"+name+"', "+Integer.parseInt(quantity)+");";
				stmt.executeUpdate(computers_query);
				
				ResultSet uresult = stmt.executeQuery("SELECT endUserID from end_user where login='"+username+"' and pwd='"+password+"';");
				uresult.next();
				int userid = uresult.getInt(1);
				String auction_query = "INSERT INTO auction values("+minp+", "+0+", "+userid+", '"+computers_id+"', '"+closing+"');";
				stmt.executeUpdate(auction_query);
				
				/*if (product.equals("desktops") || product.equals("laptops") || product.equals("tablets")){
					out.print("Works");
				}*/
				
				
				if (product.equals("desktops")){
					String size = request.getParameter("size");
					String desktoptype = request.getParameter("desktoptype");
					String ram  = request.getParameter("ram");
					String desktopquery = "INSERT INTO desktops values('"+size+"', '"+ram+"', '"+desktoptype+"', "+computers_id+");";
					stmt.executeUpdate(desktopquery);
					out.print("Auction created successfully!");
					
					%>
					<br>
					<form method="post" action="login.jsp">
					<input type="submit" value="Home"></form>
					</br>
					<%
					
				}
				
				else if (product.equals("laptops")){
					try{
						String size = request.getParameter("size");
						int val=Integer.parseInt(size);
						String laptoptype = request.getParameter("laptoptype");
						String laptop_query = "INSERT INTO laptops values( "+size+", '"+laptoptype+"', "+computers_id+");";
						stmt.executeUpdate(laptop_query);
						out.print("Auction created successfully!");
						%>
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
						<form method="post" action="setup_auction.jsp">
						<input type="submit" value="Go Back">
						</form>
						<br>
						<%
				
					}
					
				}
				else if (product.equals("tablets")){
					String size = request.getParameter("size");
					String type = request.getParameter("type");
					try{
						double val=Double.parseDouble(size);
						String tablets_query = "INSERT INTO tablets values("+val+", '"+type+"', "+computers_id+");";
						stmt.executeUpdate(tablets_query);
						out.print("Auction created successfully!");
						
						%>
						<br>
						<form method="post" action="login.jsp">
						<input type="submit" value="Home"></form>
						</br>
						<%
						
					}
					catch (NumberFormatException e){
						out.print("Invalid input for tablet size");
						
						%>
						<br>
						<form method="post" action="setup_auction.jsp">
						<input type="submit" value="Go Back">
						</form>
						<br>
						<%
						
					}
				}
							
				}
			}
			catch (Exception e){
				out.print(e);
					%>
					<br>
					<form method="post" action="setup_auction.jsp">
					<input type="submit" value="Go Back">
					</form>
					<br>
					<%
			}
			%>
</body>
</html>