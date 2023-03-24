package com.yeonoo.poRequest.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yeonoo.poRequest.model.ReqMgmtDTO;
import com.yeonoo.poRequest.model.ReqMgmtDetailDTO;
import com.yeonoo.poRequest.service.ReqMgmtService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ReqMgmtController {
	
	private final ReqMgmtService reqMgmtService;
	
	@GetMapping("/reqMg")
	public String reqMamt(Model model) throws Exception {
		List<ReqMgmtDTO> reqMgmtList=reqMgmtService.reqMgmtList();
		model.addAttribute("reqMgmtList", reqMgmtList);
		
		return "/poRequest/reqMgmt";
	}
	
	@RequestMapping("/reqMg2")
	public String reqMamt2(Model model) throws Exception {
		List<ReqMgmtDetailDTO> reqMgmtDetail=reqMgmtService.reqMgmtDetail();
		model.addAttribute("reqMgmtDetail", reqMgmtDetail);
		
		return "/poRequest/reqMgmt";
	}
	
	@RequestMapping("/req")
	public String req() {
		return "/test";
	}
	
	
	
	
	
	
	

}
