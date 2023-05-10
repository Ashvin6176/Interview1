package com.mahadev.service;

import java.io.IOException;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.mahadev.common.entityModel.WebResponseJsonBo;

@Component
public interface MainService {
	WebResponseJsonBo updateMstUser(Map<String, Object> map);

	WebResponseJsonBo saveMstCreateUser(Map<String, Object> map)throws IOException;

	WebResponseJsonBo ActivateDeActivateMstUser(Map<String, Object> map);
	WebResponseJsonBo saveAddBookEntry(Map<String, Object> map)throws IOException;
	WebResponseJsonBo saveAddInstallment(Map<String, Object> map)throws IOException;
	
	WebResponseJsonBo deleteInstallment(Map<String, Object> map)throws IOException;
	WebResponseJsonBo saveOfficeTransaction(Map<String, Object> map)throws IOException;
}
