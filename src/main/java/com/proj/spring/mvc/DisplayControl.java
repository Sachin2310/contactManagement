package com.proj.spring.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DisplayControl {
	
	@RequestMapping("displayContacts")
	String display() {
		return "display";
	}
}
