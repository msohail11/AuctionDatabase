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
<title>Answer question</title>
<style type="text/css">
      @media print {
        table td, table th {
          border: none;
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
			
			ResultSet show = stmt.executeQuery("SELECT * FROM questions where answer='Unanswered';");
			%>
			<div align = "center">
			<table>
			 	<tr>
			 	<th style="padding:5px">QuestionID</th>
			 	<th style="padding:5px">Question</th>
			 	<th style="padding:5px">Answer</th>
			 	</tr>
			 	<%
			while(show.next()){
				%>
				<tr>    
					<td style="padding:5px"><%= show.getString("questionID") %></td>
					<td style="padding:5px"><%= show.getString("question") %></td>
					<td style="padding:5px"><%= show.getString("answer") %></td>
				</tr>
			</div>
			<%

			}
			%>
			
			<div align = "center">
			
			</table>
			<br><br>
			<form method=post action="create_answer.jsp">
			Enter QuestionID:&nbsp;<input type="text" name="q_id"><br><br>
			Enter Answer:&nbsp;<input type="text" name="answer"><br><br>
			<input type="submit" name="choice" value="Submit answer"><br><br>
			</form>
			
			<form method=post action="customer_rep.jsp">
			<input type="submit" value="Customer Rep Home"> </form>
			
			
			</div>
			
			<%
		}
		catch(Exception e){
			out.print(e);
		}
		%>
</body>
</html>