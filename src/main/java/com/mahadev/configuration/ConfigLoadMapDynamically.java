package com.mahadev.configuration;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.web.context.ServletContextAware;

import com.mahadev.entityModel.MstLabelBo;
import com.utils.CommonUtility;

/**
 * @author Baghel Mit
 * For Open menu by its screen id and Load Label File English and Kannada Dynamically For Each Label Add
 */
@Configuration
public class ConfigLoadMapDynamically implements ServletContextAware
{
//	@Autowired
//	private AllRepository allRepo;
	
	@Bean
	public Map<String,String> loadApplMenu(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		    Map<String,String> returnMap=new HashMap<String, String>();
			returnMap.put("11","loadPropertyTax");
			returnMap.put("21","loadBuildingNote");
			returnMap.put("22","loadApplNewWaterConnNote");
			returnMap.put("23","loadBuildDisWaterConnNote");
			returnMap.put("241","loadNewForm9");
			returnMap.put("242","loadMutation");
			returnMap.put("243","loadNewFrom9AppStatus");
			returnMap.put("25","loadForm9");
			returnMap.put("26","loadOccuoancyCertificate");
			returnMap.put("27","loadForm11");
			returnMap.put("31","loadBussLicenseNote");
			returnMap.put("32","loadTradeFactNote"); 
			returnMap.put("33","loadAdvertisingLicense");
			returnMap.put("41","loadMaintDrinkWaterNote");
			returnMap.put("42","loadMainStreetLightsNote");
			returnMap.put("43","loadMaintVillegeSantiNote");
			returnMap.put("51","loadOtherIssunceOfRecNote");
			returnMap.put("52","loadOtherIssuanceOfNOCNote");
			returnMap.put("53","loadOtherRoadCutPerNote");
			returnMap.put("54","loadEntmtLicense");
			returnMap.put("61","loadCitizenReg");
			returnMap.put("71","loadNotificationTemplate");
			returnMap.put("72","loadSMSEventMst");
			return returnMap;
	}
	

	//kuldipsinh
	/*
	 * @Bean public CommonsMultipartResolver commonsMultipartResolver() { final
	 * CommonsMultipartResolver commonsMultipartResolver = new
	 * CommonsMultipartResolver(); commonsMultipartResolver.setMaxUploadSize(-1);
	 * return commonsMultipartResolver; }
	 */

	
	public boolean generateLabelPropertyFile(String labelPath) throws Exception {
		try {

			Resource resource = new ClassPathResource("hrms_en.properties");
			File file = resource.getFile();
			if (file.exists()) {
				file.delete();
				file.createNewFile();
			} else {
				file.createNewFile();
			}
			Resource resource1 = new ClassPathResource("hrms_kn.properties");
			File file1 = resource1.getFile();
			if (file1.exists()) {
				file1.delete();
				file1.createNewFile();
			} else {
				file1.createNewFile();
			}
			List<MstLabelBo> list = new ArrayList<MstLabelBo>();
					//allRepo.getLableListData();
			OutputStream os, os1 = null;
			Properties propEn = new Properties();
			Properties propKn = new Properties();
			if (list != null && list.size() > 0) {
				for (MstLabelBo s : list) {
					if ("1".equals(s.getStatus())) {
						if (s.getLabel_eng_name() != null && s.getLabel_knd_name() != null) {
							propEn.setProperty(s.getLabel_key(), s.getLabel_eng_name());
							propKn.setProperty(s.getLabel_key(), s.getLabel_knd_name().trim());
						} else if (s.getLabel_eng_name() != null && s.getLabel_knd_name() == null) {
							propEn.setProperty(s.getLabel_key(), s.getLabel_eng_name());
							propKn.setProperty(s.getLabel_key(), s.getLabel_eng_name());
						} else if (s.getLabel_eng_name() == null && s.getLabel_knd_name() != null) {
							propEn.setProperty(s.getLabel_key(), s.getLabel_knd_name().trim());
							propKn.setProperty(s.getLabel_key(), s.getLabel_knd_name().trim());
						}
					} else if ("E".equals(s.getStatus())) {
						if (s.getLabel_eng_name() != null) {
							propEn.setProperty(s.getLabel_key(), s.getLabel_eng_name());
						} else if (s.getLabel_eng_name() != null) {
							propEn.setProperty(s.getLabel_key(), s.getLabel_knd_name().trim());
						}
					} else if ("K".equals(s.getStatus())) {
						if (s.getLabel_knd_name() != null) {
							propKn.setProperty(s.getLabel_key(), s.getLabel_knd_name().trim());
						} else if (s.getLabel_eng_name() != null) {
							propKn.setProperty(s.getLabel_knd_name(), s.getLabel_eng_name());
						}
					}
				}
			}

			os = new FileOutputStream(resource.getFile());
			os1 = new FileOutputStream(resource1.getFile());

			propEn.store(os, "US property file");
			propKn.store(os1, "Kannada property file");
			os.close();
			os1.close();
			return true;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return false;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	 
	
	public void seJasperPath(){
		try
		{
			if (CommonUtility.jasper_Path == null) {
	
					String p_path=this.getClass().getClassLoader().getResource("").getPath();
					String full_path=URLDecoder.decode(p_path,"UTF-8");
					String[] pathArr=full_path.split("/WEB-INF/classes/");
					String path="";
					if (CommonUtility.getOsName().equals("Linux")) {
						path=pathArr[0]+"//resources//jasper//";
					}else if (CommonUtility.getOsName().equals("Windows")) {
						path=pathArr[0]+"\\resources\\jasper\\";
					}else{
						path=pathArr[0]+"\\resources\\jasper\\";
					}
					CommonUtility.jasper_Path = path;
				}
		}catch(Exception e){
			System.out.println("Error in Set Jasper Path "+ e);
			e.printStackTrace();
		}
	}
	
	public boolean setPropertyLabelPath() throws IOException{
		try{
			if (CommonUtility.label_Path == null) {
					String p_path=this.getClass().getClassLoader().getResource("").getPath();
					String full_path=URLDecoder.decode(p_path,"UTF-8");
					String[] pathArr=full_path.split("/WEB-INF/classes/");
					String path="";
					if (CommonUtility.getOsName().equals("Linux")) {
						path=pathArr[0];
					}else if (CommonUtility.getOsName().equals("Windows")) {
						path=pathArr[0];
					}else{
						path=pathArr[0];
					}
					CommonUtility.label_Path = path;
				}
			}catch(Exception e){
				System.out.println("Error in Set Jasper Path "+ e);
				e.printStackTrace();
			}
		 return true;
	}

	//LALJI

	@Override
	public void setServletContext(ServletContext servletContext) {
		// TODO Auto-generated method stub
		
		try {
			if (setPropertyLabelPath()) {
//				generateLabelPropertyFile(CommonUtility.label_Path);
//				getAllMenuXmlFileFromLocalPath(servletContext);
			}
		} catch (Exception e) {
			e.printStackTrace(); 
		}
		
	}
	
	public static void getAllMenuXmlFileFromLocalPath(ServletContext request) throws IOException {

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
	}
	
	//LALJI
}