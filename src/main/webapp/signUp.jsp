<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
		.card {
		  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
		  transition: 0.3s;
		  width: 350px;
		  height: 200px;
		  position: relative;
		  margin-left: 35%;
		  margin-top: 7%;
		  padding: 20px;	
		  background-color:PeachPuff;
		}
		
		.card:hover {
		  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
		}
		
		
		form input{
			margin: 3px;
		}
		form button{
			
			cursor: pointer;
			background-color: Salmon ;
			border-radius: 5px;
			font-size: 20px;
			padding: 2px 20px;
		}
		form button:hover{
			background-color: Crimson;
		}
		
	</style>
	
	
</head>
<body>
	<% request.getRequestDispatcher("AddToAll1.jsp").include(request,response); %>
	
	<div class="card" align="center">
		<form action="signUpCont">
		<table>
			<tr>
				<td>UserName:</td>
				<td><input type="email" name="email" placeholder="email ID" value="jamescurl@dfz.co"></td>
			</tr>
			<tr>
				<td>UserName:</td>
				<td><input type="text" name="userName" placeholder="userName" value="james curl"></td>
				
				
			</tr>
			<tr>
				<td>passWord :</td>
				<td><input type="password" name="pass" placeholder="passWord" value="12374"></td>
			</tr>
			
			</table>
			<br>
			<button id="button" type="submit">Sign UP</button> <br>
			
		</form>
	</div>
</body>
</html>