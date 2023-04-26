package com.mahadev.common.service;

import org.springframework.stereotype.Service;

import com.mahadev.common.entityModel.LoginBo;
import com.mahadev.common.entityModel.ResponseBo;
@Service
public interface LoginService {
	
	ResponseBo checkUserLogin(LoginBo loginData)throws Exception;
}
