package com.scit.test43.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit.test43.dao.TeacherDAO;
import com.scit.test43.service.CommentService;
import com.scit.test43.util.PageNavigator;
import com.scit.test43.vo.CommentVO;

@Controller
public class CommentController {
	
	@Autowired
	CommentService service;
	
	@Autowired
	TeacherDAO dao;
	
	private final int countPerPage = 5;
	private final int pagePerGroup = 5;
	
//	boardList
	
	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public String listForm(Model model,
			@RequestParam(name = "target", defaultValue = "") String target
			,@RequestParam(name = "searchText", defaultValue = "") String searchText
			,@RequestParam(name = "page", defaultValue="1") int page) {
		
		// DB가서 전체글 수 조회
		int totalCount = service.selectTotalCnt(target);
		// 페이징 객체 생성
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, totalCount);
		
		// 게시글 목록 조회
		ArrayList<CommentVO> list = service.commentList(target, searchText, navi.getStartRecord(), navi.getCountPerPage());
		
		model.addAttribute("list", list);
		model.addAttribute("navi", navi);
		model.addAttribute("searchText", searchText);
		
		return "board/boardList";
	}
	
	// 계시글 등록 및 수정
    @RequestMapping(value = "/board/edit")
    public String boardEdit(HttpServletRequest request, @RequestParam Map<String, Object> paramMap, Model model) {
 
        //	Referer 검사
        String Referer = (String)request.getHeader("referer");
 
        if(Referer != null){	// URL로 직접 접근 불가
            if(paramMap.get("cmt_id") != null){	// 게시글 수정
                if(Referer.indexOf("/board/view") > -1){
                    // 정보를 가져온다.
                    model.addAttribute("boardView", service.getContentView(paramMap));
                    return "board/boardEdit";
                }else{
                    return "redirect:/board/list";
                }
            }else{ // 게시글 등록
                if(Referer.indexOf("/board/list") > -1){
                    return "board/boardEdit";
                }else{
                    return "redirect:/board/list";
                }
            }
        }else{
            return "redirect:/board/list";
        }
 
    }
    
    //게시글 상세 보기
  	@RequestMapping(value = "/board/view", method = RequestMethod.GET)
  	public String boardView(Map<String, Object> paramMap, Model model) {
   
          model.addAttribute("replyList", service.getReplyList(paramMap));
          model.addAttribute("boardView", service.getContentView(paramMap));
   
          return "boardView";
  	}
	
//  boardEdit
  	
	//AJAX 호출 (게시글 등록, 수정)
    @ResponseBody
    @RequestMapping(value="/board/save", method=RequestMethod.POST)
    public Object boardSave(@RequestParam Map<String, Object> paramMap) {
 
        //리턴값
        Map<String, Object> retVal = new HashMap<String, Object>();
 
        //패스워드 암호화
        ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
        String password = encoder.encodePassword(paramMap.get("password").toString(), null);
        paramMap.put("password", password);
 
        //정보입력
        int result = service.insertContent(paramMap);
 
        if(result>0){
            retVal.put("code", "OK");
            retVal.put("message", "등록에 성공 하였습니다.");
        }else{
            retVal.put("code", "FAIL");
            retVal.put("message", "등록에 실패 하였습니다.");
        }
 
        return retVal;
 
    }
    
//	boardView
    
    // AJAX 호출 (게시글 패스워드 확인)
    @ResponseBody
    @RequestMapping(value="/board/check", method=RequestMethod.POST)
    public Object boardCheck(@RequestParam Map<String, Object> paramMap) {
 
        // 리턴값
        Map<String, Object> retVal = new HashMap<String, Object>();
 
        // 패스워드 암호화
        ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
        String password = encoder.encodePassword(paramMap.get("password").toString(), null);
        paramMap.put("password", password);
 
        // 정보입력
        int result = service.getCommentCnt(paramMap);
 
        if(result>0){
            retVal.put("code", "OK");
        }else{
            retVal.put("code", "FAIL");
            retVal.put("message", "패스워드를 확인해주세요.");
        }
 
        return retVal;
 
    }
    
    
    // AJAX 호출 (게시글 삭제)
    @ResponseBody
    @RequestMapping(value="/board/del", method=RequestMethod.POST)
    public Object boardDel(@RequestParam Map<String, Object> paramMap) {
 
        // 리턴값
        Map<String, Object> retVal = new HashMap<String, Object>();
 
        // 패스워드 암호화
        ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
        String password = encoder.encodePassword(paramMap.get("password").toString(), null);
        paramMap.put("password", password);
 
        // 정보입력
        int result = service.deleteComment(paramMap);
 
        if(result>0){
            retVal.put("code", "OK");
        }else{
            retVal.put("code", "FAIL");
            retVal.put("message", "패스워드를 확인해주세요.");
        }
 
        return retVal;
 
    }
	
	// 댓글
    
  //AJAX 호출 (댓글 등록)
    @ResponseBody
    @RequestMapping(value="/board/reply/save", method=RequestMethod.POST)
    public Object boardReplySave(@RequestParam Map<String, Object> paramMap) {
 
        //리턴값
        Map<String, Object> retVal = new HashMap<String, Object>();
 
        //패스워드 암호화
        ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
        String password = encoder.encodePassword(paramMap.get("reply_password").toString(), null);
        paramMap.put("reply_password", password);
 
        //정보입력
        int result = service.regReply(paramMap);
 
        if(result>0){
            retVal.put("code", "OK");
            retVal.put("reply_id", paramMap.get("reply_id"));
            retVal.put("parent_id", paramMap.get("parent_id"));
            retVal.put("message", "등록에 성공 하였습니다.");
        }else{
            retVal.put("code", "FAIL");
            retVal.put("message", "등록에 실패 하였습니다.");
        }
 
        return retVal;
 
    }
    
    // AJAX 호출 (댓글 삭제)
    @ResponseBody
    @RequestMapping(value="/board/reply/del", method=RequestMethod.POST)
    public Object boardReplyDel(@RequestParam Map<String, Object> paramMap) {
 
        // 리턴값
        Map<String, Object> retVal = new HashMap<String, Object>();
 
        // 패스워드 암호화
        ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
        String password = encoder.encodePassword(paramMap.get("reply_password").toString(), null);
        paramMap.put("reply_password", password);
 
        // 정보입력
        int result = service.delReply(paramMap);
 
        if(result>0){
            retVal.put("code", "OK");
        }else{
            retVal.put("code", "FAIL");
            retVal.put("message", "삭제에 실패했습니다. 패스워드를 확인해주세요.");
        }
 
        return retVal;
 
    }
    
    // AJAX 호출 (댓글 패스워드 확인)
    @ResponseBody
    @RequestMapping(value="/board/reply/check", method=RequestMethod.POST)
    public Object boardReplyCheck(@RequestParam Map<String, Object> paramMap) {
 
        // 리턴값
        Map<String, Object> retVal = new HashMap<String, Object>();
 
        // 패스워드 암호화
        ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
        String password = encoder.encodePassword(paramMap.get("reply_password").toString(), null);
        paramMap.put("reply_password", password);
 
        // 정보입력
        boolean check = service.checkReply(paramMap);
 
        if(check){
            retVal.put("code", "OK");
            retVal.put("reply_id", paramMap.get("reply_id"));
        }else{
            retVal.put("code", "FAIL");
            retVal.put("message", "패스워드를 확인해 주세요.");
        }
        return retVal;
 
    }
    
    //AJAX 호출 (댓글 수정)
    @ResponseBody
    @RequestMapping(value="/board/reply/update", method=RequestMethod.POST)
    public Object boardReplyUpdate(@RequestParam Map<String, Object> paramMap) {
 
        //리턴값
        Map<String, Object> retVal = new HashMap<String, Object>();
 
        //패스워드 암호화
        ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
        String password = encoder.encodePassword(paramMap.get("reply_password").toString(), null);
        paramMap.put("reply_password", password);
 
        System.out.println(paramMap);
 
        //정보입력
        boolean check = service.updateReply(paramMap);
 
        if(check){
            retVal.put("code", "OK");
            retVal.put("reply_id", paramMap.get("reply_id"));
            retVal.put("message", "수정에 성공 하였습니다.");
        }else{
            retVal.put("code", "FAIL");
            retVal.put("message", "수정에 실패 하였습니다.");
        }
        return retVal;
 
    }

}
