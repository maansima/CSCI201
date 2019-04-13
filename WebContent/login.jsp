<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
String errorMessage = "";
String result = (String)request.getAttribute("logincheck");
if(request.getAttribute("logincheck")!=null) {
	if(!result.equalsIgnoreCase("success")) 
		{
			System.out.print("in if statement");
			errorMessage = (String)request.getAttribute("logincheck");
			System.out.print(errorMessage);
		}
}
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="Login.css" />
<meta charset="UTF-8">
<title>Login</title>
<script>
window.onload= function(){
	var userID = <%= session.getAttribute("loginID") %>
	var error = <%=errorMessage%>
	if( error != ""){
		alert(error);
	}
	if(userID == 0){
		document.getElementById("SignOut").style.display = "none";
		document.getElementById("Profile").style.display = "none";
	}
	else if (userID!=0){
		document.getElementById("Login").style.display = "none";
		document.getElementById("SignUp").style.display = "none";
		document.getElementById("SignOut").style.display = "initial";
		document.getElementById("Profile").style.display = "initial";
	}
}
</script>
</head>
<body>
<div id = "header"> 
<a href="Home.jsp"><img id="logo" src = "plannrly.jpg"></img></a>
<a id="Login" href="login.jsp">Login</a>
<a id="SignUp" href = "signup.jsp">Sign up</a>
<div id="Profile"><a href="Profile.jsp">Profile</a> </div>
<a id="SignOut" href = "SignOut.jsp">Sign Out</a>
</div>
<form action="LoginServlet" method = "get"> 
	<input type="text" name="uname">Username 
	<input type="text" name="pword">Password
	<input type="submit" name = "submit" value= "Login">Submit
</form>
</body>
</html>