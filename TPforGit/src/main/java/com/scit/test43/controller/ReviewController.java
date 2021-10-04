package com.scit.test43.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scit.test43.dao.ReviewDAO;
import com.scit.test43.vo.ReviewVO;
import com.scit.test43.vo.TeacherVO;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewDAO dao;	
	
	//리뷰작성폼 이동
	@RequestMapping(value="writeForm", method = RequestMethod.GET)
	public String writeReviewForm(Model model, String tc_id) {
		model.addAttribute("tc_id", tc_id);
		return "writeReviewForm";
	}
	
	//리뷰작성
	@RequestMapping(value="writeReview", method=RequestMethod.POST)
	public String writeReview(ReviewVO review) {
		//후에 session 로그인 아이디로 변경
		//(String) session.getAttribute("loginId"))
		review.setRv_sender("momo");
		
		int cnt = dao.writeReview(review);
		if(cnt > 0) {
			System.out.println("입력 성공");
		}else {
			System.out.println("입력 실패");
		}
		return "redirect:/studentMypage";
	}
	
	//후기 목록폼 이동
	@RequestMapping(value = "selectMyReviewForm", method = RequestMethod.GET)
	public String selectMyReviewForm(Model model) {
		//후에 session 로그인 아이디로 변경
		String st_id = "momo";
		
		ArrayList<ReviewVO> selectMyReview = dao.selectMyReview(st_id);
		model.addAttribute("selectMyReview", selectMyReview);
	
	return "selectMyReviewForm";
	}
	
	//후기 삭제
	@RequestMapping(value="deleteReview", method = RequestMethod.GET)
	public String deleteReview(int rv_num) {
		int cnt = 0;
		cnt = dao.deleteReview(rv_num);
		
		if(cnt != 0) {
			System.out.println("후기 삭제 성공");
		}else {
			System.out.println("후기 삭제 실패");
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
			System.out.println("수정 성공");
		}else {
			System.out.println("수정 실패");
		}
		return "redirect:selectMyReviewForm";
	}
	
}
