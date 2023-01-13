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
<title>Ask a question</title>
</head>
<body>
		<% 
			try{
				
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();	
				
				Statement stmt = con.createStatement();
				
				String question = request.getParameter("question");
				
				boolean exists = false;
				while(!exists){
					int question_id = (int)Math.floor(Math.random()*(99999999-10000000+1)+10000000);
					String query = "SELECT * FROM questions where questionID="+question_id+";";
					ResultSet result = stmt.executeQuery(query);
					if(result.next()==false){
						String insert = "INSERT INTO questions values("+question_id+", '"+question+"','Unanswered');";
						stmt.executeUpdate(insert);
						exists=true;
					}
				}
				%>
				<br><br>
				Question created successfully<br><br>
				<form method=post action="login.jsp">
				<input type="submit" value="Go back">
				</form>
				<%
			}
			catch(Exception e){
				out.print(e);
			}
				%>
</body>
</html>