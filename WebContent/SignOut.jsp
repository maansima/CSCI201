<!-- CSCI 201 Final Project Plannrly 
Team Members: Andrew Garcia, Cathleen Yang, Giovana Da Cunha, Maansi Manchanda 
Emails: andreweg@usc.edu, cathleey@usc.edu, dacunha@usc.edu, maansima@usc.edu
 -->
 

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Thank You!</title>
<script type="text/javascript">
setTimeout("location.href = 'Home.jsp';",1500);
</script>
</head>
<body>
<%
 	session.setAttribute("loginID", 0);
%>	
	<h1 style="text-align:center;">You are being Signed Out. GoodBye!</h1>
		
</body>
</html>