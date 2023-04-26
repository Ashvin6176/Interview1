package com.mahadev.exception;

public class CustomeFileForwardException extends Exception  {

	public CustomeFileForwardException(String s)
	{
		 super(s);
	}
	public CustomeFileForwardException(String s,Throwable t)
	{
		 super(s,t);
	}
}
