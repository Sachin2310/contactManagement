package com.proj.spring.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;

@Controller
public class SignUpControl {

	@RequestMapping("signUpCont")
	ModelAndView signUpRes(@RequestParam("email") String s1 , @RequestParam("pass") String s2 ,@RequestParam String userName, HttpServletResponse res) throws IOException {
		
		PrintWriter pw = res.getWriter();
		ModelAndView mv= new ModelAndView();
		CheckUserHelper ch= new CheckUserHelper();
		
		//if(s2.length()>=5 && ch.checkEmail(s1)) {
		if(s2.length()>=5  && userName.length()>=1 && s1.length()>=1){
				//s1 = ch.convEmail(s1);
			
				Entity user = new Entity("contacts" , s1);
				user.setProperty("uname", s1);
				user.setProperty("pass", s2);
				user.setProperty("userName", userName);
				
				
				
				
				//checking the id of entity
				//System.out.println("----------------------From controller-------------"+user.getAppId());
				
				
				DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
				
				//mv.addObject("entity", user);
				
				if(ch.chk2(user)==-1) {
					ds.put(user);
					
					//creating new entity for new user for storing contacts as individual
					//Entity NewUser = new Entity(s1 , s1);
					//ds.put(NewUser);
				
					mv.setViewName("LoginViewNew");
					pw.print("<h2 style='text-align: center;'>Account Successfully created <h2><br><br>");
				}
				else {
					pw.print("<h2 style='text-align: center;'>User Already Exists <h2><br><br>");
					mv.setViewName("LoginViewNew");
					//String[] ar= s1.split(" ");
					//mv.setViewName("showEntry.jsp?EntityFname='"+ ar[0] +"'&EntityLname='"+ ar[1] +"'");
				}
				
				
				
				return mv;
		}
		else {
			pw.print("<h3>Incorrect Email or passWord format<h3><br>"
					+ "<h3> Enter again </h3>");
			mv.setViewName("signUp");
			
			return mv;
		}
	}
}
