package com.mahadev.exception;

import org.springframework.beans.factory.annotation.Autowired;


public class UserSessionExpariedException  extends Exception{

	public UserSessionExpariedException(String s)
	{
		 super(s);
//		 sessionOut();
		 
	}
	
	/*
	 * public String sessionOut() { return "/login/logOut";
	 * 
	 * }
	 */
}
