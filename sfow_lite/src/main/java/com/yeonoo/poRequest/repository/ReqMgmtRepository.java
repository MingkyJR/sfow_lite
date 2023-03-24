package com.yeonoo.poRequest.repository;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.yeonoo.poRequest.model.ReqMgmtDTO;
import com.yeonoo.poRequest.model.ReqMgmtDetailDTO;



public interface ReqMgmtRepository {
	
	public List<ReqMgmtDTO> reqMgmtList() throws DataAccessException;
	public List<ReqMgmtDetailDTO> reqMgmtDetail() throws DataAccessException;

}
