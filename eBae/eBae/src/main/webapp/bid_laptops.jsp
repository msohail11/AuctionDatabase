<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@2.1.1/dist/dark.css">
<meta charset="ISO-8859-1">
<title>Bid laptops</title>
</head>
<body>
				<h4>Choose your preferences:</h4>
			
				<form method="post" action="browse.jsp">
				<% 
				HttpSession temp_session = request.getSession();
	        	session.setAttribute("search", "laptops");
				%>
				Size in Inches (13, 15, 17) &nbsp;<input type="text" name="size">
				<br>
				<br>
				Laptop type	
				<select name="laptoptype" size=1>
					<option value="windows">Windows</option>
					<option value="chromebook">Chromebook</option>
					<option value="mac">Mac</option>
				</select>&nbsp;<br> 
				<br>
				<input type="submit" value="Search">
				</form>
				
</body>
</html>