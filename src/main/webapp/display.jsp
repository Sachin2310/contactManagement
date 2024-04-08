<%@page import="com.google.appengine.api.datastore.DatastoreServiceFactory"%>
<%@page import="com.google.appengine.api.datastore.DatastoreService"%>
<%@page import="com.google.appengine.api.datastore.FetchOptions"%>
<%@page import="com.google.appengine.api.datastore.Entity"%>
<%@page import="java.util.List"%>
<%@page import="com.google.appengine.api.datastore.Query"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.card {
  box-shadow: 0 4px 8px 0 grey;
  
  
  margin: 10px;
  float: left;
  width: 20% ;
  
  background-color: HoneyDew ;
}

.card:hover {
  box-shadow: 0 8px 16px 0 grey ;
}

.container {
  padding: 2px 16px;
}

.mainContainer{
display: block;
width: 100%;
}


</style>
</head>
<body>
	<% request.getRequestDispatcher("AddToAll1.jsp").include(request,response); %>
	
	
	<%
	
	
	if((String)session.getAttribute("uname")!=null){
		out.print("<h1>All Contacts</h1> <br>");
		
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Query q = new Query((String)session.getAttribute("uname"));
		List<Entity> results = ds.prepare(q).asList(FetchOptions.Builder.withDefaults());
		
		out.print("<div class='mainContainer'>");
		
		for(Entity en:results){
			out.print("<div class='card'> " +
					 " <img src='https://media.istockphoto.com/vectors/male-profile-flat-blue-simple-icon-with-long-shadow-vector-id522855255?k=20&m=522855255&s=612x612&w=0&h=fLLvwEbgOmSzk1_jQ0MgDATEVcVOh_kqEe0rqi7aM5A=' "
					 + "alt='profile pic' style='width:100%'> "+
					 " <div class='container'> "+
					  "  <h4>First Name : <b>"+en.getProperty("fname")+"</b></h4> "+
					  "  <h4>Last Name : <b>"+en.getProperty("lname")+"</b></h4> "+
					   " <p>Phone Number: "+ en.getProperty("phno")+" </p> "+
					"  </div>  "+
					"</div> ");
			// old:
			// out.println("<br>First Name : "+ en.getProperty("fname")+ "<br>Last Name: " + en.getProperty("lname")+ "<br>Phone Number :"+ en.getProperty("phno")+ "<br><br>");
		}
		out.print("</div>");
	}
	else{
		out.print("Login First");
		request.getRequestDispatcher("LoginViewNew.jsp").include(request, response);
	}
	
	
	%>
</body>
</html>