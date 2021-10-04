package com.scit.test43.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.test43.vo.StudentVO;
import com.scit.test43.vo.TeacherVO;

@Repository
public class MyPageDAO {
	@Autowired
	private SqlSession session;

	public ArrayList<StudentVO> newSugangList(String sg_teacher) {
		ArrayList<StudentVO> newSugangList = null;
		
		try {
			MyPageMapper mapper = session.getMapper(MyPageMapper.class);
			newSugangList = mapper.newSugangList(sg_teacher);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return newSugangList;
	}
	
	public ArrayList<StudentVO> acceptSugangList(String sg_teacher) {
		ArrayList<StudentVO> acceptSugangList = null;
		
		try {
			MyPageMapper mapper = session.getMapper(MyPageMapper.class);
			acceptSugangList = mapper.acceptSugangList(sg_teacher);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return acceptSugangList;
	}

	public int tc_starAvg(String sg_teacher) {
		int tc_starAvg = 0;
		try {
			MyPageMapper mapper = session.getMapper(MyPageMapper.class);
			tc_starAvg = mapper.tc_starAvg(sg_teacher);
			} catch (Exception e) {
				e.printStackTrace();
		}
		return tc_starAvg;
	}

	public int acceptSugang(int sg_num) {
		int cnt = 0;
		try {
			MyPageMapper mapper = session.getMapper(MyPageMapper.class);
			cnt = mapper.acceptSugang(sg_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public int refuseSugang(int sg_num) {
		int cnt = 0;
		try {
			MyPageMapper mapper = session.getMapper(MyPageMapper.class);
			cnt = mapper.refuseSugang(sg_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public TeacherVO selectTeacherInfo(String tc_id) {
		TeacherVO teacher = null; 
		try {
			MyPageMapper mapper = session.getMapper(MyPageMapper.class);
			teacher = mapper.selectTeacherInfo(tc_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return teacher;
	}

	public int updateMyInfo(TeacherVO teacher) {
		int cnt = 0; 
		System.out.println("여기까지 오나요?");
		try {
			MyPageMapper mapper = session.getMapper(MyPageMapper.class);
			cnt = mapper.updateMyInfo(teacher);
			System.out.println("여기는 오나요22222??");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public int st_starAvg(String sg_student) {
		int sg_starAvg = 0;
		try {
			MyPageMapper mapper = session.getMapper(MyPageMapper.class);
			sg_starAvg = mapper.sg_starAvg(sg_student);
			} catch (Exception e) {
				e.printStackTrace();
		}
		return sg_starAvg;
	}

	public ArrayList<TeacherVO> applySugang(String sg_student) {
		ArrayList<TeacherVO> applySugang = null;
		
		try {
			MyPageMapper mapper = session.getMapper(MyPageMapper.class);
			applySugang = mapper.applySugang(sg_student);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return applySugang;
	}

	public ArrayList<TeacherVO> acceptedSugang(String sg_student) {
		ArrayList<TeacherVO> acceptedSugang = null;
		
		try {
			MyPageMapper mapper = session.getMapper(MyPageMapper.class);
			acceptedSugang = mapper.acceptedSugang(sg_student);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return acceptedSugang;
	}

	public ArrayList<TeacherVO> refusedSugang(String sg_student) {
		ArrayList<TeacherVO> refusedSugang = null;
		try {
			MyPageMapper mapper = session.getMapper(MyPageMapper.class);
			refusedSugang = mapper.refusedSugang(sg_student);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return refusedSugang;
	}

	public int deleteSugang(int sg_num) {
		int cnt = 0;
		try {
			MyPageMapper mapper = session.getMapper(MyPageMapper.class);
			cnt = mapper.deleteSugang(sg_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public int updateStMyInfo(StudentVO student) {
		int cnt = 0; 
		System.out.println("여기까지 오나요?");
		try {
			MyPageMapper mapper = session.getMapper(MyPageMapper.class);
			cnt = mapper.updateStMyInfo(student);
			System.out.println("여기는 오나요22222??");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public StudentVO selectStudentInfo(String st_id) {
		StudentVO student = null; 
		try {
			MyPageMapper mapper = session.getMapper(MyPageMapper.class);
			student = mapper.selectStudentInfo(st_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return student;
	}
	
	

}
