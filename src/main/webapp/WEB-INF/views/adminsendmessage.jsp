<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <!DOCTYPE html>
<html>
<head>
  <!-- meta태그, CSS, JS, 타이틀 인클루드  -->
  <%@ include file ="meta4.jsp" %>
</head>
<body>
  <!--헤더 인클루드-->
   <%@ include file ="adminheader.jsp" %>
   
  <!--메인 컨테이너 -->
  <section>
  	<div class="container">
    	<div class="my-4"> <!-- 탭 메뉴 -->
    		<table class="table project-table table-centered bg-light border-top border-2">
				<tbody>
				  <tr>
				    <th scope="col">제목</th>
				    <td>
  						<input type="text" class="form-control" placeholder="제목을 입력하세요" id="message_title" name="message_title" value="">
				    </td>
				  </tr>
				  <tr>
				    <th scope="col">받는이</th>
				    <td colspan="2" class="d-flex jutify-content-between">
  						<input type="text" class="form-control" placeholder="유저를 선택해주세요" readonly id="selected_user_list">
  						<input class="mx-3 btn btn-primary" value="선택하기" onclick="choice_to_user()"/>
				    </td>
				  </tr>
				</tbody>
			</table>
			<div style="height: 500px;">
				<textarea class="summernote" placeholder="내용을 입력하세요​" id="message_context" name="message_context">${noticeDto.notice_context}</textarea>
			</div>
			<div class="d-flex justify-content-end my-2">
				<input type="button" class="btn btn-primary" value="메일 보내기" onclick="send_message()">
			</div>
			<div class="modal fade" id="User_Message_Modal" tabindex="-1" aria-labelledby="pointpayModalLabel" aria-hidden="true" >
				<div class="modal-dialog modal-xl" role="document">
					<div class="modal-content">
			            <div class="modal-header p-5 pb-4 border-bottom-0">
			                <h5 class="fw-bold mb-0">유저 선택하기</h5>
			                <button type="button" class="btn-close" onclick="Close_Modal()"></button>
			            </div>
		                <div class="modal-body p-5 pt-0">
		                	<div id="user_list" class="row mx-auto col-10">
					        	<table class="table table-hover">
					        	<tr class="table-Secondary">
					        		<th class="selectAll">
					        			<div class="form-check">
                  							<input type="checkbox" class="form-check-input" id="agreeAll" name="agreeAll" onclick="select_user_all(this)"> 
                   						</div>
					        		</th>
									<th class="user_no" scope="col">번호</th>
									<th class="user_id" scope="col">아이디</th>
									<th class="user_name" scope="col">이름</th>
									<th class="user_nickname" scope="col">닉네임</th>
									<th class="user_phone" scope="col">전화번호</th>
									<th class="user_role" scope="col">권한</th>
								</tr>
						        	<c:forEach var="MemberDto" items="${UserList}">
										<tr class="child">
											<td><input type="checkbox" class="form-check-input" id="agree-${MemberDto.user_no}" name="agree" onchange="select_user(this)"></td>
											<th class="align-middle" scope="row" id="user_no-${MemberDto.user_no}">${MemberDto.user_no}</th>
											<td class="align-middle" id="user_id-${MemberDto.user_no}">${MemberDto.user_id}</td>
											<td class="align-middle" id="user_name-${MemberDto.user_no}">${MemberDto.user_name}</td>
											<td class="align-middle" id="user_nickname-${MemberDto.user_no}">${MemberDto.user_nickname}</td>
											<td class="align-middle" id="user_phone-${MemberDto.user_no}">${MemberDto.user_phone}</td>
											<td class="align-middle" id="user_role-${MemberDto.user_no}">
												<c:choose>
													<c:when test="${MemberDto.user_role == 'ROLE_USER'}">일반회원</c:when>
													<c:otherwise>관리자</c:otherwise>
												</c:choose>
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>
							<div class="paging-container">
								<div class="justify-content-center d-flex" id="paging_user">
									<ul class="pagination mb-0 col-10 justify-content-center">
										<c:if test="${totalCnt == null}">
											<div> 유저가 없습니다.</div>
										</c:if>
										<c:if test="${totalCnt != null || totalCnt != 0 }">
											<c:if test="${pr.showPrev }">
												<li class="page-item">
													<button class="page-link" onclick="beginPage()">&lt;</button>
													<%-- <a class="page-link" href="<c:url value="/admin/userlist${pr.sc.getQueryString(pr.beginPage-1) }" />"> &lt; </a> --%>
												</li>
											</c:if>
											<c:forEach var="i" begin="${pr.beginPage }" end="${pr.endPage }">
												<li class="page-item">
													<button class="page-link" style='<c:if test="${pr.sc.page==i}">background-color:#9e62fa; color:#fff;</c:if>' onclick="page(this)"> ${i}</button>
													<!-- <a class="page-link <c:if test="${pr.sc.page==i}">active</c:if>" href="<c:url value="/admin/userlist${pr.sc.getQueryString(i)}" />">${i }</a> -->
												</li>
											</c:forEach>
											<c:if test="${pr.showNext }">
												<li class="page-item">
													<button class="page-link" onclick="endPage()">&gt;</button>
													<%-- <a class="page-link" href="<c:url value="/admin/userlist${pr.sc.getQueryString(pr.endPage+1) }" />"> &gt; </a> --%>
												</li>
											</c:if>							
										</c:if>
									</ul>
								</div>
							</div>
						</div>
		                <div class="modal-footer">
		                    <button id="gotoaddBtn" class="btn btn-primary" onclick="add_touser()">추가하기</button> 
		                </div>
		          <!-- modal body -->
				    </div>
				</div>
			</div>
		</div>
	</div>
  </section>
  
  <script type="text/javascript">
	let to_message = [];	//유저선택 전역변수
	
	//유저선택 모달 종료function
	function Close_Modal(){
		to_message = [];	//전역변수 초기화하기
		$('#User_Message_Modal').modal('hide');	//유저선택 모달 종료
		let pageData = {page:1};	//모달내 페이지 초기화 요청시 필요한 data Json형태로 저장
		$.ajax({	//모달내 페이지 초기화 ajax요청
			type:'post',	
			url: '/purplaying/admin/pageselect',                                                                                
			headers:{"content-type" : "application/json"},
			dataType : 'text',
			data : JSON.stringify(pageData),
			beforeSend: function(xhr){
		        xhr.setRequestHeader(header, token);
		    },
			success:function(result){	//모달내 페이지 초기화 성공시 호출
				let result_List = JSON.parse(result)
				var result_i = [result_List.totalCnt,result_List.pr,result_List.UserList]
				$('#user_list').html(touserlist_HTML(result_i))	//유저리스트 출력
				$('#paging_user').html(touserPages_HTML(result_i))	//유저리스트 페이지번호 출력
			},
			error : function(){		//모달내 페이지 초기화 실패시 호출
				alert("error");
			}					
		}); 
	}
	//이메일 보내기function
	function send_message(){
		let title = $('#message_title').val()
		let user_id = $('#selected_user_list').val()
		let context = $('#message_context').val()
	   	$.ajax({	//선택한 페이지 번호에 해당하는 유저리스트 ajax요청
			type:'post',	
			url: '/purplaying/admin/sendgroupmessage',   
			data : {title:title, user_id:user_id, context:context},
			beforeSend: function(xhr){
		        xhr.setRequestHeader(header, token);
		    },
			success:function(result){	//페이지 선택 성공시 호출
					alert("보내기 성공")
			},
			error : function(){	//페이지 선택 실패시 호출
				alert("error");
			}					
		});
	}
	//유저선택 모달 요청 function
  	function choice_to_user(){
  		$('#User_Message_Modal').modal({backdrop: 'static', keyboard: false});
  		$('#User_Message_Modal').modal('show');		//유저선택 모달 요청
  	}
	//유저 선택 function
  	function select_user(element){
  		let find_user_no = 0;
  		let user = element.parentNode.nextElementSibling.nextElementSibling.innerHTML	//이벤트 발생 요소기준 부모,자식관계 이용 유저 아이디(이메일) 저장
  		
  		if(!to_message.includes(user)){	//전역변수 내에 동일한 아이디(이메일)가 없을경우 배열에 추가요청
  			to_message.push(user)	//배열에 유저 아이디(이메일)추가
  		}
  		else{	//전역변수 내에 동일한 아이디(이메일)가 있을경우 배열에 추가요청
  			find_user_no = to_message.indexOf(user) //배열에서 유저 아이디(이메일) 인덱스 찾기
  			to_message.splice(find_user_no,1)	//배열에서 유저 아이디(이메일)삭제
  		}
  	}
	//유저아이디 출력 function
  	function add_touser(){
  		let user_list = "";	//유저아이디 출력창 초기화
  		for(let i =0; i<to_message.length; i++){	//유저아이디 출력창에 선택된 유저 아이디 출력
  			if(i!=to_message.length-1){
  				user_list = user_list + to_message[i]+','		
  			}
  			else{
  				user_list = user_list + to_message[i]
  			}
  		}
  		$('#selected_user_list').val(user_list)
  		$('#User_Message_Modal').modal('hide');		//유저 선택 모달 종료
  	}
  	
	//유저 전체선택 function
  	function select_user_all(element){
  		let user_no_list = $('#user_list').find('.child').find('th').next() //페이지내 유저번호 배열로 저장
  		if(element.checked){	//이벤트 발생 요소가 체크되어있으면 호출
	  		for(let i = 0; i<user_no_list.length; i++){
		  		if(!to_message.includes($(user_no_list[i]).html())){	//전역변수에 유저번호가 포함되어 있지않을 경우 호출
		  			to_message.push($(user_no_list[i]).html())		//전역변수에 유저번호가 포함되어 있지않을 경우 배열에 추가
		  		}
		  	} 
	  		$('[name=agree]').prop("checked", true);	//전체선택체크 설정
  		}else{
  			for(let i = 0; i<user_no_list.length; i++){
  				if(to_message.includes($(user_no_list[i]).html())){
  					find_user_no = to_message.indexOf($(user_no_list[i]).html())	//전역변수에 유저번호가 포함되어 있을경우 경우 해당번호 저장
		  			to_message.splice(find_user_no,1)	//전역변수에 유저번호가 포함되어 있을경우 제거
		  		}
  			}
  			$('[name=agree]').prop("checked", false);	//전체선택체크 해제
  		}
  	}
  	
	//페이지 선택 function
  	function page(element){
  		pageData = {page:element.innerHTML}; //배너 설정 요청시 필요한 data(이벤트 발생 요소) Json형태로 저장

  		$.ajax({	//선택한 페이지 번호에 해당하는 유저리스트 ajax요청
			type:'post',	
			url: '/purplaying/admin/pageselect',                                                                                
			headers:{"content-type" : "application/json"},
			dataType : 'text',
			data : JSON.stringify(pageData),
			beforeSend: function(xhr){
		        xhr.setRequestHeader(header, token);
		    },
			success:function(result){	//페이지 선택 성공시 호출
				let result_List = JSON.parse(result)
				var result_i = [result_List.totalCnt,result_List.pr,result_List.UserList]
				$('#user_list').html(touserlist_HTML(result_i))	//유저리스트 출력
				$('#paging_user').html(touserPages_HTML(result_i))	//유저리스트 페이지번호 출력
			},
			error : function(){	//페이지 선택 실패시 호출
				alert("error");
			}					
		}); 
  	}
  	</script>
  	<script type="text/javascript">
  	
  	
  	let touserlist_HTML = function(result){
  		let check = false;
		let tmp = "<table class='table table-hover'><tr class='table-Secondary'><th class='selectAll'><div class='form-check'>";
		
		//result가 배열이므로 result[2]에 해당하는 요소들에 따라 실행
		for(let j = 0; j<result[2].length; j++){
			if(!to_message.includes(result[2][j].user_id)){
				check = false;
			}else{
				check = true;
			}
		}
		if(check){
			tmp += "<input type='checkbox' class='form-check-input' id='agreeAll' name='agree' checked='true' onclick='select_user_all(this)'>";
		}else{
			tmp += "<input type='checkbox' class='form-check-input' id='agreeAll' name='agree' onclick='select_user_all(this)'>";
		}
		
		tmp += "</div></th><th class='user_no' scope='col'>번호</th><th class='user_id' scope='col'>아이디</th>";
		tmp += "<th class='user_name' scope='col'>이름</th><th class='user_nickname' scope='col'>닉네임</th><th class='user_phone' scope='col'>전화번호</th>";
		tmp += "<th class='user_role' scope='col'>권한</th><th class='role_change' scope='col'></th>";
		tmp += '</tr>';
		
		//result[2]에 해당하는 요소들에 따라 실행
		result[2].forEach(function(result_item){
			tmp += '<tr class="child"><td>';
			if(to_message.includes(result_item.user_id)){
				tmp += '<input type="checkbox" class="form-check-input" id="agree-'+result_item.user_no+'" name="agree" checked="true" onchange="select_user(this)">';
			}
			else{
				tmp += '<input type="checkbox" class="form-check-input" id="agree-'+result_item.user_no+'" name="agree" onchange="select_user(this)">';
			}
			tmp += '</td>';
			tmp += '<th class="align-middle" scope="row" id="user_no-'+result_item.user_no+'">'+result_item.user_no+'</th>';
			tmp += '<td class="align-middle" id="user_id-'+result_item.user_no+'">'+result_item.user_id+'</td>';
			tmp += '<td class="align-middle" id="user_name-'+result_item.user_no+'">'+result_item.user_name+'</td>';
			tmp += '<td class="align-middle" id="user_nickname-'+result_item.user_no+'">'+result_item.user_nickname+'</td>';
			tmp += '<td class="align-middle" id="user_phone-'+result_item.user_no+'">'+result_item.user_phone+'</td>';
			tmp += '<td class="align-middle" id="user_role-'+result_item.user_no+'">';
			if(result_item.user_role==1){
				tmp +='관리자</td>';
			}
			else if(result_item.user_role == 0){
				tmp +='일반회원</td>';
			}
			tmp += '</tr>';
						
		});
		return tmp;
  	}
	
  	
	let touserPages_HTML = function(result){
		let tmp = '<ul class="pagination mb-0 col-10 justify-content-center">';
		if(result[0] == null){	//result[0]에 해당하는 요소들에 따라 실행
			tmp += '<div> 유저가 없습니다.</div>';
		}
		else{
			if(result[1].showPrev){ //result[1]에 해당하는 요소들에 따라 실행
				tmp += '<li class="page-item"><button class="page-link" onclick="beginPage()">&lt;</button></li>';
			}
			for(let i=result[1].beginPage; i<result[1].endPage+1; i++){		//result[1]에 해당하는 요소들에 따라 실행
				tmp += '<li class="page-item"><button class="page-link"'; 
				if(result[1].sc.page==i){	//result[1]에 해당하는 요소들에 따라 실행
					tmp += 'style="background-color:#9e62fa; color:#fff;"onclick="page(this)">'+i+'</button></li>';
				}
				else{
					tmp += 'onclick="page(this)">'+i+'</button></li>';
				}
			}
			if(result[1].showNext){		//result[1]에 해당하는 요소들에 따라 실행
				tmp += '<li class="page-item"><button class="page-link" onclick="endPage()">&gt;</button></li>';
			}
		}
		tmp += '</ul></div></div>';
		return tmp;
	}

  </script>
	
  <!--푸터 인클루드-->
</body>
</html>