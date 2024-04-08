package com.proj.spring.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.repackaged.com.google.datastore.v1.client.Datastore;

@Controller
public class MainController1 {
	
	@RequestMapping(value="added", method= RequestMethod.POST)
	@ResponseBody
	void main(@RequestParam("fname") String uname, @RequestParam String lname , @RequestParam int phno , HttpServletResponse res, HttpServletRequest req) 
			throws IOException, ServletException {
		
		PrintWriter pw = res.getWriter();
		int len=Integer.toString(phno).length();
		
		if(uname.length()>=1 && len==10) {
				String s= uname+" "+lname;
				
				
				//creating entity
				Entity emp = new Entity( (String)req.getSession().getAttribute("uname") , s);
				emp.setProperty("fname", uname);
				emp.setProperty("lname",lname );
				emp.setProperty("phno", phno);
				
				DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
				ds.put(emp);
				
				req.getRequestDispatcher("AddToAll1.jsp").include(req,res);
				
				pw.print("<div class='card' align='center' style='box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);\r\n"
						+ "		  transition: 0.3s;\r\n"
						+ "		  width: 350px;\r\n"
						+ "		  height: 200px;\r\n"
						+ "       background-color:  AliceBlue ;  "
						+ "		  margin-left: 35%;\r\n"
						+ "		  margin-top: 7%;\r\n"
						+ "		  padding: 20px;'><h2 style='text-align: center;'>Contact Added Successfully</h2><br><br>" +
						"First name: "+uname+" <br>Last Name: "+lname+" <br> Phone Number: "+phno + "<br><br></div>");
		}
		else {
				pw.print("<h3>FirstName or PhoneNumber Empty</h3><br>");
				req.getRequestDispatcher("AddNewContact1.jsp").forward(req, res);
				
		}
		
		//model&view
		//ModelAndView mv = new ModelAndView();
//		mv.addObject("type" , emp);
		//mv.setViewName("AddToAll1");
		//mv.addObject("key",s);
		
		
		
		//System.out.println(emp);
//		try { 
//		System.out.println("from ds");
//		System.out.println(ds.get(emp.getKey())); 
//		System.out.println(ds.getDatastoreAttributes());
//		System.out.println(ds.get(emp.getKey()));
//		System.out.println(ds.getIndexes());
		//System.out.println(ds.get);
		
		//query
//		Query q = new Query("name");
//		List<Entity> results =
//			    ds.prepare(q).asList(FetchOptions.Builder.withDefaults());
//		System.out.println("-----------------queries--------------" + results);
//		System.out.println(results.get(1).getProperty("fname"));
		
		//} catch(Exception e) {}
//		System.out.println(emp.getKey());
		
		
		//req.getRequestDispatcher("showEntry.jsp?entityFname=uname&entityLname=lname").include(req, res);
		//return mv;
		//return "showEntry.jsp?entityFname=uname&entityLname=lname";
	}
}
