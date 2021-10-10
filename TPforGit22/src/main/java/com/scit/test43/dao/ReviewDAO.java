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
		int cnt = 0;
		try {
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			cnt = mapper.writeReview(review);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	//학생 후기 수정
	public int updateReview(ReviewVO review) {
		int cnt = 0;
		try {
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			cnt = mapper.updateReview(review);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	//후기 삭제
	public int deleteReview(int rv_num) {
		int cnt = 0;
		try {
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			cnt = mapper.deleteReview(rv_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	//후기관리
	public ArrayList<ReviewVO> selectMyReview(String rv_sender) {
		ArrayList<ReviewVO> selectMyReview = null;
		try {
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			selectMyReview = mapper.selectMyReview(rv_sender);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return selectMyReview;
	}
	//후기 목록
	public ArrayList<ReviewVO> selectTcMyReview(String rv_sender){
		ArrayList<ReviewVO> selectTcMyReview = null;
		try {
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			selectTcMyReview = mapper.selectTcMyReview(rv_sender);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return selectTcMyReview;
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
	public ArrayList<ReviewVO> selectTrReview(String tc_id) {
		ArrayList<ReviewVO> selectTrReview = null;
		try {
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			selectTrReview = mapper.selectTrReview(tc_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return selectTrReview;
	}
	//선생님 별점 평균 업데이트
	public int updateTcAvg() {
		int cnt = 0;
		try {
			ReviewMapper mapper = session.getMapper(ReviewMapper.class);
			cnt = mapper.updateTcAvg();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	//학생 별점 평균 업데이트
		public int updateStAvg() {
			int cnt = 0;
			try {
				ReviewMapper mapper = session.getMapper(ReviewMapper.class);
				cnt = mapper.updateStAvg();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return cnt;
		}
		
}
