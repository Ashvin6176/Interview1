package com.mahadev.common.dao;

import java.util.Map;

import com.mahadev.common.entityModel.LoginBo;

public interface LoginDao {
	
	Map<String, Object> checkUserLogin(LoginBo userData)throws Exception;
}
