package com.mahadev.common.daoImpl;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mahadev.common.dao.LoginDao;
import com.mahadev.common.entityModel.LoginBo;
import com.mahadev.common.repo.AllRepo;
import com.mahadev.constant.Constants;

@Component
public class LoginDaoImpl implements LoginDao{
    @Autowired AllRepo allRepo;
	@Override
	public Map<String, Object> checkUserLogin(LoginBo userData) throws Exception {
		Map<String, Object>  retMap=new HashMap<String, Object>();
	    LoginBo loginBo=allRepo.getLoginRepo().getUserByIdPassword(userData.getUser_name(),userData.getPassword());
	    if(loginBo!=null && loginBo.getUser_name()!=null && !loginBo.getUser_name().equals("")) {
	    	retMap.put("msg", Constants.MSG_SUCCESS);
	    	retMap.put("loginBo", loginBo);
	    }else {
	    	retMap.put("msg", Constants.MSG_ERROR);
	    	retMap.put("error_message", "Invalid username or password");
	    }
		return retMap;
	}

}
