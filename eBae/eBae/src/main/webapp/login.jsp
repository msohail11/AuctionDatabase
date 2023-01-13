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
<title>Login</title>
</head>
<body>
	<%
			try {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			String logged_in = (String)session.getAttribute("logged_in");
			String username="";
			String password="";
			if(logged_in.equals("true")){
				username += (String)session.getAttribute("username");
				password  += (String)session.getAttribute("pwd");
			}
			else{
				username  += request.getParameter("username");
				password  += request.getParameter("password");
			}
	
			String str = "SELECT pwd FROM app_user WHERE login = '" + username + "'";
			
			ResultSet result = stmt.executeQuery(str);
			
		
			
			if (result.next()==false || (!result.getString("pwd").equals(password))){
				out.print("<p>");
				out.print("Incorrect username/password or the user doesn't exist");
				out.print("</p>");
				%>
				<br>
				<form method="post" action="LoginPage.jsp">
				<input type="submit" value="Try again">
				</form>
				<br>
				<%
			}
			else if(username.equals("admin") && password.equals("admin")){
				HttpSession ssn = request.getSession(true);
	        	session.setAttribute("username", username);
	        	session.setAttribute("pwd", password);
	        	session.setAttribute("logged_in", "true");
				response.sendRedirect("admin.jsp");

				%>
				
				<%
			}
			else{
				ResultSet check_cr = stmt.executeQuery("SELECT c.repUserID from customer_rep c join app_user a on a.userID=c.repUserID where login='"+username+"' and pwd='"+password+"';");
				if(check_cr.next()){
					HttpSession ssn = request.getSession(true);
		        	session.setAttribute("username", username);
		        	session.setAttribute("pwd", password);
		        	session.setAttribute("logged_in", "true");
					response.sendRedirect("customer_rep.jsp");

				%>
				
				<%
				}
				
			
			else{
					out.print("<p>");
					out.print("You have succcessfully logged in!");
					out.print("</p>");
					ResultSet uresult = stmt.executeQuery("SELECT endUserID from end_user where login='"+username+"' and pwd='"+password+"';");
					uresult.next();
					String userid_att = uresult.getString(1);
					int userid = uresult.getInt(1);
					HttpSession ssn = request.getSession(true);
		        	session.setAttribute("username", username);
		        	session.setAttribute("pwd", password);
		        	session.setAttribute("userid_att", userid_att);
		        	
		        	session.setAttribute("logged_in", "true");
		        	
					ResultSet dt = stmt.executeQuery("SELECT now();");
					dt.next();
					String current_dt = dt.getString("now()");
					out.print(current_dt);
				
				
					String not_sold = "SELECT * FROM auction where maxBid<minPrice and closing<'"+current_dt+"';";
					ResultSet unsold_results = stmt.executeQuery(not_sold);
					if(unsold_results.next()){
						while(unsold_results.next()){
							String unsold = "INSERT INTO alert values("+unsold_results.getInt("cID")+", "+unsold_results.getInt("userID")+", Unsold);";
							stmt.executeUpdate(unsold);
		
						}
					}
				
					String item_sold = "SELECT * FROM auction where maxBid>=minPrice and closing<'"+current_dt+"';";
					ResultSet results = stmt.executeQuery(item_sold);
				
					if(results.next()){
						while(results.next()){
							String get_winners = "SELECT a.cID, b.userID, a.maxBid, a.userID from auction a join bid b on a.cID=b.cID where b.initBid=a.maxBid and a.cID="+results.getInt("cID")+";";
							ResultSet winners = stmt.executeQuery(get_winners);
							if(winners.next()){
								out.print("<br><br>Winner found!<br><br>");
								String win_insert = "INSERT INTO alert values("+winners.getInt(1)+", "+winners.getInt(2)+", 'Winner');";
								stmt.executeUpdate(win_insert);
								String balance_change = "UPDATE end_user set balance=balance-"+winners.getInt(3)+" where endUserID="+winners.getInt(2)+";";
								stmt.executeUpdate(balance_change);
						
								String sold_insert = "INSERT INTO alert values("+results.getInt("userID")+", "+results.getInt("cID")+", Item_sold);";
								stmt.executeUpdate(sold_insert);
								String balance_change2 = "UPDATE end_user set balance=balance+"+winners.getInt(3)+" where endUserID="+results.getInt("userID")+";";
								stmt.executeUpdate(balance_change2);
								
								String t_insert = "INSERT INTO transactions values("+results.getInt(2)+", "+results.getInt(4)+", "+results.getInt(3)+", "+results.getInt(1)+");";
								stmt.executeUpdate(t_insert);
							}
						}
					}
				
				
				
					String delete = "delete FROM auction where closing<'"+current_dt+"';";
					stmt.executeUpdate(delete);
				
				
				%>
				
				<div align = "center">
				<br>
				<form method="post" action="alerts.jsp">
				<input type="submit" value="View Alerts">
				</form>
				<br>
				
				<br>
				<form method="post" action="search.jsp">
				<input type="submit" value="Browse Items">
				</form>
				<br>
				<br>
				<form method="post" action="setup_auction.jsp">
				<input type="submit" value="Create Auction">
				</form>
				<br>
				<br>
				
				<form method="post" action="search_buyer.jsp">
				<input type="submit" value="Buyer history">
				</form>
				<br>
				<br>
				
				<form method="post" action="search_seller.jsp">
				<input type="submit" value="Seller history">
				</form>
				<br>
				<br>
				<form method="post" action="questions.jsp">
				<input type="submit" value="Ask a question">
				</form>
				<br>
				<br>
				<form method="post" action="show_q.jsp">
				<input type="submit" value="View questions">
				</form>
				<br>
				<br>
				<form method="post" action="LoginPage.jsp">
				<input type="submit" value="Logout">
				</form>
				</div>
				
				<%
					}
				}	
			}
			catch (Exception e) {
				out.print(e);
			}
	%>
</body>
</html>

