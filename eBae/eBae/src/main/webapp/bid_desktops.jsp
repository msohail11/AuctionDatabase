<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@2.1.1/dist/dark.css">
<meta charset="ISO-8859-1">
<title>Bid desktops</title>
</head>
<body>

	
		<h4>Choose your preferences:</h4>
				<form method="post" action="browse.jsp">
				<% 
				HttpSession temp_session = request.getSession();
	        	session.setAttribute("search", "desktops");
				%>
				Size
				<select name="size" size=1>
					<option value="small">Small</option>
					<option value="medium">Medium</option>
					<option value="large">Large</option>
				</select>&nbsp;<br>
				<br>
				RAM
				<select name="ram" size=1>
					<option value="16">16</option>
					<option value="32">32</option>
					<option value="64">64</option>
				</select>&nbsp;<br> 
				<br>
				Desktop Type
				<select name="desktop_type" size=1>
					<option value="mac">Mac</option>
					<option value="windows">Windows</option>
					<option value="other">Other</option>
				</select>&nbsp;<br> 
				<br>
				<input type="submit" value="Search">
				</form>
				
				<form method="post" action="login.jsp">
				<input type="submit" value="Home">
		</form>
				


</body>
</html>