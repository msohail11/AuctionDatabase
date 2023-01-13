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
<title>Update user details</title>
</head>
<body>
		<%
		try{
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			Statement stmt = con.createStatement();
			
			String userid = (String)session.getAttribute("edit_id");
			int user_id = Integer.parseInt(userid);
			
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			String bankac = request.getParameter("bankac");
			
			if(username.length()!=0){
				
				stmt.executeUpdate("update end_user set login='"+username+"' where endUserID="+user_id+";");
			}
			if(password.length()!=0){
				stmt.executeUpdate("update end_user set pwd='"+password+"' where endUserID="+user_id+";");
			}
			if(email.length()!=0){
				stmt.executeUpdate("update end_user set email='"+email+"' where endUserID="+user_id+";");
			}
			if(bankac.length()!=0){
				stmt.executeUpdate("update end_user set bankac='"+bankac+"' where endUserID="+user_id+";");
			}
			%>
			<br>
			<h4>User details successfully changed!</h4><br>
			<br>
			<form method=post action=customer_rep.jsp>
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