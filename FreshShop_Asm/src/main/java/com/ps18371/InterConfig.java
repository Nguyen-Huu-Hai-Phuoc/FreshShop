package com.ps18371;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.ps18371.interceptor.AuthInterceptor;


@Configuration
public class InterConfig implements WebMvcConfigurer{
	
	@Autowired
	AuthInterceptor auth;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
	
		registry.addInterceptor(auth)
			.addPathPatterns("/site/**")
			.excludePathPatterns("/site/login");
		
	}
}