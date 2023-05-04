package com.mahadev.controller;

import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.ws.rs.core.Context;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mahadev.common.entityModel.WebResponseJsonBo;
import com.mahadev.constant.Constants;
import com.mahadev.constant.UrlConstatnt;
import com.mahadev.entityModel.MstBookEntryBo;
import com.mahadev.entityModel.MstUserBo;
import com.mahadev.entityModel.TrnEmiEntryBo;
import com.mahadev.service.MainService;
import com.utils.CommonUtility;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value = "/mainAjax")
@Slf4j
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	    dateFormat.setLenient(false);
	    
	    // this will allow 1000 size of array.
	    binder.setAutoGrowCollectionLimit(1000);

	    // true passed to CustomDateEditor constructor means convert empty String to null
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	    
	}
	
	@PostMapping(value = UrlConstatnt.saveMstCreateUser,consumes=MediaType.MULTIPART_FORM_DATA_VALUE)
	public ResponseEntity<WebResponseJsonBo> saveMstCreateUser(@RequestBody @ModelAttribute MstUserBo bo,@PathVariable("crtUser") String crtUser, @Context HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		Map<String, Object> map = new HashMap<>();
		bo.setCrtDate(new Date());
		bo.setCrtIp(CommonUtility.getIp(req));
		bo.setCrtUser(crtUser);
		bo.setStatus(Constants.Active);
		map.put("webBo", bo);
		WebResponseJsonBo obj = mainService.saveMstCreateUser(map);
		return ResponseEntity.ok(obj);
	}
	@PostMapping(value = UrlConstatnt.updateMstUser)
	public ResponseEntity<WebResponseJsonBo> updateMstUser(@PathVariable("crtUser") String crtUser,@RequestBody @ModelAttribute MstUserBo bo, HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		Map<String, Object> map = new HashMap<>();
		bo.setLstUpdDate(new Date());
		bo.setLstUpdIp(CommonUtility.getIp(req));
		bo.setLstUpdUser(crtUser);
		bo.setStatus(Constants.Active);
		map.put("webBo", bo);
		WebResponseJsonBo obj = mainService.updateMstUser(map);
		return ResponseEntity.ok(obj);
	}
	
	@PostMapping(value = UrlConstatnt.ActivateDeActivateMstUser)
	public ResponseEntity<WebResponseJsonBo> ActivateDeActivateMstUser(@PathVariable("crtUser") String crtUser,@ModelAttribute MstUserBo bo, HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		Map<String, Object> map = new HashMap<>();
		bo.setLstUpdDate(new Date());
		bo.setLstUpdIp(CommonUtility.getIp(req));
		bo.setLstUpdUser(crtUser);
		map.put("webBo", bo);
		WebResponseJsonBo obj = mainService.ActivateDeActivateMstUser(map);
		return ResponseEntity.ok(obj);
	}
	// Add book entry
	@PostMapping(value = UrlConstatnt.saveAddBookEntry)
	public ResponseEntity<WebResponseJsonBo> saveAddBookEntry(@RequestBody @ModelAttribute MstBookEntryBo bo,@PathVariable("crtUser") String crtUser, @Context HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		Map<String, Object> map = new HashMap<>();
		bo.setCrtDate(new Date());
		bo.setCrtIp(CommonUtility.getIp(req));
		bo.setCrtUser(crtUser);
		bo.setStatus(Constants.Active);
		map.put("webBo", bo);
		WebResponseJsonBo obj = mainService.saveAddBookEntry(map);
		return ResponseEntity.ok(obj);
	}
	@PostMapping(value = UrlConstatnt.saveAddInstallment)
	public ResponseEntity<WebResponseJsonBo> saveAddInstallment(@RequestBody @ModelAttribute TrnEmiEntryBo bo,@PathVariable("crtUser") String crtUser, @Context HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		Map<String, Object> map = new HashMap<>();
		bo.setCrtDate(new Date());
		bo.setCrtIp(CommonUtility.getIp(req));
		bo.setCrtUser(crtUser);
		bo.setStatus(Constants.Active);
		map.put("webBo", bo);
		WebResponseJsonBo obj = mainService.saveAddInstallment(map);
		return ResponseEntity.ok(obj);
	}
}
