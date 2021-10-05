package com.scit.test43.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.test43.vo.ReviewVO;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSession session;
	//후기 작성
	public int writeReview(ReviewVO review) {
		ReviewMapper mapper = session.getMapper(ReviewMapper.class);
		int cnt = 0;
		
		try {
			cnt = mapper.writeReview(review);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	//후기 수정
	public int updateReview(ReviewVO review) {
		ReviewMapper mapper = session.getMapper(ReviewMapper.class);
		int cnt = 0;
		try {
			cnt = mapper.updateReview(review);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	//후기 삭제
	public int deleteReview(int rv_num) {
		ReviewMapper mapper = session.getMapper(ReviewMapper.class);
		int cnt = 0;
		
		try {
			cnt = mapper.deleteReview(rv_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	//후기관리
	public ArrayList<ReviewVO> selectMyReview(String st_id) {
		ArrayList<ReviewVO> selectMyReview = null;
		
		try {
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			selectMyReview = mapper.selectMyReview(st_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return selectMyReview;
	}
	//rv_num으로 후기 선택
	public ReviewVO selectReview(int rv_num) {
		ReviewVO review = null;
		try {
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			review = mapper.selectReview(rv_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return review;
	}
	//tc_num으로 후기 선택
	public ArrayList<ReviewVO> selectTcReview(String tc_id) {
		ArrayList<ReviewVO> selectTcReview = null;
		try {
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			selectTcReview = mapper.selectTcReview(tc_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return selectTcReview;
	}
}
