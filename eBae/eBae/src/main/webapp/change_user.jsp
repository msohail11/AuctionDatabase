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
<title>Change user details</title>
</head>
<body>
		<% 
		try{
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			Statement stmt = con.createStatement();
			
			String choice = request.getParameter("choice");
			String userid = request.getParameter("userid");
			
			
        	session.setAttribute("edit_id", userid);
			
			if(userid.length()==0){
				%>
				<br>
				Invalid input for user id, try again.<br><br>
				<form method=post action=edit_users.jsp>
				<input type="submit" value="Go back"><br><br>
				</form>
				<%
			}
			
			else if(choice.equals("Edit")){
				%>
				<br> <br>
				
				<div align = "center">
				<h3>Only update the respective fields that need to be changed. </h3>
				
				<form method=post action="update_user.jsp">
				<br><br>
				Username:&nbsp;<input type="text" name="username">
				<br><br>
				<br><br>
				Password:&nbsp;<input type="text" name="password">
				<br><br>
				<br><br>
				Email:&nbsp;<input type="text" name="email">
				<br><br>
				<br><br>
				Bank A/C:&nbsp;<input type="text" name="bankac">
				<br><br>
				<br><br>
				<input type="submit" value="Update details">
				</form>
				</div>
				<%
			}
			else{
				stmt.executeUpdate("DELETE FROM end_user where endUserID="+Integer.parseInt(userid)+";");
				stmt.executeUpdate("DELETE FROM auction where userID="+Integer.parseInt(userid)+";");
				stmt.executeUpdate("DELETE FROM bid where userID="+Integer.parseInt(userid)+";");
				stmt.executeUpdate("DELETE FROM app_user where userID="+Integer.parseInt(userid)+";");
				
				%>
				<br>
				<h4>User details successfully deleted!</h4><br>
				<br>
				<form method=post action=customer_rep.jsp>
				<input type="submit" value="Go back"><br><br>
				</form>
				<%
				
			}
			
		}
		catch(Exception e){
			out.print(e);
		}
		%>
</body>
</html>