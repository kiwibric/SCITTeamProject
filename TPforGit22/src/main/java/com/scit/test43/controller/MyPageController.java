package com.scit.test43.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scit.test43.dao.MyPageDAO;
import com.scit.test43.dao.ReviewDAO;
import com.scit.test43.dao.ReviewMapper;
import com.scit.test43.vo.ReviewVO;
import com.scit.test43.vo.StudentVO;
import com.scit.test43.vo.TeacherVO;

@Controller
public class MyPageController {

	@Autowired
	MyPageDAO dao;
	
	//ReviewDAO
	@Autowired
	ReviewDAO rdao;
	
	//선생님 마이페이지 폼이동
	@RequestMapping(value ="teacherMypage", method = RequestMethod.GET)
	public String teacherMyPageForm(Model model) {
	
	//후에 http에서 로그인 정보 받아올 예정
	String sg_teacher = "mosi";
	
	//선생님의 별점
	int tc_starAvg = dao.tc_starAvg(sg_teacher);
	model.addAttribute("tc_starAvg", tc_starAvg);
		
	
	//새로 받은 신청 목록(학생이름 나이 성별 지역 별점) 선생님 id필요\
	ArrayList<StudentVO> newStudent =	dao.newSugangList(sg_teacher);
	model.addAttribute("newStudent", newStudent);
	
	
	//수락한 강의 목록(학생이름 나이 성별 지역 별점 연락처) 선생님 id필요
	ArrayList<StudentVO> acceptStudent = dao.acceptSugangList(sg_teacher);
	model.addAttribute("acceptStudent", acceptStudent);
		
	return "teacherMypageForm";
	}
	
	//신청 받은 강의를 수락할 경우 update폼
	@RequestMapping(value = "acceptSugang", method = RequestMethod.GET)
	public String acceptSugang(int sg_num) {
		
	int cnt = dao.acceptSugang(sg_num);
	if(cnt == 0) {
		System.out.println("신청 수락 실패");
	}else {
		System.out.println("신청 수락 성공");
	}
	
	// 다시 선생님 마이페이지로 돌아가 update된 정보 확인
	return "redirect:teacherMypage";
	}
	
	//신청 받은 강의를 거절할 경우 update폼
	@RequestMapping(value = "refuseSugang", method = RequestMethod.GET)
	public String refuseSugang(int sg_num) {
			
	int cnt = dao.refuseSugang(sg_num);
	if(cnt == 0) {
		System.out.println("신청 거절 실패");
	}else {
		System.out.println("신청 거절 성공");
	}
		
	// 다시 선생님 마이페이지로 돌아가 update된 정보 확인
	return "redirect:teacherMypage";
	}
	
	
	//내 정보 수정 페이지로 이동
	@RequestMapping(value = "updateMyInfoForm", method = RequestMethod.GET)
	public String updateMyInfoForm(Model model) {
		//내 기존 정보 불러오기
		String tc_id = "mosi";
		
		TeacherVO teacherInfo = dao.selectTeacherInfo(tc_id);
		model.addAttribute("teacherInfo", teacherInfo);
		
		return "updateMyInfoForm";
		
	}
	//내 정보 수정
	@RequestMapping(value = "updateMyInfo", method = RequestMethod.POST)
	public String updateMyInfo(TeacherVO teacher) {
		System.out.println(teacher);
		
		int cnt = dao.updateMyInfo(teacher);
		System.out.println(cnt);
		if(cnt==0) {
			System.out.println("정보 수정 실패");
		}else {
			System.out.println("정보 수정 성공");
		}
		return "redirect:teacherMypage";
	}
	////////////////////////////////////////////////////학생 마이페이지
	
	
	//학생 마이페이지 폼이동
	@RequestMapping(value ="studentMypage", method = RequestMethod.GET)
	public String studentMyPageForm(Model model) {
		
		//후에 http에서 로그인 정보 받아올 예정
		String sg_student = "momo";
		
		//학생의 별점
		int st_starAvg = dao.st_starAvg(sg_student);
		model.addAttribute("st_starAvg", st_starAvg);
			
		
		//신청한 강의 목록(선생님이름 나이 강의 언어 지역 별점) 학생 id필요
		ArrayList<TeacherVO> applySugang =	dao.applySugang(sg_student);
		model.addAttribute("applySugang", applySugang);
		
		
		//수락받은 강의 목록(선생님이름 나이 강의언어 지역 별점 연락처) 학생 id필요
		ArrayList<TeacherVO> acceptedSugang = dao.acceptedSugang(sg_student);
		model.addAttribute("acceptedSugang", acceptedSugang);
		
		//거절된 강의 목록(선생님이름 나이 강의언어 지역 별점 연락처) 학생 id필요
		ArrayList<TeacherVO> refusedSugang = dao.refusedSugang(sg_student);
		model.addAttribute("refuesdSugang", refusedSugang);
		
		//내가 쓴 강의 목록. 학생 id필요
		ArrayList<ReviewVO> selectMyReview = rdao.selectMyReview(sg_student);
		model.addAttribute("selectMyReview", selectMyReview);
		
		//내가 쓴 후기 개수 확인(후기작성 버튼 활성/비활성 사용)
		int ReviewCount = selectMyReview.size();
		model.addAttribute("ReviewCount", ReviewCount);
		
	return "studentMypageForm";
	}
	
	@RequestMapping(value = "deleteSugang", method = RequestMethod.GET)
	public String delteSugang(int sg_num) {
		int cnt = 0;
		cnt = dao.deleteSugang(sg_num);
		
		if(cnt != 0) {
			System.out.println("수강신청 내역 삭제 성공");
		}else {
			System.out.println("수강신청 내역 삭제 실패");
		}
		return "redirect:studentMypage";
		
	}
	
	//내 정보 수정 페이지로 이동
		@RequestMapping(value = "updateStMyInfoForm", method = RequestMethod.GET)
		public String updateStMyInfoForm(Model model) {
			//내 기존 정보 불러오기
			String st_id = "momo";
			
			StudentVO studentInfo = dao.selectStudentInfo(st_id);
			model.addAttribute("studentInfo", studentInfo);
			
			return "updateStMyInfoForm";
			
		}
	
	
	//학생 정보 수정
		@RequestMapping(value = "updateStMyInfo", method = RequestMethod.POST)
		public String updateStMyInfo(StudentVO student) {
			System.out.println(student);
			
			int cnt = dao.updateStMyInfo(student);
			System.out.println(cnt);
			if(cnt==0) {
				System.out.println("정보 수정 실패");
			}else {
				System.out.println("정보 수정 성공");
			}
			return "redirect:teacherMypage";
		}
		
	
}
