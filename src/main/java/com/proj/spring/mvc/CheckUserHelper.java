package com.proj.spring.mvc;

import java.util.List;
import java.util.regex.Pattern;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Query;

public class CheckUserHelper {
	
	DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
	Query q = new Query("contacts");
	List<Entity> results = ds.prepare(q).asList(FetchOptions.Builder.withDefaults());
	
	
	//checking the contacts while login
	int chk(Entity en) {
			return run(en,0);
	}
	
	int run(Entity en,int i){
		
		if(i==results.size()) {
			return -1;
		}
		
		//testing the value
		System.out.println(results.get(i).getProperty("uname") + "  "+en.getKind());
		
		if(results.get(i).getProperty("uname").equals(en.getKind())) {
			return i;
		}
		return run(en,i+1);
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------
	
			//getUserName	// this is email after changing the functionality
		String userName(int i) {
			return (String) results.get(i).getProperty("uname");
		}
		
			//realUser Name
		String realUserName(int i) {
			return (String) results.get(i).getProperty("userName");
		}
		
			//getPass
		String userPass(int i) {
			return (String) results.get(i).getProperty("pass");
		}
	
	
	
	
	//------------------------------------------------------------------------------------------------------------------------------------
	
		//checking the page for signUp
		int chk2(Entity en) {
			return run2(en,0);
		}
	
		int run2(Entity en,int i){
		
			if(i==results.size()) {
				return -1;
			}
			
			//testing the value
			System.out.println(results.get(i).getProperty("uname") + "  "+en.getProperty("uname"));
			
			if(results.get(i).getProperty("uname").equals(en.getProperty("uname"))) {
				return i;
			}
			return run2(en,i+1);
		}
		
		
		//----------------------------------------------------------------------------------------------------------------------------------------
		
		//check the email
		
		boolean checkEmail(String email) {
			if(email.equals(null)) {
				return false;
			}
			Pattern pattern = Pattern.compile("[a-zA-Z0-9][a-zA-Z0-9._]* @ [a-zA-Z0-9]+([.][a-zA-Z]+)+");
			System.out.println(pattern.matcher(email).find());
			return pattern.matcher(email).matches();
		}
		
		
		//conver email to uname
		public static String convEmail(String s) {
			int i = s.indexOf('@');
			System.out.println(s.substring(0, i));
			return s.substring(0, i);
		}
	
}
