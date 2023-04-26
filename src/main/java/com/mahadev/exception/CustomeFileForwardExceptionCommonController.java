package com.mahadev.exception;

public class CustomeFileForwardExceptionCommonController extends Exception {

	public CustomeFileForwardExceptionCommonController(String s)
	{
		 super(s);
	}
	public CustomeFileForwardExceptionCommonController(String s,Throwable t)
	{
		 super(s,t);
	}
}
