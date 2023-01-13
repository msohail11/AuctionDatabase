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
<title>Questions and Answers</title>
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
			
			ResultSet show = stmt.executeQuery("SELECT * FROM questions;");
			%>
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
			<%

			}
			%>
			</table>
			<br><br>
			<form method=post action="login.jsp">
			<input type="submit" name="choice" value="Go back"><br><br>
			</form>
			<%
		}
		catch(Exception e){
			out.print(e);
		}
		%>
</body>
</html>