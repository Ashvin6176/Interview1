package com.mahadev.serviceImpl;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Random;
import java.util.ResourceBundle;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mahadev.common.entityModel.WebResponseJsonBo;
import com.mahadev.constant.Constants;
import com.mahadev.dao.MainDao;
import com.mahadev.entityModel.MstUserBo;
import com.mahadev.repo.AllMainRepository;
import com.mahadev.service.MainService;
import com.poiji.bind.Poiji;
import com.poiji.option.PoijiOptions;
import com.poiji.option.PoijiOptions.PoijiOptionsBuilder;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainDao mainDao;

	@Override
	public WebResponseJsonBo updateMstUser(Map<String, Object> map) {
		WebResponseJsonBo obj=new WebResponseJsonBo();
		MstUserBo bo=(MstUserBo) map.get("webBo");
		if(bo.getUser_id() > 0) {
			obj.setReturn_message("Data is not found..!");
			obj.setStatus(Constants.ERROR_CODE);
			obj.setValidated(false);
			return obj;	
		}
		
		Map<String,Object> returnMap = mainDao.updateMstUser(map);
		String msg=(String)returnMap.get("returnMsg");
		
		if(!StringUtils.isBlank(msg) && msg.equals(Constants.MSG_SUCCESS)) {
			obj.setMessage_description("Data Updated Successfully.");
			obj.setStatus(Constants.SUCCESS_CODE);
			obj.setValidated(true);
			return obj;
		}
		else {
			obj.setReturn_message("Something went wrong..!");
			obj.setStatus(Constants.ERROR_CODE);
			obj.setValidated(false);
			return obj;
		}
	}

	@Override
	public WebResponseJsonBo saveMstCreateUser(Map<String, Object> map) throws IOException {
		WebResponseJsonBo obj=new WebResponseJsonBo();
		Map<String, Object> returnMap = mainDao.saveMstCreateUser(map);
		String msg=(String)returnMap.get("returnMsg");
		
		if(!StringUtils.isBlank(msg) && msg.equals(Constants.MSG_SUCCESS)) {
			obj.setMessage_description("Data Submitted Sucessfully.");
			obj.setStatus(Constants.SUCCESS_CODE);
			obj.setValidated(true);
			return obj;
		}
		else {
			obj.setReturn_message("Something went wrong..!");
			obj.setStatus(Constants.ERROR_CODE);
			obj.setValidated(false);
			return obj;
		}
	}

	

	@Override
	public WebResponseJsonBo ActivateDeActivateMstUser(Map<String, Object> map) {
		WebResponseJsonBo obj = new WebResponseJsonBo();
		MstUserBo bo=(MstUserBo) map.get("webBo");
		if(bo.getUser_id() > 0) {
			obj.setReturn_message("Data is not found..!");
			obj.setStatus(Constants.ERROR_CODE);
			obj.setValidated(false);
			return obj;	
		}
		Map<String, Object> returnMap= mainDao.ActivateDeActivateMstUser(map);
		String msg = (String) returnMap.get("returnMsg");
		
		if(!StringUtils.isBlank(msg) && msg.equals(Constants.MSG_SUCCESS)) {
			if(bo.getStatus().equals("0")) {
				obj.setMessage_description("User De-Activated sucessfully.");
			}
			else {
				obj.setMessage_description("User Activated sucessfully.");	
			}
			obj.setStatus(Constants.SUCCESS_CODE);
			obj.setValidated(true);
			return obj;	
		}
		else {
			obj.setReturn_message("Something went wrong..!");
			obj.setStatus(Constants.ERROR_CODE);
			obj.setValidated(false);
			return obj;
		}
	}
	
	@Override
	public WebResponseJsonBo saveAddBookEntry(Map<String, Object> map) throws IOException {
		WebResponseJsonBo obj=new WebResponseJsonBo();
		Map<String, Object> returnMap = mainDao.saveAddBookEntry(map);
		String msg=(String)returnMap.get("returnMsg");
		
		if(!StringUtils.isBlank(msg) && msg.equals(Constants.MSG_SUCCESS)) {
			obj.setMessage_description("Book Entry Sucessfully.");
			obj.setStatus(Constants.SUCCESS_CODE);
			obj.setValidated(true);
			return obj;
		}
		else {
			obj.setReturn_message("Something went wrong..!");
			obj.setStatus(Constants.ERROR_CODE);
			obj.setValidated(false);
			return obj;
		}
	}
}
