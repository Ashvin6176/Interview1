package com.mahadev.exception;

public class TokenNotFoundException extends RuntimeException {

	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public TokenNotFoundException() {
	    }

	    public TokenNotFoundException(String message) {
	        super(message);
	    }

	    public TokenNotFoundException(String message, Throwable cause) {
	        super(message, cause);
	    }

	    public TokenNotFoundException(Throwable cause) {
	        super(cause);
	    }

	    public TokenNotFoundException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
	        super(message, cause, enableSuppression, writableStackTrace);
	    }
	
}
