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
	
	@RequestMapping(value = "/Login/JoinStudent" , method = RequestMethod.GET)
	public String joinStudent() {
		return "Login/JoinStudent";
	}
	@RequestMapping(value = "/Login/joinStudent" , method = RequestMethod.POST)
	public String join(StudentVO student) {
		return service.JoinStudent(student);
	}
	@RequestMapping(value = "/Login/JoinTeacher" , method = RequestMethod.GET)
	public String joinTeacher() {
		return "Login/JoinTeacher";
	}
	@RequestMapping(value = "/Login/join2" , method = RequestMethod.POST)
	public String join(TeacherVO teacher) {
		return service.JoinTeacher(teacher);
	}

	@RequestMapping(value = "/Login/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "Login/loginForm";
	}

	@RequestMapping(value = "/Login/login", method = RequestMethod.POST)
	public String login(StudentVO student) {
		return service.login(student);
	}
	
	@RequestMapping(value = "/Login/logout", method = RequestMethod.GET)
	public String logout() {
		return service.logout();
	}
}
