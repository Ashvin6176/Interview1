package com.mahadev.exception;

public class ErrorRedirectException extends Exception  {

	public static String redirectString = null;
	public ErrorRedirectException(String s)
	{
		 super(s);
	}
	public ErrorRedirectException(String s,Throwable t)
	{
		 super(s,t);
	}
}
