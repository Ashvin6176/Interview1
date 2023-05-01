package com.mahadev.common.serviceImpl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mahadev.common.dao.CommonProcedureDao;
import com.mahadev.common.service.CommonProcedureService;

@Service
public class CommonProcedureServiceImpl implements CommonProcedureService{

	@Autowired
	CommonProcedureDao commonProcDao;
	
	@Override
	public Map<String, Object> getMahadevMasterWebServices(Map<String, Object> setMap) throws Exception {
	
		return commonProcDao.getMahadevMasterWebServices(setMap);
	}
	@Override
	public Map<String, Object> getWebServicesData(Map<String, Object> map) throws Exception {
		return commonProcDao.getWebServicesData(map);
	}
	
}
