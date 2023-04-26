package com.mahadev.common.entityModel;

public class AuthorizeCheckBo {

	private String return_msg;
	private String error_code;
	private boolean return_status;
	public String getReturn_msg() {
		return return_msg;
	}
	public void setReturn_msg(String return_msg) {
		this.return_msg = return_msg;
	}
	public String getError_code() {
		return error_code;
	}
	public void setError_code(String error_code) {
		this.error_code = error_code;
	}
	public boolean isReturn_status() {
		return return_status;
	}
	public void setReturn_status(boolean return_status) {
		this.return_status = return_status;
	}
	
	
}
