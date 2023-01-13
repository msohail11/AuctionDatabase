<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@2.1.1/dist/dark.css">

<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@2.1.1/dist/dark.css">

<meta charset="ISO-8859-1">
<title>Bid tablets</title>
</head>
<body>

			
			<div align = "center">
				<h4>Choose your preferences:</h4>
				<form method="post" action="browse.jsp">
				<% 
				HttpSession temp_session = request.getSession();
	        	session.setAttribute("search", "tablets");
				%>
				Size in Inches (12, 14, 16)&nbsp;<input type="text" name="size">
				<br>
				<br>
				Tablet Type
				<select name="type" size=1>
					<option value="surface">Surface</option>
					<option value="reading">Reading</option>
					<option value="gaming">Gaming</option>
				</select>&nbsp;
				<br>
				<br>
				<input type="submit" value="Search">
				</form>
				
				</div>
				
			
</body>
</html>