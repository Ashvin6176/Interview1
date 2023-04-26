package com.mahadev.exception;

public class CommonExceptionForAjax extends Exception {

	public CommonExceptionForAjax(String s)
	{
		 super(s);
	}
	public CommonExceptionForAjax(String s,Throwable t)
	{
		 super(s,t);
	}
}
