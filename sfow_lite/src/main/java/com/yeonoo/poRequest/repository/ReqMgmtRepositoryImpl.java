package com.yeonoo.poRequest.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.yeonoo.poRequest.model.ReqMgmtDTO;
import com.yeonoo.poRequest.model.ReqMgmtDetailDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ReqMgmtRepositoryImpl implements ReqMgmtRepository{
	
	private final SqlSessionTemplate sqlSession;
	@Override
	public List<ReqMgmtDTO> reqMgmtList() throws DataAccessException {
		List<ReqMgmtDTO> list= sqlSession.selectList("mapper.ReqMgmt.reqMgmtList");
		return list;
		
	}

	public List<ReqMgmtDetailDTO> reqMgmtDetail() throws DataAccessException {
		List<ReqMgmtDetailDTO> list = sqlSession.selectList("mapper.ReqMgmt.reqMgmtDetail");
		return list;
	}
	

}
