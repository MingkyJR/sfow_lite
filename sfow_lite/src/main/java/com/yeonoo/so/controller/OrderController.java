package com.yeonoo.so.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.sfow.basicinfo.domain.UserInfo;
import com.yeonoo.so.domain.OrderDetailVO;
import com.yeonoo.so.domain.OrderVO;
import com.yeonoo.so.service.OrderService;



@Controller
@RequestMapping("/")
public class OrderController {
		
	@Autowired
	private OrderService orderService;
		
		//수주서 폼
		@RequestMapping("orderList")
		public String orderListForm() throws Exception {
			return "so/orderList";
		}
	
		//수주서 목록조회
		@RequestMapping("so/orderList")
		@ResponseBody
		public List<OrderVO> orderList(HttpServletRequest request) throws Exception {
		    String company_code = (String) request.getSession().getAttribute("company_code"); // 세션에서 회사코드 가져오기
		    List<OrderVO> list = orderService.orderList(company_code); // 회사코드를 파라미터로 전달
		    return list;
		}
	
		
		//수주서 상세조회
		@RequestMapping(value="orderDetail", method=RequestMethod.POST)
		@ResponseBody
		public List<OrderDetailVO> orderDetail(@RequestBody List<OrderVO> orderList) throws Exception {
	           
			   List<OrderDetailVO> orderDetailList = new ArrayList<OrderDetailVO>();
			   Iterator<OrderVO> iterator = orderList.iterator();
			   
	           while(iterator.hasNext()) {
	              
	        	   OrderVO orderDetail = iterator.next();
	        	   List<OrderDetailVO> orderDetailVO= orderService.orderDetail(orderDetail.getOrder_number());
	        	   
	        	   Iterator<OrderDetailVO> iterator2 = orderDetailVO.iterator();
	        	   while(iterator2.hasNext()) {
	        		   OrderDetailVO orderDetail2 = iterator2.next();
	        		   orderDetailList.add(orderDetail2);
	        	   }
	           }
	           
	           return orderDetailList;
	        }
		
		
		
		
		//아이템관련 폼 보여주기
		@RequestMapping("orderForm")
		public String orderForm() throws Exception {
			return "so/orderDetail";
		}

		//거래처관련 폼 보여주기
		@RequestMapping("orderForm2")
		public String orderForm2() throws Exception {
			return "so/orderDetail2";
		}
		 
		
		// 등록
        @ResponseBody
        @RequestMapping(value="orderInsert")
        public List<OrderVO> orderInsert(@RequestBody List<OrderVO> orderVO, HttpSession session) {

        	UserInfo userInfo = (UserInfo) session.getAttribute("AUTHUSER");
        	String company_code = userInfo.getCompanyCode();
        	String create_user	= userInfo.getId();		
        	
           Iterator<OrderVO> iterator = orderVO.iterator();
           while(iterator.hasNext()) {
        	   
        	   OrderVO elements = iterator.next();
               elements.setCompany_code(company_code);
               elements.setCreate_user(create_user);
              orderService.orderInsert(elements);
           }
           
           return orderVO;
        }
    
        //상세 등록
        @ResponseBody
        @RequestMapping(value="orderInsert2")
        public List<OrderDetailVO> orderInsert2(@RequestBody List<OrderDetailVO> orderDetailVO) {
        	
        	
        	Iterator<OrderDetailVO> iterator = orderDetailVO.iterator();
        	while(iterator.hasNext()) {
        		OrderDetailVO elements = iterator.next();
        		
        		orderService.orderInsert2(elements);
        	}
        	
        	return orderDetailVO;
        }
        
        
        //삭제(수정)
        @ResponseBody
        @RequestMapping(value="orderDelete", method=RequestMethod.POST)
        public List<OrderVO> orderDelete(@RequestBody List<OrderVO> orderVO) {

           Iterator<OrderVO> iterator = orderVO.iterator();
           
           while(iterator.hasNext()) {
              
        	   OrderVO elements = iterator.next();
        	   orderService.orderDelete(elements.getOrder_number());
           }
           
           return orderVO;
        }
     
        //상태수정
        @ResponseBody
        @RequestMapping(value="orderUpdateStatus", method=RequestMethod.POST)
        public List<OrderVO> orderUpdateStatus(@RequestBody List<OrderVO> orderVO) {
        	
        	Iterator<OrderVO> iterator = orderVO.iterator();
        	
        	while(iterator.hasNext()) {
        		
        		OrderVO elements = iterator.next();
        		orderService.orderUpdateStatus(elements.getOrder_number());
        	}
        	
        	return orderVO;
        }
  
        //수정
        @ResponseBody
        @RequestMapping(value="orderUpdate", method=RequestMethod.PATCH)
        public int orderUpdate(@RequestBody List<OrderVO> orderVO, HttpSession session) {
        	
        	UserInfo userInfo = (UserInfo) session.getAttribute("AUTHUSER");
        	String update_user	= userInfo.getId();		
        	Iterator<OrderVO> iterator = orderVO.iterator();
        	int result = 0;
        	while(iterator.hasNext()) {
        		
        		OrderVO elements = iterator.next();
        		elements.setUpdate_user(update_user);
        		 result= orderService.orderUpdate(elements);
        	}
        	

        	return result;
        }
   
        //상세수정
        @ResponseBody
        @RequestMapping(value="orderUpdate2", method=RequestMethod.PATCH)
        public int orderUpdate2(@RequestBody List<OrderDetailVO> orderDetailVO) {
        	
        	Iterator<OrderDetailVO> iterator = orderDetailVO.iterator();
        	int result = 0;
        	while(iterator.hasNext()) {
        		
        		OrderDetailVO elements = iterator.next();
        		System.out.println(elements);
        		result= orderService.orderUpdate2(elements);
        	}
        	
        	
        	return result;
        }
        
        //아이템 조회
        @GetMapping("orderItem")
        @ResponseBody
        public ResponseEntity<List<Map<String, Object>>> getItem() throws Exception {
            List<Map<String, Object>> result = orderService.getItem();
            return ResponseEntity.ok(result);
        }

        //거래처코드 조회
        @GetMapping("orderClient")
        @ResponseBody
        public ResponseEntity<List<Map<String, Object>>> getClient() throws Exception {
        	List<Map<String, Object>> result = orderService.getClient();
        	return ResponseEntity.ok(result);
        }
		 
}
		 
		
		
		
		

	
