<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="Home.css" />
<meta charset="UTF-8">
<title>Plannerly Home</title>
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
</script>
</head>
<body>
<div id = "header"> 
<a href="Home.jsp"><img id="logo" src = "plannrly.jpg"></img></a>
<a id="Login" href="login.jsp">Login</a>
<a id="SignUp" href = "signup.jsp">Sign up</a>
<div id="Profile"><a href="ServletProfile">Profile</a> </div>
<a id="SignOut" href = "ServletSignOut">Sign Out</a>
<a id="GroupCreation" href = "CreateGroup.jsp">Create New Group</a>
</div>

<div id="center">
<img id="group" src="group.png">
<form action="YelpApiTester" method="GET">
<div id="inputs">
<div id="child">
<input name="cityName" type="text" placeholder="Where do you want to go?"></input>
</div>
<div id="child">
<select name="activityType">
  <option value="food">Food</option>
  <option value="bars">Bars</option>
  <option value="active">Active</option>
  <option value="arts">Arts</option>
</select>
</div>
<div id="child">
<div class="submit">
</div>
<input type="submit" value="Show me activities!"></input>
</div>
</div>
</form>
</div>
</body>
</html>