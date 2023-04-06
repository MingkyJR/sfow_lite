<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="<%=request.getContextPath()%>" var="ContextPath"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 	<script src="${ContextPath}/resources/js/tui-grid.js"></script>
	<link rel="stylesheet" href="${ContextPath}/resources/css/tui-grid.css" type="text/css"/>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
  <style>
  .btn-wrapper {
    display: flex;
    justify-content: space-between;
  }
  
  .btn-wrapper button {
    background-color: #f5f5f5;
    color: #333;
    border: 1px solid #ccc;
    padding: 5px 8px; /* 버튼 내부 여백 수정 */
    border-radius: 4px;
    cursor: pointer;
    width: 70px; /* 버튼 너비 조정 */
    height: 30px; /* 버튼 높이 조정 */
    font-size: 12px; /* 폰트 크기 조정 */
  }

  #delete-row-btn {
    background-color: #ff8a80;
    color: #fff;
    border: 1px solid #ff8a80;
  }

  #delete-row-btn:hover {
    background-color: #ff7043;
    border: 1px solid #ff7043;
  }
  
  .inputBox, .searchKeywordBtn {
  display: inline-block;
	}
</style>
</head>
<script>
$(document).ready(function() {
		const EMAIL_AT_REQUIRED = '올바른 이메일 주소를 입력해주세요.';
		const EMPTY_FIELD_ERROR_MSG ='값을 입력해주세요';
		const DELETE_SUCCESS = '삭제에 성공했습니다.';
		const DELETE_FAILED ='삭제에 실패했습니다.';
	  const ADD_SUCCESS = '추가에 성공했습니다.';
    const ADD_FAILED = '추가에 실패했습니다.';
			
		 
		var gridData = [];
		var grid = new tui.Grid({
	    el: document.getElementById('grid'),
	    data: gridData,
	    scrollX: false,
	    scrollY: true,
	    rowHeaders: ['checkbox','rowNum'],
	    bodyHeight: 300,
	    columns: [
	    			// [회사코드 ] 
            {
                header: '회사코드',            
                name: 'companyCode',
            },
        		// [회사명 ] 
            {
                header: '회사명',        
                name: 'companyName',  
                editor: 'text',
               },
               
            // [이름 ]
            	{
                header: '이름',   
                name: 'userName',  
                editor: 'text',                
                validation: {
                    dataType: 'string',
                    required: true
                  }
            },
            
         		// [아이디 ]
            {
                header: '아이디',         
                name: 'id',  
                editor: 'text',
                align: 'center', 
            },
            
         		// [계정번호 ]
            {
                header: '계정번호',         
                name: 'updateKey',            
                hidden: true
            },
            
         		// [비밀번호 ]
            {
                header: '비밀번호',         
                name: 'password',            
                editor: 'text',               
                align: 'center',
                validation: {
	                dataType: 'string',
	                required: true
	              }
            },
            
         		// [전화번호 ]
            {
                header: '전화번호',            
                name: 'phoneNum',             
                editor: 'text', 
                align: 'center',              
		            validation: {
		                dataType: 'string',
		                required: true
		              }
            },
            
         		// [이메일 ]
            	{
                header: '이메일',           
                name: 'email',             
                align: 'center',              
                editor: 'text',
	            	validation: {
	                dataType: 'string',
	                required: true
	              }
              },
              
           		// [생성일 ]
              {
                  header: '생성일',            
                  name: 'createDate',
                },
                
                
                // 수정일[]
                {
                    header: '수정일',            
                    name: 'updateDate',            
                  },
			        ]
	  });
		
		
	  
	  //행 추가
	  $('#add-row-btn').on('click', function() {
		  
		  
		  var now = new Date();
		  var currentDate = now.getFullYear() + '-' + ('0' + (now.getMonth() + 1)).slice(-2) + '-' + ('0' + now.getDate()).slice(-2) + '-' + ('0' + now.getHours()).slice(-2);

		  
		  
		    // 행 추가할 때 필수 데이터 입력
		    var newRowData = {
		        companyCode: '${sessionScope.AUTHUSER.companyCode}',
		        companyName: '${sessionScope.AUTHUSER.companyName}',
		        userName: '',
		        id: '',
		        updateId: '',
		        password: '',
		        phoneNum: '',
		        email: '',
		        createDate: currentDate,
		        updateDate: currentDate
		    };
		    console.log("newRowData", newRowData);
				
		    // 새로운 행 추가
		    var newRowKey = grid.appendRow(newRowData); 
		    console.log("newRowKey",newRowKey);
		   
		    
		    // 새로운 행의 정보 전송
		    $.ajax({
		        url: '${ContextPath}/newUserAjax',
		        type: 'POST',
		        async : true,
		        data: JSON.stringify(newRowData),
		        contentType: 'application/json',
		        success: function(result) {
		            console.log(result);
		            
		            $.ajax({
		                url: '${ContextPath}/userManagementAjax?companyCode=${sessionScope.AUTHUSER.companyCode}',
		                type: 'GET',
		                dataType: 'JSON',
		                success: function(result) {
		                    console.log(result);
		                    grid.resetData(result);
		                },
		                error: function(xhr, status, error) {
		                    console.log(xhr.responseText);
		                    alert('Error: ' + error);
		                }
		            });
		        },
		        error: function(xhr, status, error) {
		            console.log(xhr.responseText);
		            alert(ADD_FAILED);
		        }
		    });
		});


	  
	  //모든 회원 목록 조회하기
	  $.ajax({
	    url: '${ContextPath}/userManagementAjax?companyCode=${sessionScope.AUTHUSER.companyCode}',
	    method: 'GET',
	    async : true,
	    dataType: 'JSON',
	    success: function(data) {
	      console.dir(data);		//배열인지 확인.
	      gridData=data;
	      grid.resetData(gridData);

	      grid.on('editingFinish', function(ev) {
	    	  var rowKey = ev.rowKey;
	    	  var columnName = ev.columnName;
	    	  var updatedData = {};
	    	  var rowData = grid.getRow(rowKey);
	    	  console.log('Row data: ', rowData);
	    	  console.log("컬럼이름",columnName);
	    	  
	    	  
	    	  //값 필수 입력 유효성 검사
	    	  if (!rowData[columnName]) {
	    		  alert(EMPTY_FIELD_ERROR_MSG);
	    		  return;
	    		}  
	    	  
	    	  //이메일 유효성 검사
	    	  if (columnName === 'email') {
	    		  var emailValue = rowData[columnName];
	    		  if (!emailValue || emailValue.indexOf('@') === -1) {
	    		    alert(EMAIL_AT_REQUIRED);
	    		    return;
	    		  }
	    		}
					
	    	  //회원정보 변경
	    	  if (columnName === 'id') {
	    	  $.ajax({
	    		    url: '${ContextPath}/userListUpdate',
	    		    method: 'PUT',
	    		    async : true,
	    		    dataType: 'JSON',
	    		    data: JSON.stringify(rowData),
	    		    contentType: 'application/json',
	    		    success: function(response) {
	    		        console.log('Success:', response);
	    		    },
	    		    error: function(error) {
	    		        console.log('Error:', error);
	    		    }
	    		});
	    	  }
	    	});
	    }
	  });
	  
	  
		// 행 삭제
		  $('#delete-row-btn').on('click', function() {
		    const checkedRows = grid.getCheckedRows();
		    var ids = [];
		    for (var i = 0; i < checkedRows.length; i++) {
		      ids.push(checkedRows[i].updateKey);
		    }
		    console.log("ids",ids);
	    
	    $.ajax({
	      url: '${ContextPath}/deleteUserAjax',
	      type: 'DELETE',
	      async : true,
	      data: JSON.stringify(ids),
	      contentType: 'application/json',
	      success: function(result) {
	        console.log(result);
	        
	        // 삭제된 행 재로딩
	        $.ajax({
	          url: '${ContextPath}/userManagementAjax?companyCode=${sessionScope.AUTHUSER.companyCode}',
	          method: 'GET',
	          dataType: 'JSON',
	          success: function(result) {
	            console.dir(result);
	            grid.resetData(result);
	          }
	        });
	      },
	      error: function(xhr, status, error) {
	        console.log(xhr.responseText);
	        alert(DELETE_FAILED);
	      }
	    });
	  });
		
			
		  $('#searchKeywordBtn, #searchKeyword').on('keyup', function(e) {
			    if (e.keyCode === 13) { // 엔터 키를 눌렀을 때
			        search();
					    }
					});
		
					$('#searchKeywordBtn').click(function(){
					    search();
					});
		
					function search() {
			    var searchKeyword = $("#searchKeyword").val();// input 태그의 값을 가져옵니다.
			    
			    // ajax 요청
			    $.ajax({
			      url: "${ContextPath}/search", // 서버 url을 입력하세요.
			      type: "GET", // 요청 방식을 입력하세요. (POST, GET 등)
			      data: { keyword: searchKeyword }, // 넘겨줄 데이터를 입력하세요.
			      success: function(response) {
			    	  console.log(response);
			    	  grid.resetData(response);// 그리드 데이터 업데이트
			      },
			      error: function(jqXHR, textStatus, errorThrown) {
			        // 실패 시 동작할 코드를 입력하세요.
			        console.log(textStatus, errorThrown);
			      }
			    });
			  }
		});
</script>
<body>
        <!-- 테이블 버튼 구성 -->
        <div class="wrapper">
				  <div class="btn-wrapper" style="margin-bottom: 10px;">
				  	  <div class="inputBox">
				      <input type="text" name="searchKeyword" id="searchKeyword">
				      <div class="searchKeywordBtn">
				        <button id="searchKeywordBtn">이름 검색</button>
				      </div>
				    </div>
				    <div class="wrapper_rowBtn">
						  <button id="add-row-btn"><i class="fas fa-plus"></i></button>
						  <button id="delete-row-btn"><i class="fas fa-minus"></i></button>
						</div>
				  </div>
				</div>
        <!-- Toast Grid Load -->
  <div id="grid"></div>
</body>
</html>