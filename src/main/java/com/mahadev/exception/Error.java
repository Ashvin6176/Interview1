package com.mahadev.exception;

import java.util.Map;

public class Error {
	 private int statusCode;
	    private String statusDescription;
	    private String errorMessage;

	    Error()
	    {
	    	
	    }
	    
	    public Error(int statusCode, String statusDescription, String errorMessage) {
	        this.statusCode = statusCode;
	        this.statusDescription = statusDescription;
	        this.errorMessage = errorMessage;
	    }
		public int getStatusCode() {
	        return statusCode;
	    }

	    public void setStatusCode(int statusCode) {
	        this.statusCode = statusCode;
	    }

	    public String getStatusDescription() {
	        return statusDescription;
	    }

	    public void setStatusDescription(String statusDescription) {
	        this.statusDescription = statusDescription;
	    }

	    public String getErrorMessage() {
	        return errorMessage;
	    }

	    public void setErrorMessage(String errorMessage) {
	        this.errorMessage = errorMessage;
	    }


}
