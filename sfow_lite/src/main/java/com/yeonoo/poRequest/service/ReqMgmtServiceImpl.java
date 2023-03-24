package com.yeonoo.poRequest.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.yeonoo.poRequest.model.ReqMgmtDTO;
import com.yeonoo.poRequest.model.ReqMgmtDetailDTO;
import com.yeonoo.poRequest.repository.ReqMgmtRepository;
import com.yeonoo.poRequest.repository.ReqMgmtRepositoryImpl;


import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReqMgmtServiceImpl implements  ReqMgmtService{
	
	private final ReqMgmtRepository reqMgmtRepository;

	@Override
	public List<ReqMgmtDTO> reqMgmtList() throws Exception {
		List<ReqMgmtDTO> list= reqMgmtRepository.reqMgmtList();
		return list;

		
	}
	
	public List<ReqMgmtDetailDTO> reqMgmtDetail() throws Exception {
		List<ReqMgmtDetailDTO> list = reqMgmtRepository.reqMgmtDetail();
		return list;
	}

}
