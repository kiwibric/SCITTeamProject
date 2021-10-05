package com.scit.test43.dao;

import java.util.ArrayList; 

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.test43.dao.TeacherMapper;
import com.scit.test43.vo.TeacherVO;


@Repository
public class TeacherDAO {

	@Autowired
	private SqlSession session;

	public ArrayList<TeacherVO> list() {
		TeacherMapper mapper = session.getMapper(TeacherMapper.class);
		ArrayList<TeacherVO> list = mapper.list();
		return list;
	}

	public TeacherVO infoWindow(String teacherId) {
		TeacherMapper mapper = session.getMapper(TeacherMapper.class);
		TeacherVO tc = mapper.infoWindow(teacherId);
		return tc;
	}

	
}
