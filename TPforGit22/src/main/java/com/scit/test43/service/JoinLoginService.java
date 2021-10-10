package com.scit.test43.service;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.scit.test43.dao.JoinLoginDAO;
import com.scit.test43.vo.StudentVO;
import com.scit.test43.vo.TeacherVO;

@Service
public class JoinLoginService {
	@Autowired
	private JoinLoginDAO dao;
	
	@Autowired
	private HttpSession session;

	public String login(TeacherVO account) {
		String path = "";
		TeacherVO tsData = null;
		StudentVO ssData = null;
		
		System.out.println(account.getTc_pw());
		try {
			tsData = dao.searchTeacher(account.getTc_id());
			System.out.println(tsData);
		} catch (Exception e) {
			// TODO: handle exception
		}
		try {
			ssData = dao.searchStudent(account.getTc_id());
			System.out.println(ssData);
		} catch (Exception e) {
			// TODO: handle exception
		}	
		
		if(tsData != null) {
			if (account.getTc_pw().equals(tsData.getTc_pw())) {
				session.setAttribute("tcLogin", tsData.getTc_id());
				path = "redirect:teacherMypage";
			} else {
				System.out.println("비밀번호가 틀린 상황");
				path = "redirect:/loginForm";
			}
		} else if(ssData != null) {
			System.out.println(account.getTc_pw());
			if (account.getTc_pw().equals(ssData.getSt_pw())) {
				session.setAttribute("stLogin", ssData.getSt_id());
				path = "redirect:/";
			} else {
				System.out.println("비밀번호가 틀린 상황");
				path = "redirect:/loginForm";
			}
		} else {
			System.out.println("id가 없는 상황");
			path = "redirect:/loginForm";
		}
		return path;
	}
	
	public String tcLogout() {
		session.removeAttribute("tcLogin");
		return "redirect:/";
	}
	
	public String stLogout() {
		session.removeAttribute("stLogin");
		return "redirect:/";
	}
}