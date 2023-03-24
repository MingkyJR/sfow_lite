package com.yeonoo.poRequest.service;

import java.util.List;

import com.yeonoo.poRequest.model.ReqMgmtDTO;
import com.yeonoo.poRequest.model.ReqMgmtDetailDTO;

public interface ReqMgmtService {
	
	public List<ReqMgmtDTO> reqMgmtList() throws Exception;
	
	public List<ReqMgmtDetailDTO> reqMgmtDetail() throws Exception;

}
