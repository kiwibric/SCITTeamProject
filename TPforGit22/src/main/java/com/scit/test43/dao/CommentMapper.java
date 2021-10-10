package com.scit.test43.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.scit.test43.vo.CommentReplyVO;
import com.scit.test43.vo.CommentVO;

public interface CommentMapper {

	// 글 목록
	public ArrayList<CommentVO> commentList(@Param("target") String target, @Param("searchText") String searchText, RowBounds rb);
	public ArrayList<CommentVO> boardList(String target);
	
	// 전체글 개수 조회
	public int selectContentCnt(@Param("target") String target, @Param("searchText") String searchText);

	// 글 읽기
	public CommentVO getContentView(String cmt_id);

	// 조회수 증가
	public void updateHits(String cmt_id);
	
	// 글 쓰기
	public int insertContent(Map<String, Object> paramMap);

	// 글 수정
	public int updateContent(Map<String, Object> paramMap);
	
	// 계시글 패스워드 확인
	public int getCommentCnt(Map<String, Object> paramMap);

	// 글 삭제
	public int deleteComment(Map<String, Object> paramMap);

	// 댓글 등록
	public int regReply(Map<String, Object> paramMap);

	// 댓글 목록
	public List<CommentReplyVO> getReplyList(String cmt_id);

	// 댓글 전체 삭제
	public int deleteCommentReplyAll(Map<String, Object> paramMap);
	
	// 댓글 삭제
	public int deleteCommentReply(Map<String, Object> paramMap);
	
	// 댓글 확인
	public boolean checkReply(Map<String, Object> paramMap);
	
	// 댓글 수정
	public boolean updateReply(Map<String, Object> paramMap);
}
