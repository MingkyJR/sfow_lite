<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="<%=request.getContextPath()%>"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<style>
/* DivTable.com */
.divTable{
	display: table;
	width: 100%;
    
}
.divTableRow {
	display: table-row;
}
.divTableHeading {
	background-color: #EEE;
	display: table-header-group;
}
.divTableCell, .divTableHead {
           border: 1px solid #999999;
           display: table-cell;
           padding: 3px 10px;
           text-align: center;
           border: 1px solid #E8EBF0;
           border-radius: 5px;
        }
.divTableHeading {
	background-color: #EEE;
	display: table-header-group;
	font-weight: bold;
}
.divTableFoot {
	background-color: #EEE;
	display: table-footer-group;
	font-weight: bold;
}
.divTableBody {
	display: table-row-group;
}
</style>
<title>Insert title here</title>
</head>
<body>
<form id="poInFrm" action="" method="">
    <input type="submit" value="조회"/>
    <input type="button" name="" id="" value="저장"/>
    <input type="reset" value="초기화"/>














<form id="searchFrm" action="" method="">
<div class="divTable">
    <div class="divTableBody">

    <div class="divTableRow">
    <div class="divTableCell">입고번호</div>
        <div class="divTableCell">
            <input type="text" name="in_number" id="in_number" value="테스트입고번호"/>
        </div>
    <div class="divTableCell">입고유형</div>
        <div class="divTableCell">
            <select name="in_type" id="in_type">
                <option value="">--</option>
                <option value="구매입고">구매입고</option>
            </select>
        </div>
    <div class="divTableCell">입고일자</div>
        <div class="divTableCell">
            <input type="date" name="in_date" id="in_date"/>
        </div>
    </div>

    <div class="divTableRow">
    <div class="divTableCell">수불타입</div>
        <div class="divTableCell">
            <select name="in_trans_type" id="in_trans_type">
                <option value="--">--</option>
                <option value="일반">일반</option>
                <option value="사급">사급</option>
                <option value="샘플">샘플</option>
            </select>
        </div>
    <div class="divTableCell">거래처코드</div>
    <div class="divTableCell">
        <input type="text" name="client_code" id="client_code" value="테스트거래처코드"/>
        </div>
    <div class="divTableCell">거래처명</div>
    <div class="divTableCell">
        <input type="text" name="client_name" id="client_name" value="테스트거래처명"/>
    </div>
    </div>

    <div class="divTableRow">
    <div class="divTableCell">무상여부</div>
    <div class="divTableCell">
        <select name="in_free" id="in_free">
            <option value="--">--</option>
            <option value="유상">유상</option>
            <option value="무상">무상</option>
        </select>
        </div>
    <div class="divTableCell">비고</div>
    <div class="divTableCell">
        <input type="text" name="in_memo" id="in_memo" value="테스트비고"/>
        </div>
    </div>
    </div>
    </div>
</form>
<br/>
<br/>
<form id="listFrm" action="" method="">
    <input type="hidden" name="" id="" value=""/>

    <div class="divTable">
    <div class="divTableBody">
    <div class="divTableRow">
        <div class="divTableCell"><input type="checkbox"/></div>
        <div class="divTableCell">입고번호</div>
        <div class="divTableCell">입고담당자</div>
        <div class="divTableCell">입고유형</div>
        <div class="divTableCell">입고일자</div>
        <div class="divTableCell">수불타입</div>
        <div class="divTableCell">구매요청번호</div>
        <div class="divTableCell">거래처코드</div>
        <div class="divTableCell">거래처명</div>
        <div class="divTableCell">등록수정일</div>
        <div class="divTableCell">비고</div>
    </div>
	<c:if test="${empty reqMgmtList}">
	<div>데이터가없습니다</div>
	</c:if>
	<c:if test="${!empty reqMgmtList}">
	<c:forEach var="item" items="${reqMgmtList}">
    <div class="divTableRow">
        <div class="divTableCell">
            <input type="checkbox" name="in_number"/>
        </div>
        <div class="divTableCell">
            <input type="text" name="in_number" id="in_number" value="${item.in_number}"/>
        </div>
        <div class="divTableCell">
            <input type="text" name="in_empid" id="in_empid" value="${item.in_empid}"/>
        </div>
        <div class="divTableCell">
            <input type="text" name="in_type" id="in_type" value="${item.in_type}"/>
        </div>
        <div class="divTableCell">
        
            <input type="text" name="in_date" id="in_date" value="<fmt:formatDate value="${item.in_date}" type="date" pattern="yyyy.MM.dd"/>"/>
        </div>
        <div class="divTableCell">
            <input type="text" name="in_trans_type" id="in_trans_type" value="${item.in_trans_type}"/>
        </div>
        <div class="divTableCell">
            <input type="text" name="request_number" id="request_number" value="${item.request_number}"/>
        </div>
        <div class="divTableCell">
            <a href="#"><input type="text" name="client_code" id="client_code" value="${item.client_code}"/></a>
        </div>
        <div class="divTableCell">
            <input type="text" name="client_name" id="client_name" value="${item.client_name}"/>
        </div>
        <div class="divTableCell">
          <input type="date" name="in_regdate" id="in_regdate" value="<fmt:formatDate value="${item.in_regdate}" type="date" pattern="yyyy.MM.dd"/>"/>
        </div>
        <div class="divTableCell">
            <input type="text" name="in_memo" id="in_memo" value="${item.in_memo}"/>
        </div>

    </div>
    </c:forEach>
    </c:if>
    
    </div>
    </div>
</form>
<br/>
<br/>
<form id="detailFrm" action="" method="">
    <div class="divTable">
        <div class="divTableBody">
        <div class="divTableRow">
        <div class="divTableCell">번호</div>
        <div class="divTableCell"><input type="checkbox" name="" id="" value="" /></div>
        <div class="divTableCell">ITEM코드</div>
        <div class="divTableCell">품명</div>
        <div class="divTableCell">품번</div>
        <div class="divTableCell">규격</div>
        <div class="divTableCell">재고단위</div>
        <div class="divTableCell">창고코드</div>
        <div class="divTableCell">창고명</div>
        <div class="divTableCell">수량</div>
        <div class="divTableCell">단가</div>
        <div class="divTableCell">공급가액</div>
        <div class="divTableCell">부가세포함</div>
        <div class="divTableCell">비고</div>
        <div class="divTableCell">입고번호</div>
        </div>
        
        <c:if test="${empty reqMgmtDetail}">
		<div>데이터가없습니다</div>
		</c:if> 
		<c:if test="${!empty reqMgmtDetail}"> 
		<c:forEach var="item" items="${reqMgmtDetail}">
        <div class="divTableRow">
        <div class="divTableCell">
            <input type="text" name="in_order" id="in_order" value="${item.in_order }"/>
        </div>
        <div class="divTableCell">
            <input type="checkbox" name="in_order"/>
        </div>
        <div class="divTableCell">
            <input type="text" name="item_code" id="item_code" value="${item.item_code }" />
        </div>
        <div class="divTableCell">
            <input type="text" name="item_name" id="item_name" value="${item.item_name }" />
        </div>
        <div class="divTableCell">
            <input type="text" name="item_no" id="item_no" value="${item.item_no }" />
        </div>
        <div class="divTableCell">
            <input type="text" name="item_specification" id="item_specification" value="${item.item_specification }" />
        </div>
        <div class="divTableCell">
            <input type="text" name="warehouse_code" id="warehouse_code" value="${item.warehouse_code }" />
        </div>
        <div class="divTableCell">
            <input type="text" name="warehouse_name" id="warehouse_name" value="${item.warehouse_name }" />
        </div>
        <div class="divTableCell">
            <input type="text" name="item_stock_unit" id="item_stock_unit" value="${item.item_stock_unit }" />
        </div>
        <div class="divTableCell">
            <input type="text" name="in_detail_quantity" id="in_detail_quantity" value="${item.in_detail_quantity }" />
        </div>
        <div class="divTableCell">
            <input type="text" name="price" id="price" value="${item.price }" />
        </div>
        <div class="divTableCell">
            <input type="text" name="in_detail_amount" id="in_detail_amount" value="${item.in_detail_amount }" />
        </div>
        <div class="divTableCell">
            <input type="text" name="in_detail_tax_amount" id="in_detail_tax_amount" value="${item.in_detail_tax_amount }" />
        </div>
        <div class="divTableCell">
            <input type="text" name="in_detail_memo" id="in_detail_memo" value="${item.in_detail_memo }" />
        </div>
        <div class="divTableCell">
            <input type="text" name="in_number" id="in_number" value="${item.in_number }" />
        </div>
        </div>  
        </c:forEach>
    	</c:if>   
        </div>
    </div>   
</form>

</form>
</body>
</html>