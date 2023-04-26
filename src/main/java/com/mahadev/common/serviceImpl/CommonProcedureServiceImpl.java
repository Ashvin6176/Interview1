package com.mahadev.common.serviceImpl;

import java.util.Map;

import org.postgresql.util.PGobject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mahadev.common.dao.CommonProcedureDao;
import com.mahadev.common.service.CommonProcedureService;

@Service
public class CommonProcedureServiceImpl implements CommonProcedureService{

	@Autowired
	CommonProcedureDao commonProcDao;
	
	@Override
	public Map<String, Object> getHrmsCommonWebService(Map<String, Object> setMap) throws Exception {
		// TODO Auto-generated method stub
		return commonProcDao.getHrmsCommonWebService(setMap);
	}

	@Override
	public Map<String, Object> getHCGMasterWebServices(Map<String, Object> setMap) throws Exception {
	
		return commonProcDao.getHCGMasterWebServices(setMap);
	}
	@Override
	public Map<String, Object> getUserManagementWebService(Map<String, Object> setMap) throws Exception {
		return commonProcDao.getUserManagementWebServices(setMap);
	}
	
}
