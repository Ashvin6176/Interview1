package com.mahadev.common.serviceImpl;

import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mahadev.common.dao.LoginDao;
import com.mahadev.common.entityModel.LoginBo;
import com.mahadev.common.entityModel.ResponseBo;
import com.mahadev.common.service.LoginService;
import com.mahadev.constant.Constants;

@Component
public class LoginServiceImpl implements LoginService {
    
	@Autowired
    LoginDao loginDao;
	
	@Override
	public ResponseBo checkUserLogin(LoginBo userData) throws Exception {
		ResponseBo resObj = new ResponseBo();
		// check username and password
		Map<String, Object> returnMap = loginDao.checkUserLogin(userData);
		String msg = (String) returnMap.get("msg");

		if (!StringUtils.isBlank(msg) && msg.equals(Constants.MSG_SUCCESS)) {
			LoginBo loginBo = (LoginBo) returnMap.get("loginBo");
            resObj.setService_status(Constants.MSG_PRIORITY_SUCCESS);
			resObj.setService_data(loginBo);
		} else {
			resObj.setService_status(Constants.MSG_PRIORITY_ERROR);
			if (returnMap.get("error_message") != null)
				resObj.setService_message(returnMap.get("error_message").toString());
			else
				resObj.setService_message("Invalid Credentials..!!");
			resObj.setUser_id(0);
		}
		return resObj;

	}

}
