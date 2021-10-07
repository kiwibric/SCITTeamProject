package com.scit.test43.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.test43.vo.CommentReplyVO;
import com.scit.test43.vo.CommentVO;

@Repository
public class CommentDAO {
	@Autowired
	private SqlSession session;
	
	// 글 목록
	public ArrayList<CommentVO> commentList(String target, String searchText, int startRecord, int countPerPage) {
		ArrayList<CommentVO> list = null;
		try {
			CommentMapper mapper = session.getMapper(CommentMapper.class);
			RowBounds rb = new RowBounds(startRecord, countPerPage);
			list = mapper.commentList(target, searchText, rb);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 글 쓰기
	public int insertContent(Map<String, Object> paramMap) {
		int cnt = 0;
		try {
			CommentMapper mapper = session.getMapper(CommentMapper.class);
			cnt = mapper.insertContent(paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	// 글 수정
	public int updateContent(Map<String, Object> paramMap) {
		int cnt = 0;
		try {
			CommentMapper mapper = session.getMapper(CommentMapper.class);
			cnt = mapper.updateContent(paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	// 조회수 증가
	public void updateHits(Map<String, Object> paramMap) {
		try {
			CommentMapper mapper = session.getMapper(CommentMapper.class);
			mapper.updateHits(paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 글 읽기
	public CommentVO getContentView(Map<String, Object> paramMap) {
		CommentVO getContentView = null;
		try {
			CommentMapper mapper = session.getMapper(CommentMapper.class);
			getContentView = mapper.getContentView(paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return getContentView;
	}
	
	// 글 삭제
	public int deleteComment(Map<String, Object> paramMap) {
		int delComment = 0;
		try {
			CommentMapper mapper = session.getMapper(CommentMapper.class);
			delComment = mapper.deleteComment(paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return delComment;
	}
	
	// 전체글 개수 조회
	public int selectContentCnt(String searchText) {
		int cnt = 0;
		try {
			CommentMapper mapper = session.getMapper(CommentMapper.class);
			cnt = mapper.selectContentCnt(searchText);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	// 댓글

	public int regReply(Map<String, Object> paramMap) {
		int regReply = 0;
		try {
			CommentMapper mapper = session.getMapper(CommentMapper.class);
			regReply = mapper.regReply(paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return regReply;
	}

	public List<CommentReplyVO> getReplyList(Map<String, Object> paramMap) {
		List<CommentReplyVO> getReplyList = null;
		try {
			CommentMapper mapper = session.getMapper(CommentMapper.class);
			getReplyList = mapper.getReplyList(paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return getReplyList;
	}

	public int deleteCommentReplyAll(Map<String, Object> paramMap) {
		int deleteBoardReplyAll = 0;
		try {
			CommentMapper mapper = session.getMapper(CommentMapper.class);
			deleteBoardReplyAll = mapper.deleteCommentReplyAll(paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return deleteBoardReplyAll;
	}
	
	public int deleteCommentReply(Map<String, Object> paramMap) {
		int deleteCommentReply = 0;
		try {
			CommentMapper mapper = session.getMapper(CommentMapper.class);
			deleteCommentReply = mapper.deleteCommentReply(paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return deleteCommentReply;
	}

	public int getCommentCnt(Map<String, Object> paramMap) {
		int getCommentCnt = 0;
		try {
			CommentMapper mapper = session.getMapper(CommentMapper.class);
			getCommentCnt = mapper.getCommentCnt(paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return getCommentCnt;
	}


	public boolean checkReply(Map<String, Object> paramMap) {
		boolean checkReply = false;
		try {
			CommentMapper mapper = session.getMapper(CommentMapper.class);
			checkReply = mapper.checkReply(paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return checkReply;
	}

	public boolean updateReply(Map<String, Object> paramMap) {
		boolean updateReply = false;
		try {
			CommentMapper mapper = session.getMapper(CommentMapper.class);
			updateReply = mapper.updateReply(paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return updateReply;
	}
	
}
