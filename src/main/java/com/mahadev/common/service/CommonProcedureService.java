package com.mahadev.common.service;

import java.util.Map;

import org.springframework.stereotype.Component;

@Component
public interface CommonProcedureService {
	
	public Map<String, Object> getMahadevMasterWebServices(Map<String, Object> map) throws Exception;
	public Map<String, Object> getWebServicesData(Map<String, Object> map) throws Exception;
}
