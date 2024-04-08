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
		  
		  background-color:Lavender ;
		}
		
		.card:hover {
		  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
		}
		
		button{
			cursor:pointer;
			color:white;
			background-color: LightPink;
			border-radius: 5px;
			font-size: 20px;
			padding: 5px 20px;
		}
		button:hover{
			background-color: PaleVioletRed;
		}
		
</style>
</head>
<body>
	<%
		request.getRequestDispatcher("AddToAll1.jsp").include(request,response);
	
		if(session.getAttribute("uname")!=null){
			
			out.print("<div class='card' align='center'><form action='showEntry.jsp'>" + " <table><tr><td>First Name</td><td><input type='text' name='entityFname'></td></tr>" +
			" <tr><td>Last Name</td><td><input type='text' name='entityLname'></td></tr> " +
		" </table> "+ "<br><button type='submit'>check</button> </form></div>");
		}
		else{
			out.print("Login First");
			request.getRequestDispatcher("LoginViewNew.jsp").include(request, response);
		}
	%>
	
</body>
</html>