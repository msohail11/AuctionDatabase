<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@2.1.1/dist/dark.css">
		
<meta charset="ISO-8859-1">
<title>Register Page</title>
</head>
<body>
	<br>
		<form method="get" action="register.jsp">
		<table>
		<tr>    
		<td>Username</td><td><input type="text" name="username"></td>
		</tr>
		<tr>
		<td>Password</td><td><input type="text" name="password"></td>
		</tr>
		<tr>    
		<td>Bank A/C Number</td><td><input type="text" name="bankac"></td>
		</tr>
		<tr>    
		<td>Email</td><td><input type="text" name="email"></td>
		</tr>
		</table>
		<input type="submit" value="Register">
		</form>
	<br>
</body>
</html>