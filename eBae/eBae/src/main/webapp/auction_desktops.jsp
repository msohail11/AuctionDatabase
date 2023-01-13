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
<title>Desktop details</title>
</head>
<body>
		<br>
		<form method="get" action="create_auction.jsp">
			<% 
			HttpSession temp_session = request.getSession();
	        session.setAttribute("product", "desktops");
			%>
			<br>
			
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
			
			<br>
			Description&nbsp;<input type="text" name="desc">
			<br>
			<br>
			Quantity&nbsp;<input type="text" name="quantity">
			<br>
			<br>
			Name&nbsp;<input type="text" name="name">
			<br>
			<br>
			Minimum Price&nbsp;<input type="text" name="min_price">
			<br>
			<br>
			Closing Date & Time (Format: yyyy-mm-dd HH:MM:SS)&nbsp;<input type="text" name="closingdt">
			<br>
			<br>
			
			<input type=submit value="Create Auction">
			
				
		</form>
		<br>
</body>
</html>