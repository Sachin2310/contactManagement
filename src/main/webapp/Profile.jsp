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
		  padding: 10px;
		   background-color:  AliceBlue ; 
		}
		
		.card:hover {
		  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
		}
</style>
</head>
<body>
	<%
	
		request.getRequestDispatcher("AddToAll1.jsp").include(request,response);

		String uname= (String)session.getAttribute("userName");
		
		if(uname!=null){
			String[] ar= uname.split(" ");
			out.println("<br><br><div class='card' align='center'><h3>First Name  : "+ ar[0] + "<br>Last Name   : "+ ar[ar.length-1] +"</h3></div>");
			//+ "<br>Phone Number: "+ session.getAttribute("phnoS")
			//request.getRequestDispatcher("LoginView").forward(request, response);
		}
		else{
			out.print("Login First");
			request.getRequestDispatcher("LoginViewNew.jsp").include(request, response);
		}
	
	%>
	
	
	
</body>
</html>