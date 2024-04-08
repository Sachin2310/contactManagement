<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
	
	.links a{
		float:left;
		text-align: center;
		font-size: 15px;
		padding: 12px 15px;
		text-decoration: none;
		color: MediumSeaGreen ;
		font-size: 20px;
		
		
	}
	.links a:hover{
		background-color: black ;
	}
	.links{
		background-color: dimgray ;
		overflow: hidden;
	}
	
</style>
<body>
	<div class="links">		<a href="Home.jsp" style="margin-left: 20px;">home</a>
		<a href="Profile.jsp">profile</a>
		<a href="AddNewContact1.jsp">Add Contact</a>
		<a href="EntityCheck.jsp">Search Contact</a>
		<a href="displayContacts">All Contacts</a> 
		<a href="Logout.jsp" style="float:right; margin-right: 35px;">logout</a>
	</div>
</body>
</html>