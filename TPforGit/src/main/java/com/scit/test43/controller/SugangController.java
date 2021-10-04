package com.scit.test43.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit.test43.dao.SugangDAO;
import com.scit.test43.vo.SugangVO;

@Controller
public class SugangController {
	
	@Autowired
	private SugangDAO dao;
	
	

	
	@ResponseBody
	@RequestMapping(value = "/insertSugang", method = RequestMethod.GET)
	public boolean insertSugang(String tc_id, SugangVO sugang) {
		
		//1. 수강신청 테이블 업데이트(학생id와 선생님 id필요)
		boolean flag = false;
		
		//임의로 학생 ID를 넣어 놓음(추후 로그인 아이디로 변경 예정)
		sugang.setSg_student("momo");
		sugang.setSg_teacher(tc_id);		
		
		int insertSugangTable = dao.insertSugangTable(sugang);
		
		
		if(insertSugangTable != 0) {
			System.out.println("수강테이블 insert 성공");
			
 		}else {
			System.out.println("수강테이블 insert 실패");
			//수강 테이블 insert실패시 false반환
			flag = false;
 		}	
		
		//2. 선생님 테이블 Request정보 0을 1로 바꿔준다(학생id와 선생님 id 필요)
		int updateTcReq = dao.TcReq(sugang);
		if(updateTcReq != 0) {
			System.out.println("선생님 Request 업데이트 성공");
			// 수강신청 테이블 insert와 선생님 Request정보 업데이트를 모두 성공할 경우 true를 반환
			flag = true;
		}else {
			System.out.println("선생님 Request 업데이트 실패");
			flag = false;
		}
		
		return flag;
		
	}
	
}
