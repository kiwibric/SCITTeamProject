package com.scit.test43.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scit.test43.dao.CommentDAO;
import com.scit.test43.vo.CommentReplyVO;
import com.scit.test43.vo.CommentVO;

@Service
public class CommentService {
	
	@Autowired
	private CommentDAO dao;
	
	@Autowired
	private HttpSession session;
	
	// 글 쓰기 및 수정
	public int insertContent(Map<String, Object> paramMap) {
		
		// 로그인한 사용자의 ID
		String loginId = (String)session.getAttribute("loginId"); // session Object를 String으로 강제형변환
		// 글쓴이의 ID 설정
		paramMap.put("writer",loginId);
		
        if(paramMap.get("cmt_id")==null) { // 아이디가 없으면 입력
            return dao.insertContent(paramMap);
        }else {	// 아이디가 있으면 수정
            return dao.updateContent(paramMap);
        }
	}
	
	// list 조회 및 페이징, 검색
	public ArrayList<CommentVO> commentList(String target, String searchText, int startRecord, int countPerPage) {
		return dao.commentList(target, searchText, startRecord, countPerPage);
	}
	public int selectTotalCnt(String searchText) {
		return dao.selectContentCnt(searchText);
	}
	
	// 글 조회 및 조회수 증가
	public CommentVO getContentView(Map<String, Object> paramMap) {
		// 조회수 증가
		dao.updateHits(paramMap);
		// 글 조회
        return dao.getContentView(paramMap);
    }
	
	// 계시글 패스워드 조회
	public int getCommentCnt(Map<String, Object> paramMap) {
        return dao.getCommentCnt(paramMap);
    }
	
	public int deleteComment(Map<String, Object> paramMap) {
        return dao.deleteComment(paramMap);
    }
	
	
	// 댓글
	
	public int regReply(Map<String, Object> paramMap) {
        return dao.regReply(paramMap);
    }
	
	public List<CommentReplyVO> getReplyList(Map<String, Object> paramMap) {
		 
        List<CommentReplyVO> commentReplyList = dao.getReplyList(paramMap);
 
        // 부모
        List<CommentReplyVO> commentReplyListParent = new ArrayList<CommentReplyVO>();
        // 자식
        List<CommentReplyVO> commentReplyListChild = new ArrayList<CommentReplyVO>();
        // 통합
        List<CommentReplyVO> newCommentReplyList = new ArrayList<CommentReplyVO>();
 
        // 1.부모와 자식 분리
        for(CommentReplyVO commentReply: commentReplyList){
            if(commentReply.getDepth().equals("0")){
            	commentReplyListParent.add(commentReply);
            }else{
            	commentReplyListChild.add(commentReply);
            }
        }
 
        // 2.부모를 돌린다.
        for(CommentReplyVO commentReplyParent: commentReplyListParent){
            
        	// 2-1. 부모는 무조건 넣는다.
        	newCommentReplyList.add(commentReplyParent);
            
        	// 3.자식을 돌린다.
            for(CommentReplyVO commentReplyChild: commentReplyListChild){
                // 3-1. 부모의 자식인 것들만 넣는다.
                if(commentReplyParent.getReply_id().equals(commentReplyChild.getParent_id())){
                    newCommentReplyList.add(commentReplyChild);
                }
            }
        }
        // 정리한 list return
        return newCommentReplyList;
    }
	
	// 댓글 삭제
	public int delReply(Map<String, Object> paramMap) {
		if (paramMap.get("r_type").equals("main")) {
			// 부모부터 하위 다 지움
			return dao.deleteCommentReplyAll(paramMap);
		} else {
			return dao.deleteCommentReply(paramMap);
		}
	}
	
	// 댓글 패쓰워드 확인
	public boolean checkReply(Map<String, Object> paramMap) {
		return dao.checkReply(paramMap);
    }
	
	// 댓글 수정
	public boolean updateReply(Map<String, Object> paramMap) {
        return dao.updateReply(paramMap);
    }
}
