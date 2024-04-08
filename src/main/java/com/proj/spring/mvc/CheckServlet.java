package com.proj.spring.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.appengine.api.datastore.Entity;


@WebServlet("/CheckServlet")
public class CheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String s1= request.getParameter("uname");
		//int s2= Integer.parseInt(request.getParameter("phnoS"));
		String s3= request.getParameter("pass");
		
		PrintWriter out = response.getWriter();
		
		if(s1.length()>=1) {
		
					Entity en= new Entity(s1);
					CheckUserHelper ch = new CheckUserHelper();
					int test=ch.chk(en);
					
					if(test!=-1) {
					
						if(s1.equals(ch.userName(test)) && s3.equals(ch.userPass(test))){
							
							HttpSession hs = request.getSession();
							hs.setAttribute("uname", s1 );
							hs.setAttribute("userName", ch.realUserName(test));
							//hs.setAttribute("phnoS", s2 );
							
							//out.print("<h1>Login Success  </h1><br>");
							//request.getRequestDispatcher("Home.jsp").forward(request, response);
							response.sendRedirect("Home.jsp");
							//response.getWriter().print("boom");
						}
						else{
							out.println("<h3 style='text-align: center;'>Wrong passWord  <br></h3>");
							request.getRequestDispatcher("LoginViewNew.jsp").forward(request,response);
						}
					}
					else {
						out.print("<h2 style='text-align: center;'>No account found <br>Create a new one</h2> ");
						
						request.getRequestDispatcher("signUp.jsp").forward(request, response);
						
					}
		}
		else {
			out.print("<h3> userName cannot be Empty</h3><br>");
			request.getRequestDispatcher("LoginViewNew.jsp").forward(request, response);
		}
	}

}
