package com.mahadev.configuration;

import java.util.ArrayList;
import java.util.StringTokenizer;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.scrypt.SCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class UserInterceptor implements HandlerInterceptor {
	
	private static ArrayList<String> urlList;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		
		boolean flag=true;
		HttpSession session=request.getSession(false);
		
		String avoid_urls="/login/login,/CheckUserLogin,/login/logout,/setUserSessionDataFromUserID,/loadRegisterSupplierOrRetailer,/loadRetailerRegOutSideLogin,/dscRest";
		
		StringTokenizer token=new StringTokenizer(avoid_urls,",");
		
		if(urlList == null ) {
			urlList=new ArrayList<>();
			if(urlList.size()==0) {
				while(token.hasMoreTokens()){
					urlList.add(token.nextToken());
				}
			}
		}
		
		String url=request.getServletPath();
		boolean allowedRequest=true;
		
		
		
			if(urlList.contains(url) || url.contains("/webService")){
				allowedRequest=false;
			}
		
			/*
			 * long now = new Date().getTime(); long lastAccessed =
			 * session.getLastAccessedTime(); long timeoutPeriod =
			 * session.getMaxInactiveInterval(); long remainingTime = ((timeoutPeriod *
			 * 1000) - (now - lastAccessed))/1000; System.out.println("Remaining time is " +
			 * remainingTime + " seconds");
			 */
		
		if(allowedRequest) {
		
			if(session != null && session.getAttribute("user_id") != null && !("").equals(session.getAttribute("user_id"))){
				
				flag=true;
				
				HttpServletResponse httpres = (HttpServletResponse) response;
				httpres.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
				httpres.setHeader("Pragma", "no-cache"); // HTTP 1.0.
				httpres.setDateHeader("Expires", 0); // Proxies.
				
			}else {
				flag=false;
				if(isAjax(request))
				{
				
					response.sendError(401);
				}
				else
				{
					response.sendRedirect(request.getContextPath()+"/");
				}
			}
			
		}
		else
		{
			
		}
		
		return flag;
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}
	
   @Bean public SCryptPasswordEncoder passwordEncoder() { 
	  return new SCryptPasswordEncoder(); 
	  }
   
   public static boolean isAjax(HttpServletRequest request) {
	   return "XMLHttpRequest"
	             .equals(request.getHeader("X-Requested-With"));
	}

}
