<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	
		request.getRequestDispatcher("AddToAll1.jsp").include(request,response);
	
		if(session.getAttribute("uname")!=null){
			session.removeAttribute("uname");
			session.removeAttribute("userName");
			out.print("Successfully Logged out");
			request.getRequestDispatcher("LoginViewNew.jsp").include(request, response);
		}
		else{
			out.print("Login First");
			request.getRequestDispatcher("LoginViewNew.jsp").include(request, response);
		}
	%>
</body>
</html>