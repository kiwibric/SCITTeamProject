package com.scit.test43.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scit.test43.dao.ReviewDAO;
import com.scit.test43.dao.TeacherDAO;
import com.scit.test43.vo.ReviewVO;
import com.scit.test43.vo.TeacherVO;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewDAO dao;
	
	//TeacherDAO
	@Autowired
	TeacherDAO tdao;
	
	//후에 http에서 로그인 정보 받아올 예정
	//(String) session.getAttribute("loginId"))
	String loginId = "momo";
	
	//후기 작성폼 이동
	@RequestMapping(value="writeForm", method = RequestMethod.GET)
	public String writeReviewForm(Model model, String rv_target) {
		model.addAttribute("rv_target", rv_target);
		return "writeReviewForm";
	}
	
	//후기 작성
	@RequestMapping(value="writeReview", method=RequestMethod.POST)
	public String writeReview(ReviewVO review) {
		review.setRv_sender(loginId);
		int cnt = dao.writeReview(review);
		if(cnt > 0) {
			//별점 평균 업데이트
			int result1 = dao.updateStAvg();
			int result2 = dao.updateTcAvg();
			if(result1 > 0 || result2 > 0) {
				System.out.println("별점 업데이트 성공");
			}else {
				System.out.println("별점 업데이트 실패");
			}
		}else {
			System.out.println("입력 실패");
		}
		ArrayList<TeacherVO> teacher = tdao.list();
		for(TeacherVO t : teacher) {
			if(t.getTc_id().equals(loginId)) {
				return "redirect:/teacherMypage";
			}
		}
		return "redirect:/studentMypage";
	}

	//후기 목록폼 이동
	@RequestMapping(value = "selectMyReviewForm", method = RequestMethod.GET)
	public String selectMyReviewForm(Model model) {
		//후에 session 로그인 아이디로 변경
		//(String) session.getAttribute("loginId"))
		String rv_sender = "momo";
		
		ArrayList<ReviewVO> selectMyReview = dao.selectMyReview(rv_sender);
		model.addAttribute("selectMyReview", selectMyReview);
	
	return "selectMyReviewForm";
	}
	
	//후기 삭제
	@RequestMapping(value="deleteReview", method = RequestMethod.GET)
	public String deleteReview(int rv_num) {
		int cnt = 0;
		cnt = dao.deleteReview(rv_num);
		if(cnt > 0) {
			//별점 평균 업데이트
			int result1 = dao.updateStAvg();
			int result2 = dao.updateTcAvg();
			if(result1 > 0 || result2 > 0) {
				System.out.println("별점 업데이트 성공");
			}else {
				System.out.println("별점 업데이트 실패");
			}
		}else {
			System.out.println("입력 실패");
		}
		ArrayList<TeacherVO> teacher = tdao.list();
		for(TeacherVO t : teacher) {
			if(t.getTc_id().equals(loginId)) {
				return "redirect:/teacherMypage";
			}
		}
		return "redirect:/studentMypage";
	}
	
	//후기 수정폼 이동
		@RequestMapping(value = "updateReviewForm", method = RequestMethod.GET)
		public String updateReviewForm(Model model, int rv_num) {
			ReviewVO review = dao.selectReview(rv_num);
			model.addAttribute("review", review);
			return "updateReviewForm";
		}
	
	//후기 수정
	@RequestMapping(value="updateReview", method = RequestMethod.POST)
	public String updateReview(ReviewVO review) {
		if (review.getRv_star()==1)
			review.setRv_star(1);
		else if (review.getRv_star()==2)
			review.setRv_star(2);
		else if (review.getRv_star()==3)
			review.setRv_star(3);
		else if (review.getRv_star()==4)
			review.setRv_star(4);
		else
			review.setRv_star(5);
		int cnt = dao.updateReview(review);
		if(cnt > 0) {
			//별점 평균 업데이트
			int result1 = dao.updateStAvg();
			int result2 = dao.updateTcAvg();
			if(result1 > 0 || result2 > 0) {
				System.out.println("별점 업데이트 성공");
			}else {
				System.out.println("별점 업데이트 실패");
			}
		}else {
			System.out.println("입력 실패");
		}
		return "redirect:/selectMyReviewForm";
	}
	
}
