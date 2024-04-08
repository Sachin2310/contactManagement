package com.proj.spring.mvc;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Query;

@Controller
public class AddCheckContacts {

	
	
	@RequestMapping()
	boolean checkContact(Entity en) {
		DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Query q = new Query("contacts");
		List<Entity> results = ds.prepare(q).asList(FetchOptions.Builder.withDefaults());
		return run(en, results, 0);
	}
	boolean run(Entity en, List<Entity> lst, int i) {
		if(i==lst.size()) {
			return false;
		}
		if(lst.get(i).getProperties().equals(en.getProperties())) {
			return true;
		}
		
		return run(en,lst, i+1);
	}
}
