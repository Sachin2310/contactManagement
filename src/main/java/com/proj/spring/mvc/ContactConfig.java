package com.proj.spring.mvc;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@ComponentScan(basePackages="com.proj.spring.mvc")
public class ContactConfig {
	
	@Bean
	InternalResourceViewResolver viewResolve() {
		InternalResourceViewResolver ir= new InternalResourceViewResolver();
		//ir.setPrefix("");
		ir.setSuffix(".jsp");
		
		
		return ir;
	}
}
