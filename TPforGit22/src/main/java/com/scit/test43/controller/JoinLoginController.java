package com.scit.test43.controller;

import org.springframework.beans.factory.annotation.Autowired; 


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scit.test43.service.JoinLoginService;
import com.scit.test43.vo.StudentVO;
import com.scit.test43.vo.TeacherVO;

@Controller
public class JoinLoginController {
	
	@Autowired
	private JoinLoginService service;
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(TeacherVO account) {
		return service.login(account);
	}

	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "/loginForm";
	}

	
	@RequestMapping(value = "/Login/tcLogout", method = RequestMethod.GET)
	public String tcLogout() {
		return service.tcLogout();
	}
	
	@RequestMapping(value = "/Login/stLogout", method = RequestMethod.GET)
	public String stLogout() {
		return service.stLogout();
	}
}
