<%@page import="java.util.Map"%>
<%@page import="com.google.appengine.api.datastore.Entity"%>
<%@page import="com.google.appengine.api.datastore.DatastoreServiceFactory"%>
<%@page import="com.google.appengine.api.datastore.DatastoreService"%>
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
  width: 20%;
  
  margin-left: 35%;
		  margin-top: 7%;
  background-color:BlanchedAlmond;
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

.container {
  padding: 2px 16px;
}
</style>
</head>
<body>
	<%	
		String s1= (String)session.getAttribute("uname");
		if(s1!=null){
			DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
			// --> Entity en = (Entity)request.getAttribute("type");
			
				String c= request.getParameter("entityFname");
				String l= request.getParameter("entityLname");
				
					if(c.length()>=1){
						
							String s= c+" "+l;
							
							Entity en= new Entity ( s1 , s);		//new
							
							try{
								out.print("<br>"+en);
								Entity got = ds.get(en.getKey());
																
								if(got!=null){
									//Entity got = ds.get									//new
									request.getRequestDispatcher("AddToAll1.jsp").include(request,response);
																		
									//card:
										out.print("<div class='card'> " +
												 " <img src='https://media.istockphoto.com/vectors/male-profile-flat-blue-simple-icon-with-long-shadow-vector-id522855255?k=20&m=522855255&s=612x612&w=0&h=fLLvwEbgOmSzk1_jQ0MgDATEVcVOh_kqEe0rqi7aM5A=' "
												 + "alt='profile pic' style='width:100%'> "+
												 " <div class='container'> "+
												  "  <h4>First Name : <b>"+got.getProperty("fname")+"</b></h4> "+
												  "  <h4>Last Name : <b>"+got.getProperty("lname")+"</b></h4> "+
												   " <p>Phone Number :"+ got.getProperty("phno")+" </p> "+
												"  </div>  "+
												"</div> ");
														
									//out.print("<br>------------------from showEntry.jsp---------------<br>");
									/*out.println("<br>First Name : "+ got.getProperty("fname")+ "<br>Last Name: " + 
										got.getProperty("lname")+ "<br>Phone Number :"+ got.getProperty("phno")+ "<br><br>"); */
									
			
									//Map mp = got.getProperties();						//old
									//out.print(mp);
									
									
									//if(!mp.isEmpty()){
									//	out.print(mp);
									//}
									//else{
									//	out.print("NO Contacts");
									//}
								}
								else{
									out.print("NO Contacts");
								}
							}
							catch(Exception e){
								out.print("<br><h2>No contact like this <br> Add a new One</h2>");
								request.getRequestDispatcher("AddNewContact1.jsp").include(request, response);
							}
							
					}
					else{
						out.print("<h3>First Name cannot be Empty</h3><br>");
						request.getRequestDispatcher("EntityCheck.jsp").include(request, response);
					}			
		}
		
		else{
			out.print("Login First");
			request.getRequestDispatcher("LoginViewNew.jsp").forward(request, response);
		}	
	%>
	
</body>
</html>