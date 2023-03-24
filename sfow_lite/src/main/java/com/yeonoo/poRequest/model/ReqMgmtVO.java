package com.yeonoo.poRequest.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//입력 입고관리
@Data //Setter & Getter
@NoArgsConstructor //기본생성자
@AllArgsConstructor //생성자
public class ReqMgmtVO {
	private String in_number; //입고번호
	private String in_type; //입고유형
	private String in_trans_type; //수불타입
	private Date in_date; //입고일자
	private String client_code; //거래처코드
	private String client_name; //거래처명
	private Date in_regdate; //등록수정일
	private String in_empid; //입고등록자
	private String in_delyn; //삭제여부 DEFAULT 'N',
	private String in_memo; //비고
	private String request_number; //구매요청번호

}
