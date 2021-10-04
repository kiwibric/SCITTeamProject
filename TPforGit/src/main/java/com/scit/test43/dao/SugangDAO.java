package com.scit.test43.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.scit.test43.vo.SugangVO;

@Repository
public class SugangDAO {
	@Autowired
	private SqlSession session;

	public int insertSugangTable(SugangVO sugang) {
		int cnt = 0;
		try {
			SugangMapper mapper = session.getMapper(SugangMapper.class);
			cnt = mapper.insertSugangTable(sugang);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

	public int TcReq(SugangVO sugang) {
		int cnt = 0;
		try {
			SugangMapper mapper = session.getMapper(SugangMapper.class);
			cnt = mapper.updateTcReq(sugang);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

}
