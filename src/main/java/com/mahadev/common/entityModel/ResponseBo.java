package com.mahadev.common.entityModel;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

import java.util.Map;

public class ResponseBo {
	
	private String service_status;
	private String service_message;
	private Object service_data;
	private Object service_data1;
	
	@JsonInclude(Include.NON_NULL)
	private boolean isValidated;
	
	@JsonInclude(Include.NON_NULL)
	private String thumbnailFileName;
	
	@JsonInclude(Include.NON_NULL)
	private Map<String,Object> error_message;
	
	@JsonInclude(Include.NON_NULL)
	private String message_description;
	
	@JsonInclude(Include.NON_NULL)
	private String responseData;
	
	
	
	@JsonInclude(Include.NON_NULL)
	private String first_login_flag;
	
	@JsonInclude(Include.NON_NULL)
	private String mobile_flag;
	
	@JsonInclude(Include.NON_NULL)
	private int user_id;
	
	@JsonInclude(Include.NON_NULL)
	private String valueOne;
	
	@JsonInclude(Include.NON_NULL)
	private Object jsonListData;
	
	@JsonInclude(Include.NON_NULL)
	private long user_activity_id;
	
	@JsonInclude(Include.NON_NULL)
	private int status;
	
	
	
	public String getMobile_flag() {
		return mobile_flag;
	}
	public void setMobile_flag(String mobile_flag) {
		this.mobile_flag = mobile_flag;
	}
	public String getThumbnailFileName() {
		return thumbnailFileName;
	}
	public void setThumbnailFileName(String thumbnailFileName) {
		this.thumbnailFileName = thumbnailFileName;
	}
	public long getUser_activity_id() {
		return user_activity_id;
	}
	public void setUser_activity_id(long user_activity_id) {
		this.user_activity_id = user_activity_id;
	}
	public String getFirst_login_flag() {
		return first_login_flag;
	}
	public void setFirst_login_flag(String first_login_flag) {
		this.first_login_flag = first_login_flag;
	}
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	public String getResponseData() {
		return responseData;
	}
	public void setResponseData(String responseData) {
		this.responseData = responseData;
	}
	public String getMessage_description() {
		return message_description;
	}
	public void setMessage_description(String message_description) {
		this.message_description = message_description;
	}
	
	public boolean isValidated() {
		return isValidated;
	}
	public void setValidated(boolean isValidated) {
		this.isValidated = isValidated;
	}
	public String getService_status() {
		return service_status;
	}
	public void setService_status(String service_status) {
		this.service_status = service_status;
	}
	public String getService_message() {
		return service_message;
	}
	public void setService_message(String service_message) {
		this.service_message = service_message;
	}
	public Object getService_data() {
		return service_data;
	}
	public void setService_data(Object service_data) {
		this.service_data = service_data;
	}
	public Map<String, Object> getError_message() {
		return error_message;
	}
	public void setError_message(Map<String, Object> error_message) {
		this.error_message = error_message;
	}
	public String getValueOne() {
		return valueOne;
	}
	public void setValueOne(String valueOne) {
		this.valueOne = valueOne;
	}
	public Object getJsonListData() {
		return jsonListData;
	}
	public void setJsonListData(Object jsonListData) {
		this.jsonListData = jsonListData;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Object getService_data1() {
		return service_data1;
	}
	public void setService_data1(Object service_data1) {
		this.service_data1 = service_data1;
	}
	
	@JsonInclude(Include.NON_NULL)
	private String responseData2;

	public String getResponseData2() {
		return responseData2;
	}
	public void setResponseData2(String responseData2) {
		this.responseData2 = responseData2;
	}
	@JsonInclude(Include.NON_NULL)
	private String application_id;



	public String getApplication_id() {
		return application_id;
	}
	public void setApplication_id(String application_id) {
		this.application_id = application_id;
	}
	
}
