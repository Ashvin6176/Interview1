/**
 * 
 */
package com.utils;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import com.mahadev.configuration.ConfigLoadMapDynamically;
import com.utils.CommonUtility;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.util.JRLoader;

/**
 * @author BAGHEL MIT
 *
 */
public class GenerateJasper {
	
	@SuppressWarnings("rawtypes")
	public byte[] generatePDF(HttpServletRequest request,String jasperName, ArrayList arrBeanData)throws Exception
	{
		
		FileInputStream fileInputStream = null;
		File jasperFile = null;
		String filePath =CommonUtility.getJasperPath(request);
		
		filePath=filePath+"/"+jasperName+".jasper";
		jasperFile=new File(filePath);
		fileInputStream = new FileInputStream(jasperFile);
		
		JasperReport jasperReport = (JasperReport) JRLoader.loadObject(fileInputStream);
		JRDataSource jrdatasource = new JRBeanCollectionDataSource(arrBeanData);
		JasperPrint jpPrintObj = JasperFillManager.fillReport(jasperReport,null, jrdatasource);
		byte[] pdfFile = JasperExportManager.exportReportToPdf(jpPrintObj);
		return pdfFile;
	}
	
	
}
