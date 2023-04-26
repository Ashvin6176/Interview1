package com.mahadev.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
@SuppressWarnings("deprecation")
@Configuration
public class InterceptorAppConfig extends WebMvcConfigurerAdapter {
	
	@Autowired
	UserInterceptor userInterceptor;
	
	@Override
    public void addInterceptors(InterceptorRegistry registry) {
       registry.addInterceptor(userInterceptor).addPathPatterns("/**")
       .excludePathPatterns("/", "/resources/**", "/css/**","/js/**","/images/**","/fonts/**","/login/**","/retailerReg/**","/dscRest/**");
    }
	}
