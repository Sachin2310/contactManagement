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
		  
		  margin-left: 35%;
		  margin-top: 7%;
		  
		  background-color:LightCyan;
		}
		
		.card:hover {
		  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
		}
		
		.contents{
			padding: 20px;	
		}
		form input{
			margin: 3px;
		}
		button{
			cursor:pointer;
			color: black ;
			background-color: LightSkyBlue;
			border-radius: 5px;
			font-size: 20px;
			padding: 2px 20px;
		}
		form button:hover{
			background-color: DodgerBlue;
			color: white;
			
		}
		
	</style>
</head>
<body>
<h2 style="text-align: center;">Enter the Details</h2>

	<div class="card" align="center">
		<div class="contents">
			<form action="CheckServlet">
			<table >
				<tr>
					<td>UserName:</td>
					<td><input type="email" name="uname" placeholder="emailID" value="jamescurl@dfz.cop"></td>
				</tr>
				<!-- <tr>
					<td>PhoneNumber :</td>
					<td><input type="number" name="phnoS" placeholder="phoneNumber" value=1234567890></td>
				</tr> -->
				<tr>
					<td>passWord :</td>
					<td><input type="password" name="pass" placeholder="passWord" value="12374"></td>
				</tr>
				
				</table>
				<br>
				<button type="submit">Login</button> <br><br>
				New User ? <a href="signUp.jsp"> Sign Up</a>
			</form>
		</div>
	</div>
</body>
</html>