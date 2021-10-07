package com.scit.test43.dao;

import com.scit.test43.vo.StudentVO;
import com.scit.test43.vo.TeacherVO;

public interface JoinLoginMapper {
	public StudentVO searchStudent(String st_id);
	public TeacherVO searchTeacher(String tc_id);

	
}
