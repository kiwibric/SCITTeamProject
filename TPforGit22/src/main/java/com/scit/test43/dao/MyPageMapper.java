package com.scit.test43.dao;

import java.util.ArrayList;

import com.scit.test43.vo.StudentVO;
import com.scit.test43.vo.TeacherVO;

public interface MyPageMapper {
	//새로운 수상신청 리스트
	ArrayList<StudentVO> newSugangList(String sg_teacher);
	//수락한 수강신청 리스트
	ArrayList<StudentVO> acceptSugangList(String sg_teacher);
	//별점
	int tc_starAvg(String sg_teacher);
	//수락시 sg_accept 업데이트
	int acceptSugang(int sg_num);
	//거절시 sg_accept 2 업데이트
	int refuseSugang(int sg_num);
	//정보수정을 위한 선생님 정보 가져오기
	TeacherVO selectTeacherInfo(String tc_id);
	//선생님 정보수정
	int updateMyInfo(TeacherVO teacher);
	
	
	//////////////////////////////////////////////////////////
	
	//학생 별정 
	int sg_starAvg(String sg_student);
	//학생이 신청한 강의 목록
	ArrayList<TeacherVO> applySugang(String sg_student);
	//수락된 강의 선생님 정보
	ArrayList<TeacherVO> acceptedSugang(String sg_student);
	//거절된 강의 선생님 정보
	ArrayList<TeacherVO> refusedSugang(String sg_student);
	//거절된 강의 지우기
	int deleteSugang(int sg_num);
	//학생 정보 수정
	int updateStMyInfo(StudentVO student);
	//학생 정보 가져오기
	StudentVO selectStudentInfo(String st_id);

}
