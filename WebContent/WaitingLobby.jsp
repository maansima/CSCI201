<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Test.ServerSocket, Test.DatabaseHelper"%>
<!DOCTYPE html>
<html>
<!-- CAN BE ACCESSED BY ALL GROUP MEMBERS, REDIRECT TO VOTE FROM HERE AND SHOW 
ONLINE MEMBERS IE. NETWORKING PORTION -->
<!-- DISPLAY INFO FROM THE GROUP DATABASE -->
<head>
<link rel="stylesheet" type="text/css" href="WaitingLobby.css" />
<meta charset="UTF-8">
<title>Waiting Lobby</title>
<script>
<%

 	Integer ID = (Integer) session.getAttribute("loginID");
    DatabaseHelper db = new DatabaseHelper(); 
    String name = db.GetUser(ID);
    System.out.println(name);

%>
function start() {
	  displayLinks();
	  connectToServer();
	}
	
function displayLinks(){
	var userID = <%= session.getAttribute("loginID") %>
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
	var socket
	function connectToServer(){
		socket = new WebSocket("ws://localhost:8080/Plannrly/chat2");
		socket.onopen = function(event){
			document.getElementById("mychat").innerHTML +="Connected!<br>"; 
		}
		socket.onmessage= function(event){
			document.getElementById("mychat").innerHTML +=("<tr><td>" + event.data + "</td></tr>"); 
		}
		socket.onclose= function(event){
			document.getElementById("mychat").innerHTML +="Disconnected!<br>";
		}
	}
	function sendMessage(){

		console.log("name");
		console.log("<%= name %>");
		socket.send("<%= name %> : " + document.form.message.value);
		document.getElementById("message").value = "";
		return false;
}
</script>
</head>
<body onload = "start()">
<div id = "header"> 
<a href="Home.jsp"><img id="logo" src = "plannrly.jpg"></img></a>
<a id="Login" href="login.jsp">Login</a>
<a id="SignUp" href = "signup.jsp">Sign up</a>
<div id="Profile"><a href="Profile.jsp">Profile</a> </div>
<a id="SignOut" href = "SignOut.jsp">Sign Out</a>
</div>
<form name="form" onsubmit="return sendMessage()">
<table class="fixed_header">
	<thead>
	<tr>
		<th><span class=“text”>Chat </span></th>	
	</tr>
	</thead>
	<tbody id="mychat"> </tbody>	
</table>
	<input type="text" id="message" name= "message" placeholder="Type a message"/><br>
	<input type="submit" id="button" name="submit" value="Send"/><br>			
</form>
</body>
</html>