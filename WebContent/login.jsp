<!-- CSCI 201 Final Project Plannrly 
Team Members: Andrew Garcia, Cathleen Yang, Giovana Da Cunha, Maansi Manchanda 
Emails: andreweg@usc.edu, cathleey@usc.edu, dacunha@usc.edu, maansima@usc.edu
 -->
 

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

}%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="Login.css" />
<meta charset="UTF-8">
<title>Login</title>
<% String error = (String)request.getAttribute("error");
	if(error!=null){
		if(error == "password"){%>
			<script>alert("Error: password is incorrect")</script>
		<%}
		else if(error == "taken"){%>
		<script>alert("Error: username is incorrect")</script>
		<%}
		else if(error == "blank"){%>
		<script>alert("Error: please don't leave any fields blank")</script>
		<%}
	}
%>
<script>
window.onload= function(){
	var userID = <%= session.getAttribute("loginID") %>
	if(userID == 0){
		document.getElementById("SignOut").style.display = "none";
		document.getElementById("Profile").style.display = "none";
		document.getElementById("GroupCreation").style.display = "none";
	}
	else if (userID!=0){
		document.getElementById("Login").style.display = "none";
		document.getElementById("SignUp").style.display = "none";
		document.getElementById("SignOut").style.display = "initial";
		document.getElementById("Profile").style.display = "initial";
		document.getElementById("GroupCreation").style.display = "initial";
	}
}

function hover(element) {
	  element.setAttribute('src', 'plannrlyPink.png');
	}

	function unhover(element) {
	  element.setAttribute('src', 'plannrly.jpg');
	}
	function hover2(element) {
		  element.setAttribute('src', 'userPink.png');
		}

		function unhover2(element) {
		  element.setAttribute('src', 'user.png');
		}
</script>
</head>
<body>
<div id = "header"> 
<a href="Home.jsp"><img id="logo" src = "plannrly.jpg" onmouseover="hover(this);" onmouseout="unhover(this);"></img></a>
<a id="Login" href="login.jsp">Login</a>
<a id="SignUp" href = "signup.jsp">Sign up</a>
<div id="Profile"><a href="ServletProfile">Profile</a> </div>
<a id="GroupCreation" href = "CreateGroup.jsp">Create New Group</a>
<a id="SignOut" href = "${pageContext.request.contextPath}/ServletSignOut">Sign Out</a>
</div>

<div id="container">
<p> Login to your Account: </p>
<img id="icon" src="user.png" width="30%" onmouseover="hover2(this);" onmouseout="unhover2(this);">
<div id="form">
<form action="LoginServlet" method = "GET"> 
<div class="child">
	Username<br>
	<input type="text" name="uname"> 
	</div>
	<div class="child">
	Password<br>
	<input type="password" name="pword">
	</div>
	<div class="child">
	<input type="submit" id="button" name="submit" value="Login">
	</div>
</form>
</div>
</div>
</body>
</html>