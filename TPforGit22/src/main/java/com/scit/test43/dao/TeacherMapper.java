package com.scit.test43.dao;

import java.util.ArrayList;

import com.scit.test43.vo.TeacherVO;

public interface TeacherMapper {

	ArrayList<TeacherVO> list();

	TeacherVO infoWindow(String teacherId);



	

}
