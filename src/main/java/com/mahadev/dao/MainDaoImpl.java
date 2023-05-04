package com.mahadev.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mahadev.constant.Constants;
import com.mahadev.entityModel.DtlEmiEntryBo;
import com.mahadev.entityModel.MstBookEntryBo;
import com.mahadev.entityModel.MstUserBo;
import com.mahadev.entityModel.TrnEmiEntryBo;
import com.mahadev.repo.AllMainRepository;
import com.utils.CommonUtility;
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
public Map<String, Object> saveMstCreateUser(Map<String, Object> map) throws IOException {
	Map<String, Object> returnMap=new HashMap<>();
	MstUserBo bo=(MstUserBo)map.get("webBo");
	if(bo.getCheck_temp()!=null) {
		InputStream is=bo.getCheck_temp().getInputStream();
		byte[] check_bytes=is.readAllBytes();
		bo.setCheck_img(check_bytes);
		bo.setCheck_exe(CommonUtility.getExtension(bo.getCheck_temp().getOriginalFilename()));
	}
	if(bo.getAdhar()!=null) {
		InputStream is=bo.getAdhar().getInputStream();
		byte[] adhar_bytes=is.readAllBytes();
		bo.setAdharcard(adhar_bytes);
		bo.setAdhar_exe(CommonUtility.getExtension(bo.getAdhar().getOriginalFilename()));
	}
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

@Override
public Map<String, Object> saveAddBookEntry(Map<String, Object> map) throws IOException {
	Map<String, Object> returnMap=new HashMap<>();
	MstBookEntryBo bo=(MstBookEntryBo)map.get("webBo");
	bo.setIs_closed("N");
	bo=allMainRepository.getMstBookEntryRepo().save(bo);
	int noOfAdvInstallment=(bo.getAdvance_payment().divide(bo.getInstallment_amount())).intValue();
	Calendar cal=Calendar.getInstance();
	cal.setTime(bo.getEmi_start_date());
	cal.add(Calendar.DATE, bo.getNo_of_installment().intValue());
	
	TrnEmiEntryBo trnEmiEntryBo=new TrnEmiEntryBo();
	trnEmiEntryBo.setBook_id(bo.getBook_id());
	trnEmiEntryBo.setUser_id(bo.getUser_id());
	trnEmiEntryBo.setPayment_date(bo.getEmi_start_date());
	trnEmiEntryBo.setPayment_amount(bo.getAdvance_payment());
	trnEmiEntryBo.setStatus("1");
	trnEmiEntryBo.setCrtDate(new Date());
	trnEmiEntryBo.setCrtUser(bo.getCrtUser());
	trnEmiEntryBo.setCrtIp(bo.getCrtIp());
	
	trnEmiEntryBo=allMainRepository.getTrnEmiEntryRepo().save(trnEmiEntryBo);
	
	DtlEmiEntryBo dtlEmiEntryBo;
	for(int i=1 ; i<=noOfAdvInstallment;i++) {
		
		dtlEmiEntryBo=new DtlEmiEntryBo();
		
		dtlEmiEntryBo.setEmi_entry_id(trnEmiEntryBo.getEmi_entry_id());
		dtlEmiEntryBo.setInstallment_amount(bo.getInstallment_amount());
		dtlEmiEntryBo.setInstallment_date(cal.getTime());
		dtlEmiEntryBo.setStatus("1");
		dtlEmiEntryBo.setCrtDate(new Date());
		dtlEmiEntryBo.setCrtUser(bo.getCrtUser());
		dtlEmiEntryBo.setCrtIp(bo.getCrtIp());
		dtlEmiEntryBo.setIs_adv_inst("Y");
		allMainRepository.getDtlEmiEntryRepo().save(dtlEmiEntryBo);
		
		cal.add(Calendar.DATE, -1);
	}
	returnMap.put("returnMsg", Constants.MSG_SUCCESS);
	returnMap.put("bo", bo);		
	return returnMap;
}
@Override
@Transactional(rollbackOn = Exception.class)
public Map<String, Object> saveAddInstallment(Map<String, Object> map) throws IOException {
	Map<String, Object> returnMap=new HashMap<>();
	
	TrnEmiEntryBo bo=(TrnEmiEntryBo)map.get("webBo");
	MstBookEntryBo bookBo=allMainRepository.getMstBookEntryRepo().getOne(bo.getBook_id());
	List<DtlEmiEntryBo> emiList=allMainRepository.getDtlEmiEntryRepo().getBookEmi(bo.getUser_id(), bo.getBook_id());
	if(emiList==null || emiList.size() < bookBo.getNo_of_installment().intValue()) {
		bo=allMainRepository.getTrnEmiEntryRepo().save(bo);
		if(bo!=null && bo.getEmi_entry_id() > 0) {
			
				int noOfInstPaid=(bo.getPayment_amount().divide(bookBo.getInstallment_amount())).intValue();
				DtlEmiEntryBo dtlEmiEntryBo;
				Calendar cal=Calendar.getInstance();
				cal.setTime(bookBo.getEmi_start_date());
				DtlEmiEntryBo oldEmi;
				for(int i=1;i<=noOfInstPaid;i++) {
					
					dtlEmiEntryBo=new DtlEmiEntryBo();
					dtlEmiEntryBo.setEmi_entry_id(bo.getEmi_entry_id());
					dtlEmiEntryBo.setBook_id(bookBo.getBook_id());
					dtlEmiEntryBo.setUser_id(bookBo.getUser_id());
					dtlEmiEntryBo.setInstallment_amount(bookBo.getInstallment_amount());
					
					
					do {
						oldEmi=allMainRepository.getDtlEmiEntryRepo().getBookEmiBydate(bo.getUser_id(), bookBo.getBook_id(), cal.getTime());
						cal.set(Calendar.DATE, 1);
					} while (oldEmi!=null);
					
					dtlEmiEntryBo.setInstallment_date(cal.getTime());
					dtlEmiEntryBo.setCrtDate(new Date());
					dtlEmiEntryBo.setCrtUser(bo.getCrtUser());
					dtlEmiEntryBo.setCrtIp(bo.getCrtIp());
					dtlEmiEntryBo.setIs_adv_inst("N");
					
					allMainRepository.getDtlEmiEntryRepo().save(dtlEmiEntryBo);
					
					cal.set(Calendar.DATE, 1);
			}	
			returnMap.put("returnMsg", Constants.MSG_SUCCESS);
			returnMap.put("bo", bo);		
			return returnMap;
		}
	
	}
	
	return returnMap;
   }
}
