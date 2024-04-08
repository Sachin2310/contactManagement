<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
	.card {
		  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
		  transition: 0.3s;
		  width: 350px;
		  height: 200px;
		  
		  margin-left: 35%;
		  margin-top: 7%;
		  padding: 20px;
		  
		  background-color:PaleTurquoise;
		}
		
		.card:hover {
		  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
		}
		
		table , tr{
			margin: 10px;
		}
		button{
			cursor:pointer;
			color:white;
			background-color: MediumAquaMarine;
			border-radius: 5px;
			font-size: 20px;
			padding: 5px 20px;
		}
		button:hover{
			background-color: DarkCyan;
		}
</style>
</head>
<body>
	<%
		request.getRequestDispatcher("AddToAll1.jsp").include(request,response);
	
	
	
		if((String)session.getAttribute("uname")!=null){
			out.print(
				"<div class='card' align='center'> "	+
					" <form action='added' method= 'post'> " +
					" <table> <tr> <td>FirstName :</td> <td><input type='text' name='fname' placeholder='firstName' value='james'></td> </tr>"+
					"<tr> <td>LastName  :</td><td><input type='text' name='lname' placeholder='lastName' value='curl'></td></tr> " +
					"<tr><td>PhoneNumber :</td><td><input type='text' name='phno' placeholder='phoneNumber' value=1234567890></td></tr> </table> " +
					"<br><button type='submit'>add</button> "+
					"</form> </div>");
		}
		else{
			out.print("Login First");
			request.getRequestDispatcher("LoginViewNew.jsp").include(request, response);
		}
	%>
	
</body>
</html>