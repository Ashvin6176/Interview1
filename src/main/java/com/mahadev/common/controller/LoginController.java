package com.mahadev.common.controller;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.DigestException;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mahadev.common.entityModel.LoginBo;
import com.mahadev.common.entityModel.ResponseBo;
import com.mahadev.common.service.LoginService;
import com.mahadev.constant.Constants;
import com.utils.CommonUtility;

@Controller
@RequestMapping(value = "/login")
public class LoginController {
    @Autowired
    LoginService loginService;
    
	@RequestMapping(value = "loginPage")
	public ModelAndView loadLoginPage(HttpServletRequest request, HttpServletResponse response,RedirectAttributes redirectAttribute) {
		return new ModelAndView("loadloginPage");
	}
	
	@RequestMapping("/loadforgotPassword")
	public ModelAndView loadforgotPassword() {
		return new ModelAndView("loadforgotPassword");
	}
	@PostMapping(value="/CheckUserLogin")
	public ModelAndView checkUserLogin( @Valid @ModelAttribute LoginBo loginBo,BindingResult b, HttpServletRequest request,HttpServletResponse response,RedirectAttributes redirectAttribute) throws Exception{
		ResponseBo resData=new ResponseBo();
		String secret = Constants.KSBCL_LOGIN_SECRET_KEY_ID;
		
		String cipherText = loginBo.getPassword();

		byte[] cipherData = Base64.getDecoder().decode(cipherText);
		byte[] saltData = Arrays.copyOfRange(cipherData, 8, 16);

		MessageDigest md5 = MessageDigest.getInstance("MD5");
		final byte[][] keyAndIV = GenerateKeyAndIV(32, 16, 1, saltData, secret.getBytes(StandardCharsets.UTF_8), md5);
		SecretKeySpec key = new SecretKeySpec(keyAndIV[0], "AES");
		IvParameterSpec iv = new IvParameterSpec(keyAndIV[1]);

		byte[] encrypted = Arrays.copyOfRange(cipherData, 16, cipherData.length);
		Cipher aesCBC = Cipher.getInstance("AES/CBC/PKCS5Padding");
		aesCBC.init(Cipher.DECRYPT_MODE, key, iv);
		byte[] decryptedData = aesCBC.doFinal(encrypted);
		String decryptedText = new String(decryptedData, StandardCharsets.UTF_8);
		
		loginBo.setPassword(decryptedText);
		
		if(b.hasErrors())
		{
			
			Map<String,String> errorMap=new HashMap<String, String>();
			for(FieldError fe:b.getFieldErrors())
			{
				System.out.print(fe.getRejectedValue());
				errorMap.put(fe.getField(), fe.getDefaultMessage());
			}
			redirectAttribute.addFlashAttribute(Constants.MSG_PRIORITY, Constants.MSG_PRIORITY_SUCCESS);
			 redirectAttribute.addFlashAttribute(Constants.MSG_VALIDATION_ERRORS,errorMap);
			 redirectAttribute.addFlashAttribute("attempCount", resData.getValueOne());
			 return loadLoginPage(request, response, redirectAttribute);
		}
		loginBo.setCrtIp(CommonUtility.getIp(request));
		resData=loginService.checkUserLogin(loginBo);
		if(resData!=null && resData.getService_status().equals(Constants.MSG_PRIORITY_SUCCESS)) {
			HttpSession session=request.getSession(true);
			 loginBo=(LoginBo) resData.getService_data();
			session.setAttribute("user_id",  String.valueOf(loginBo.getUser_id()));
			session.setAttribute("user_name",  String.valueOf(loginBo.getUser_name()));
			return new ModelAndView("loadDashboard");
		}else {
			request.setAttribute("responseBo", resData);
			return loadLoginPage(request, response, redirectAttribute);
		}
		
	}	
	
	@RequestMapping(value = "/logout")
	public String loadLogout(HttpServletRequest request,HttpServletResponse response,RedirectAttributes redirectAttribute ) throws IOException {
		String text_type=request.getParameter("text_type");
		request.setAttribute("text_type",text_type);
		// get current session
		if(request.getSession() != null) {
			HttpSession session=request.getSession(false);
			if(session.getAttribute("user_id") !=null && session.getAttribute("user_id") != "")
			{
				session.invalidate();
			}
		}
		if(text_type != null && !text_type.equals("")) {
			redirectAttribute.addFlashAttribute(Constants.MSG_NAME,text_type );
			redirectAttribute.addFlashAttribute(Constants.MSG_PRIORITY, Constants.MSG_PRIORITY_SUCCESS);
			redirectAttribute.addFlashAttribute(Constants.MSG_TITLE, "Login");
		}
		 return "redirect:login";
		 
//		 return null;
		//return this.loadLoginPage();
	}
	public static byte[][] GenerateKeyAndIV(int keyLength, int ivLength, int iterations, byte[] salt, byte[] password, MessageDigest md) {

	    int digestLength = md.getDigestLength();
	    int requiredLength = (keyLength + ivLength + digestLength - 1) / digestLength * digestLength;
	    byte[] generatedData = new byte[requiredLength];
	    int generatedLength = 0;

	    try {
	        md.reset();

	        // Repeat process until sufficient data has been generated
	        while (generatedLength < keyLength + ivLength) {

	            // Digest data (last digest if available, password data, salt if available)
	            if (generatedLength > 0)
	                md.update(generatedData, generatedLength - digestLength, digestLength);
	            md.update(password);
	            if (salt != null)
	                md.update(salt, 0, 8);
	            md.digest(generatedData, generatedLength, digestLength);

	            // additional rounds
	            for (int i = 1; i < iterations; i++) {
	                md.update(generatedData, generatedLength, digestLength);
	                md.digest(generatedData, generatedLength, digestLength);
	            }

	            generatedLength += digestLength;
	        }

	        // Copy key and IV into separate byte arrays
	        byte[][] result = new byte[2][];
	        result[0] = Arrays.copyOfRange(generatedData, 0, keyLength);
	        if (ivLength > 0)
	            result[1] = Arrays.copyOfRange(generatedData, keyLength, keyLength + ivLength);

	        return result;

	    } catch (DigestException e) {
	        throw new RuntimeException(e);

	    } finally {
	        // Clean out temporary data
	        Arrays.fill(generatedData, (byte)0);
	    }
	}
}
