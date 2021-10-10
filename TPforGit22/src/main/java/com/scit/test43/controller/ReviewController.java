package com.scit.test43.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

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
	
	@Autowired
	private HttpSession session;
	
	//후기 작성폼 이동
	@RequestMapping(value="writeForm", method = RequestMethod.GET)
	public String writeReviewForm(Model model, String rv_target, String rv_sender) {
		model.addAttribute("rv_target", rv_target);
		model.addAttribute("rv_sender", rv_sender);
		System.out.println("보내는 사람" + rv_sender);
		return "writeReviewForm";
	}
	
	//후기 작성
	@RequestMapping(value="writeReview", method=RequestMethod.POST)
	public String writeReview(ReviewVO review, String rv_target, String rv_sender) {
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
			if(t.getTc_id().equals(rv_sender)) {
				return "redirect:/teacherMypage";
			}
		}
		return "redirect:/studentMypage";
	}

	//학생 후기 목록폼 이동
	@RequestMapping(value = "selectMyReviewForm", method = RequestMethod.GET)
	public String selectMyReviewForm(Model model, String rv_sender) {
		
		ArrayList<ReviewVO> selectMyReview = dao.selectMyReview(rv_sender);
		model.addAttribute("selectMyReview", selectMyReview);
	
	return "selectMyReviewForm";
	}
	//선생님 후기 목록폼 이동
	@RequestMapping(value = "selectTcMyReviewForm", method = RequestMethod.GET)
	public String selectTcMyReviewForm(Model model, String rv_sender) {
		
		ArrayList<ReviewVO> selectTcMyReview = dao.selectTcMyReview(rv_sender);
		model.addAttribute("selectTcMyReview", selectTcMyReview);
	
	return "selectTcMyReviewForm";
	}
	
	//후기 삭제
	@RequestMapping(value="deleteReview", method = RequestMethod.GET)
	public String deleteReview(int rv_num, String rv_target, String rv_sender) {
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
			if(t.getTc_id().equals(rv_sender)) {
				return "redirect:/teacherMypage";
			}
		}
		return "redirect:/studentMypage";
	}
	
	//학생 후기 수정폼 이동
	@RequestMapping(value = "updateReviewForm", method = RequestMethod.GET)
	public String updateReviewForm(Model model, int rv_num) {
		ReviewVO review = dao.selectReview(rv_num);
		model.addAttribute("review", review);
		return "updateReviewForm";
	}
	//선생님 후기 수정폼 이동
	@RequestMapping(value = "updateTcReviewForm", method = RequestMethod.GET)
	public String updateTcReviewForm(Model model, int rv_num) {
		ReviewVO review = dao.selectReview(rv_num);
		model.addAttribute("review", review);
		return "updateTcReviewForm";
	}
	
	//후기 수정
	@RequestMapping(value="updateReview", method = RequestMethod.POST)
	public String updateReview(ReviewVO review, String rv_sender) {
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
		return "redirect:/";
	}
	

	
}
