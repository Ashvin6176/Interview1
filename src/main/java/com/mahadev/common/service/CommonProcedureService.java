package com.mahadev.common.service;

import java.util.Map;

import org.postgresql.util.PGobject;
import org.springframework.stereotype.Component;

@Component
public interface CommonProcedureService {
	
	public Map<String, Object> getHrmsCommonWebService(Map<String, Object> setMap) throws Exception;
	public Map<String, Object> getUserManagementWebService(Map<String, Object> setMap) throws Exception;
	public Map<String, Object> getHCGMasterWebServices(Map<String, Object> map) throws Exception;
}
