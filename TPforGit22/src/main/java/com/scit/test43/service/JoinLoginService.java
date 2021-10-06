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

	public String login(StudentVO student) {
		String path = "";

		StudentVO searchData = dao.searchStudent(student.getSt_id());
		if (searchData == null) {
			System.out.println("id가 없는 상황");
			path = "redirect:/Login/loginForm";
		} else {
			if (student.getSt_id().equals(searchData.getSt_id())) {
				session.setAttribute("loginId", searchData.getSt_id());
				path = "redirect:/";
			} else {
				System.out.println("비밀번호가 틀린 상황");
				path = "redirect:/Login/loginForm";
			}
		}
		return path;
	}
	
	public String teacherLogin(TeacherVO teacher) {
		String path = "";
		String tc_id = teacher.getTc_id();
		TeacherVO searchTeacherData = dao.searchTeacher(tc_id);
		if(searchTeacherData == null) {
			System.out.println("id가 없는 상황");
			path = "redirect:/Login/loginForm";
		}else {
			if(teacher.getTc_id().equals(searchTeacherData.getTc_id())){
				session.setAttribute("loginId", searchTeacherData.getTc_id());
				path = "redirect:/";
			}else {
				System.out.println("비밀번호가 틀린 상황");
				path = "redirect:/Login/loginForm";
			}
		}return path;
	}

	public String logout() {
		session.removeAttribute("loginId");
		session.removeAttribute("loginNm");
		return "redirect:/";
	}
	
	public String JoinStudent(StudentVO student) {
		String path = "";
		int cnt = dao.JoinStudent(student);
		if(cnt > 0) {
			path = "redirect:/";
		}else {
			path = "redirect:/Login/JoinStudent";
		}return path;
	}
	public String JoinTeacher(TeacherVO teacher){
		String path = "";
		int cnt = dao.JoinTeacher(teacher);
		if(cnt > 0) {
			path = "redirect:/";
		}else {
			path = "redirect:/JoinTeacher";
		}
	return path;
	}
}