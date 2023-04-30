package com.mahadev.dao;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mahadev.constant.Constants;
import com.mahadev.entityModel.MstUserBo;
import com.mahadev.repo.AllMainRepository;
@Component
public class MainDaoImpl implements MainDao{
	@Autowired
    AllMainRepository allMainRepository;
@Override
public Map<String, Object> ActivateDeActivateMstUser(Map<String, Object> map) {
	Map<String, Object> returnMap = new HashMap<>();
	MstUserBo bo = (MstUserBo) map.get("webBo");
	int count = allMainRepository.ActivateDeActivateMstUser(bo);
	if(count <= 0) {
		returnMap.put("returnMsg", Constants.MSG_ERROR);
		return returnMap;			
	}
	else {
		returnMap.put("returnMsg", Constants.MSG_SUCCESS);
		returnMap.put("bo", bo);
		return returnMap;
	}
}

@Override
public Map<String, Object> saveMstCreateUser(Map<String, Object> map) {
	Map<String, Object> returnMap=new HashMap<>();
	MstUserBo bo=(MstUserBo)map.get("webBo");
	allMainRepository.saveMstCreateUser(bo);
	returnMap.put("returnMsg", Constants.MSG_SUCCESS);
	returnMap.put("bo", bo);		
	return returnMap;
}

@Override
public Map<String, Object> updateMstUser(Map<String, Object> map) {
	Map<String,Object> returnMap=new HashMap<>();
	MstUserBo bo=(MstUserBo)map.get("webBo");
	int count = allMainRepository.updateMstUser(bo);
	if(count <= 0) {
		returnMap.put("returnMsg", Constants.MSG_ERROR);
		return returnMap;			
	}
	else {
		returnMap.put("returnMsg", Constants.MSG_SUCCESS);
		returnMap.put("bo", bo);
		return returnMap;
	}	
}
}
