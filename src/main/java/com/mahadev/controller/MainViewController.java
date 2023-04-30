package com.mahadev.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/main")
public class MainViewController {

	@RequestMapping(value = "loadDashboard")
	public ModelAndView loadDashboard(HttpServletRequest req,HttpServletResponse res)
	{
		String user_id=req.getParameter("user_id");
		if(!StringUtils.isBlank(user_id))
		{
			req.setAttribute("user_id", user_id);
		}
		else
		{
			req.setAttribute("user_id", "test");
		}
		return new ModelAndView("loadDashboard");
	}
	@RequestMapping(value = "/loadBookUsers")
	public ModelAndView loadBookUsers(HttpServletRequest req,HttpServletResponse res) {
		return new ModelAndView("loadBookUsers");
	}
}
