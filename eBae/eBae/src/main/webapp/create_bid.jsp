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
<title>Create bid</title>
</head>
<body>
		<%	try {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			Statement stmt = con.createStatement();
			
			//HttpSession temp_session = request.getSession();
			
			String username = (String)session.getAttribute("username");
			String password = (String)session.getAttribute("pwd");
			
			String computers = request.getParameter("cID");
			String seller = request.getParameter("sellerid");
			String bid_str = request.getParameter("bid");
			
			try{
				int computers_id = Integer.parseInt(computers);
				int seller_id = Integer.parseInt(seller);
				double bid = Double.parseDouble(bid_str);
				
				ResultSet uresult = stmt.executeQuery("SELECT endUserID, balance from end_user where login='"+username+"' and pwd='"+password+"';");
				uresult.next();
				int userid = uresult.getInt(1);
				double balance = uresult.getDouble("balance");
				if(bid>balance){
					out.print("The amount you entered is exceeds your balance. Try again.");
					%>
					<br>
					<form method="post" action="setup_bid.jsp">
					<input type="submit" value="Go Back">
					</form>
					<br>
					<%
				}
				else{
				String check_bid = "SELECT maxBid from auction where cID="+computers_id+" and userID="+seller_id+";";
				
				ResultSet results = stmt.executeQuery(check_bid);
				results.next();
				double current_bid = results.getDouble("maxBid");
				if(bid<current_bid){
					out.print("The amount you entered is lesser than the current bid, try again.");
					%>
					<br>
					<form method="post" action="setup_bid.jsp">
					<input type="submit" value="Go Back">
					</form>
					<br>
					<%
				}
				String bid_insert = "INSERT INTO bid(initBid, userID, cID) values("+bid+", '"+userid+"', '"+computers_id+"')";
				stmt.executeUpdate(bid_insert);
				stmt.executeUpdate("update auction set maxBid="+bid+" where cID="+computers_id+" and userID="+seller_id+";");
							
							
				//bid has been placed
				String select_bidders = "SELECT userID from bid where cID="+computers_id+" and userID<>"+userid+";";
				ResultSet bid_results = stmt.executeQuery(select_bidders);
						
				while(bid_results.next()){
					int user_id = bid_results.getInt("userID");
					String insert = "INSERT INTO alert values("+computers_id+", "+user_id+", 'Outbidded');";
					stmt.executeUpdate(insert);
					if(bid_results.isClosed()){
						break;
					}
				}
				%>
				<br>
				Bid created successfully!<br><br>
				<form method="post" action="login.jsp">
				<input type="submit" value="Go Back">
				</form>
				<br>
				<%
			}
			}
			catch(Exception e){
				out.print(e);
				%>
				<br>
				<form method="post" action="search.jsp">
				<input type="submit" value="Go Back">
				</form>
				<br>
				<%
			}
			
			
		}
		catch (Exception e){
			out.print(e);
				%>
				<br>
				<form method="post" action="search.jsp">
				<input type="submit" value="Go Back">
				</form>
				<br>
				<%
		}
		%>
</body>
</html>