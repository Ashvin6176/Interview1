package com.mahadev.common.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.json.JSONArray;
import org.postgresql.util.PGobject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mahadev.common.entityModel.ProcedureParam;
import com.mahadev.common.entityModel.WebResponseJsonBo;
import com.mahadev.common.service.CommonProcedureService;
import com.utils.CommonUtility;

@Controller
@RequestMapping(value = "/ajax")
public class AjaxCommonController {

	@Autowired
	CommonProcedureService commonProcSer;

	// LALJI LILAPARA

	@RequestMapping(value = "/getHrmsWebService", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Object> getHrmsWebService(@RequestBody String reqData, HttpServletRequest req)
			throws Exception {
		WebResponseJsonBo obj = new WebResponseJsonBo();
		if (reqData != null && !("").equals(reqData)) {
			reqData = reqData.replaceAll("[\\n\\t\\r ]", "");
			reqData = reqData.replaceAll("[{}\"]", "");
			reqData = reqData.replace(":", ",").trim();
			reqData = reqData.replace("=", ",").trim();
		}
		String service_name = req.getParameter("serviceName");
		String service_type = req.getParameter("serviceType");
		String crtUser = req.getParameter("crtUser");
		String crtIp = req.getParameter("crtIp");
//		String andClause = createDynamicAndClause(reqData, "");
		Map<String, Object> returnMap = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<>();
		map.put("serviceName", service_name);
		map.put("serviceType", service_type);
		map.put("reqdata", reqData);
//		map.put("crtUser", crtUser);
//		map.put("crtIp", crtIp);
		returnMap = commonProcSer.getHrmsCommonWebService(map);

		if (returnMap != null && returnMap.size() > 0 && !returnMap.isEmpty()) {
			JSONArray json = (JSONArray) returnMap.get("json");
//			PGobject p=(PGobject) returnMap.get("P_OUT");
			if (json != null) {
//				return ResponseEntity.ok((Object) json.toString());
				obj.setResponseData(json.toString());
				obj.setStatus(1000);
//				obj.setProc_status(returnMap.get("msg").toString());
				return ResponseEntity.ok((Object)obj);
			} else {
				obj.setStatus(999);
//				obj.setP_OUT_MSG("false");
				obj.setError_message(returnMap);
				
				return ResponseEntity.ok((Object) obj);
			}
		} else {
			return ResponseEntity.ok(null);
		}
	}
	//not in use
	@RequestMapping(value = "/getUserManagementWebService", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Object> getUserManagementWebService(@RequestBody String reqData, HttpServletRequest req)
			throws Exception {
		WebResponseJsonBo obj = new WebResponseJsonBo();
		if (reqData != null && !("").equals(reqData)) {
			reqData = reqData.replaceAll("[\\n\\t\\r ]", "");
			reqData = reqData.replaceAll("[{}\"]", "");
			reqData = reqData.replace(":", ",").trim();
			reqData = reqData.replace("=", ",").trim();
		}
		String service_name = req.getParameter("serviceName");
		String service_type = req.getParameter("serviceType");
//		String andClause = createDynamicAndClause(reqData, "");
		Map<String, Object> returnMap = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<>();
		map.put("serviceName", service_name);
		map.put("serviceType", service_type);
		map.put("reqdata", reqData);
		returnMap = commonProcSer.getUserManagementWebService(map);

		if (returnMap != null && returnMap.size() > 0 && !returnMap.isEmpty()) {
			JSONArray json = (JSONArray) returnMap.get("json");
//			PGobject p=(PGobject) returnMap.get("P_OUT");
			if (json != null) {
//				return ResponseEntity.ok((Object) json.toString());
				obj.setResponseData(json.toString());
				obj.setStatus(1000);
//				obj.setProc_status(returnMap.get("msg").toString());
				return ResponseEntity.ok((Object)obj);
			} else {
				obj.setStatus(200);
				return ResponseEntity.ok((Object) obj);
			}
		} else {
			return ResponseEntity.ok(null);
		}
	}
	

	
	public String createDynamicAndClause(String reqData, String reqType) throws Exception {
		StringBuilder b1 = null;
		try {
			b1 = new StringBuilder();
			if (reqData != null && !"".equals(reqData)) {
				String reqArray[] = reqData.split(",");

				if(reqArray.length == 1) {
					b1.append(" and 1=2");
					return b1.toString();
				}
				for (int i = 0; i < reqArray.length; i++) {
					if(reqArray[i] != null  && reqArray.length > 1 ) {
						if (reqArray[i+1] != null && !reqArray[i].equalsIgnoreCase("order_by")) {
							if (i != reqArray.length ) {
								b1.append(" and " + reqArray[i] + "= '" + reqArray[i + 1] + "'");
							} else {
								b1.append(reqArray[i] + "= '" + reqArray[i + 1] + "'");
							}
						}else {
							b1.append(" order by " + reqArray[i+1].replace("~", ","));
						}
					}
					i = i + 1;
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b1.toString();
	}
	
	@RequestMapping(value = "/getAllMenuXmlFileFromLocalPath", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Object> getAllMenuXmlFileFromLocalPath(ServletContext request) throws IOException {
		 
		WebResponseJsonBo obj = new WebResponseJsonBo();
		String filePath = CommonUtility.getAnyFilePath("menuXml");
		try {
			File f = new File(filePath);
			if (f.exists()) {
				File f2 = new File((CommonUtility.getJaxbXMLPath(request)));
				FileUtils.copyDirectory(f, f2);
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		}
		return ResponseEntity.ok(obj);
	}
	
	// LALJI LILAPARA

	
	// Start : Sajjad
	

	@RequestMapping(value = "/getHCGMasterWebServices", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Object> getHCGMasterWebServices(@RequestBody String reqData, HttpServletRequest req)
			throws Exception {
		WebResponseJsonBo obj = new WebResponseJsonBo();
		if (reqData != null && !("").equals(reqData)) {
			reqData = reqData.replaceAll("[\\n\\t\\r ]", "");
			reqData = reqData.replaceAll("[{}\"]", "");
			reqData = reqData.replace(":", ",").trim();
			reqData = reqData.replace("=", ",").trim();
		}
		String service_name = req.getParameter("service_name");
		String service_type = req.getParameter("serviceType");
		String andClause = createDynamicAndClause(reqData, "");
		Map<String, Object> returnMap = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<>();
		map.put("serviceName", service_name);
		map.put("serviceType", service_type);
		map.put("reqdata", andClause);
		returnMap = commonProcSer.getHCGMasterWebServices(map);

		if (returnMap != null && returnMap.size() > 0 && !returnMap.isEmpty()) {
			JSONArray json = (JSONArray) returnMap.get("json");
//			PGobject p=(PGobject) returnMap.get("P_OUT");
			if (json != null) {
				return ResponseEntity.ok((Object) json.toString());
//				obj.setResponseData(json.toString());
//				obj.setStatus(1000);
//				return ResponseEntity.ok((Object)obj);
			} else {
				obj.setStatus(200);
				return ResponseEntity.ok((Object) obj);
			}
		} else {
			return ResponseEntity.ok(null);
		}
	}

	// End : Sajjad
}
