package com.mahadev.exception;

public class SecrateKeyNotFoundException extends RuntimeException {
	private static final long serialVersionUID = 1L;

	public SecrateKeyNotFoundException() {
	    }

	    public SecrateKeyNotFoundException(String message) {
	        super(message);
	    }

	    public SecrateKeyNotFoundException(String message, Throwable cause) {
	        super(message, cause);
	    }

	    public SecrateKeyNotFoundException(Throwable cause) {
	        super(cause);
	    }

	    public SecrateKeyNotFoundException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
	        super(message, cause, enableSuppression, writableStackTrace);
	    }
	
}
