package com.scit.test43.dao;

import java.util.ArrayList;

import com.scit.test43.vo.ReviewVO;

public interface ReviewMapper {
	//리뷰 작성
	int writeReview(ReviewVO review);
	//리뷰 수정
	int updateReview(ReviewVO review);
	//리뷰 삭제
	int deleteReview(int rv_num);
	//내가 쓴 리뷰 목록
	ArrayList<ReviewVO> selectMyReview(String st_id);
	//리뷰번호로 리뷰 선택
	ReviewVO selectReview(int rv_num);
	//선생님id로 리뷰 선택
	ArrayList<ReviewVO> selectTcReview(String tc_id);
}
