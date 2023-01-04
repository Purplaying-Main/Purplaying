<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <!DOCTYPE html>
<html>
<head>
  <!-- meta태그, CSS, JS, 타이틀 인클루드  -->
  <%@ include file ="meta.jsp" %>
</head>
<body>
  <!--헤더 인클루드-->
   <%@ include file ="adminheader.jsp" %>
   
  <!--메인 컨테이너 -->
  <section>
  	<div class="container">
    	<div class="my-4"> <!-- 탭 메뉴 -->
    		<form id="searchUserform" action="<c:url value="/admin/userlist"></c:url>" method="get" class="col-10 row mx-auto justify-content-end" >
	  			<input class="form-control w-25 mb-4" name="keyword" id="searchUser" type="text" placeholder="이름을 입력하세요" value="${param.keyword }"/>
        	</form>
        	<div id="user_list" class="row mx-auto col-10">
	        	<table class="table table-hover">
	        	<tr class="table-Secondary">
					<th class="user_no" scope="col">번호</th>
					<th class="user_id" scope="col">아이디</th>
					<th class="user_name" scope="col">이름</th>
					<th class="user_nickname" scope="col">닉네임</th>
					<th class="user_phone" scope="col">전화번호</th>
					<th class="user_regdate" scope="col">등록일</th>
					<th class="user_role" scope="col">권한</th>
					<th class="role_change" scope="col"> </th>
				</tr>
	        	<c:forEach var="MemberDto" items="${UserList}">
					<tr>
						<th class="align-middle" scope="row" id="user_no-${MemberDto.user_no}">${MemberDto.user_no}</th>
						<td class="align-middle" id="user_id-${MemberDto.user_no}">${MemberDto.user_id}</td>
						<td class="align-middle" id="user_name-${MemberDto.user_no}">${MemberDto.user_name}</td>
						<td class="align-middle" id="user_nickname-${MemberDto.user_no}">${MemberDto.user_nickname}</td>
						<td class="align-middle" id="user_phone-${MemberDto.user_no}">${MemberDto.user_phone}</td>
						<td class="align-middle" id="user_regdate-${MemberDto.user_no}"><fmt:formatDate value="${MemberDto.user_regdate}" pattern="yyyy-MM-dd" type="date" /></td>
						<td class="align-middle" id="user_role-${MemberDto.user_no}">
							<c:choose>
								<c:when test="${MemberDto.user_role eq 'ROLE_USER' }">일반회원</c:when>
								<c:otherwise>관리자</c:otherwise>
							</c:choose>
						</td>
						<td id="save_change-${MemberDto.user_no}">
							<input type="hidden" value="${MemberDto.user_no}"/>
							<input type="hidden" value="${MemberDto.user_role}"/>
							<button type="button" class="btn btn-primary" onclick="goto_Userrole_modal()">변경하기</button>
						</td>
					</tr>
				</c:forEach>
				</table>
			</div>
				<div class="modal fade" id="User_Role_Modal" tabindex="-1" aria-labelledby="pointpayModalLabel" aria-hidden="true" >
					<div class="modal-dialog" role="document">
						<div class="modal-content">
				            <div class="modal-header p-5 pb-4 border-bottom-0">
				                <h5 class="fw-bold mb-0">권한 변경하기</h5>
				                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				            </div>
			                <div class="modal-body p-5 pt-0">
			                	<input type="hidden" id="user_no_modal"/>
			                    <select id="User_Role" class="form-select fs-6">
									<option value="ROLE_ADMIN">관리자</option>
									<option value="ROLE_USER">일반 회원</option>
								</select>
							</div>
			                <div class="modal-footer">
			                    <button id="gotochangeBtn" class="btn btn-primary" onclick="save_change()">변경하기</button> 
			                </div>
			          <!-- modal body -->
					    </div>
					</div>
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
									<a class="page-link" href="<c:url value="/admin/userlist${pr.sc.getQueryString(pr.beginPage-1) }" />"> &lt; </a>
								</li>
							</c:if>
							<c:forEach var="i" begin="${pr.beginPage }" end="${pr.endPage }">
								<li class="page-item">
									<a class="page-link <c:if test="${pr.sc.page==i}">active</c:if>" href="<c:url value="/admin/userlist${pr.sc.getQueryString(i)}" />">${i }</a>
								</li>
							</c:forEach>
							<c:if test="${pr.showNext }">
								<li class="page-item">
									<a class="page-link" href="<c:url value="/admin/userlist${pr.sc.getQueryString(pr.endPage+1) }" />"> &gt; </a>
								</li>
							</c:if>						
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
  </section>
  
  <script type="text/javascript">
	  //유저권한 수정 모달 호출 function
	  function goto_Userrole_modal(){
		  eventTarget = event.target;		//이벤트 발생시킨 html태그 저장
		  user_role = eventTarget.previousElementSibling.value		//이벤트 발생 요소기준 부모,자식관계 이용 유저권한 저장
		  user_no = eventTarget.previousElementSibling.previousElementSibling.value //이벤트 발생 요소기준기준 부모,자식관계 이용 유저번호 저장
		  
		  $('#User_Role').val(user_role)
		  $('#user_no_modal').val(user_no)
		  $('#User_Role_Modal').modal({backdrop: 'static', keyboard: false});
		  $('#User_Role_Modal').modal("show");		//유저권한 수정 모달 출력	  
	  }
	    
	  //유저권한 저장 function
	  	function save_change(){
	  		let role_select = $('#User_Role').val();		//변경된 유저권한 저장
	  		let user_no = $('#user_no_modal').val();		//유저번호 저장
	 		let user_data = {user_no:user_no,user_role:role_select};	//유저권한 변경시 필요한 data Json형태로 저장
	  	
	 		$.ajax({		//유저권한 수정 ajax로 요청
				type:'post',
				url: '/purplaying/admin/listUser',                                                                                
				headers:{"content-type" : "application/json"},
				dataType : 'text',
				data : JSON.stringify(user_data),
				beforeSend: function(xhr){
			        xhr.setRequestHeader(header, token);
			    },
				success:function(result){		//유저권한 수정 성공시 호출
					if(result=='true'){
						$('#User_Role_Modal').modal("hide");	//유저권한 수정 모달 종료
						window.location.reload();		//페이지 새로고침
					}
				},
				error : function(){		//유저권한 수정 실패시 호출
					alert("error");
				}					
			}); 
	  	}
	
  	</script>
	
  <!--푸터 인클루드-->
</body>
</html>