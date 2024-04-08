<%@page import="com.proj.spring.mvc.CheckUserHelper"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- 
<style>
body {
  background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgLq3hGQVyIelGkEvHr2peyXhhy-mpnAEBUg&usqp=CAU');
   /* Full height */
  height: 100%;

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
</style>
-->
</head>

<body>
		<% 
			if(session.getAttribute("uname")!=null){
				out.print("<div style = 'position:absolute; right:80px; top:20px;'>" + 
				"<br><h2 align='right'> Welcome " + session.getAttribute("userName") + "</h2> </div>");
			}
		%>
		
	
	
		<% request.getRequestDispatcher("display.jsp").include(request,response); %>
	
	
	
</body>
</html>