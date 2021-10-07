package com.scit.test43.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.test43.vo.StudentVO;
import com.scit.test43.vo.TeacherVO;
@Repository
public class JoinLoginDAO {
	@Autowired
	private SqlSession session;
	public StudentVO searchStudent(String st_id) {
		StudentVO student = null;
		try {
			JoinLoginMapper mapper = session.getMapper(JoinLoginMapper.class);
			student = mapper.searchStudent(st_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return student;
	}
	public TeacherVO searchTeacher(String tc_id) {
		TeacherVO teacher = null;
		System.out.println(tc_id);
		try {
			JoinLoginMapper mapper = session.getMapper(JoinLoginMapper.class);	
			teacher = mapper.searchTeacher(tc_id);
		}catch(Exception e) {
			e.printStackTrace();
		}	
		return teacher;
	}
}
