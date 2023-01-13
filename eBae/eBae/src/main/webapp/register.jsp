
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
<title>Registration</title>
</head>
<body>
	<%	try {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			Statement stmt = con.createStatement();
			String username  = request.getParameter("username");
			String password  = request.getParameter("password");
			String bank  = request.getParameter("bankac");
			String email  = request.getParameter("email");
			
			if(username.length()==0) out.print("Null username");
			out.print("<br>");
			out.print(username);
			
			if(username.length()==0 || username.length()>20){
				out.print("<p>");
				out.print("Username too long or the input is empty. Try again.");
				out.print("</p>");
				%>
				<br>
				<form method="post" action="RegisterPage.jsp">
				<input type="submit" value="Try again">
				</form>
				<br>
				<%
			}
			else if(password.length()==0 || password.length()>20){
				out.print("<p>");
				out.print("Password too long or the input is empty. Try again.");
				out.print("</p>");
				%>
				<br>
				<form method="post" action="RegisterPage.jsp">
				<input type="submit" value="Try again">
				</form>
				<br>
				<%
			}
			
			else if(bank.length()==0 || bank.length()>20){
				out.print("<p>");
				out.print("Bank A/C number too long or the input is empty. Try again.");
				out.print("</p>");
				%>
				<br>
				<form method="post" action="RegisterPage.jsp">
				<input type="submit" value="Try again">
				</form>
				<br>
				<%
			}
			
			else if(email.length()==0 || email.length()>50){
				out.print("<p>");
				out.print("Email too long or the input is empty. Try again.");
				out.print("</p>");
				%>
				<br>
				<form method="post" action="RegisterPage.jsp">
				<input type="submit" value="Try again">
				</form>
				<br>
				<%
			}
			
			
			else{
				boolean exists = false;
				while(!exists){
					int userid = (int)Math.floor(Math.random()*(99999999-10000000+1)+10000000);
					String query = "SELECT * FROM end_user where endUserID="+userid+";";
					ResultSet result = stmt.executeQuery(query);
					if(result.next()==false){
						String query2 = "INSERT INTO app_user values("+userid+", '"+username+"', '"+password+"', '"+email+"');";
						String query3 = "INSERT INTO end_user values("+userid+", '"+username+"', '"+password+"', '"+email+"', '"+bank+"', 1000);";
						int result2 = stmt.executeUpdate(query2);
						int result3 = stmt.executeUpdate(query3);
						exists=true;
					}
				}
				%>
				<br>
				<form method="post" action="LoginPage.jsp">
				<input type="submit" value="Account Created">
				</form>
				<br>
				<%
			}
	}catch (Exception e) {
		out.print(e);
	}
			%>

</body>
</html>


			
			