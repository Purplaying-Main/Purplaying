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
						<th scope="row" id="user_no-${MemberDto.user_no}">${MemberDto.user_no}</th>
						<td id="user_id-${MemberDto.user_no}">${MemberDto.user_id}</td>
						<td id="user_name-${MemberDto.user_no}">${MemberDto.user_name}</td>
						<td id="user_nickname-${MemberDto.user_no}">${MemberDto.user_nickname}</td>
						<td id="user_phone-${MemberDto.user_no}">${MemberDto.user_phone}</td>
						<td id="user_regdate-${MemberDto.user_no}"><fmt:formatDate value="${MemberDto.user_regdate}" pattern="yyyy-MM-dd" type="date" /></td>
						<td id="user_role-${MemberDto.user_no}">
							<c:choose>
								<c:when test="${MemberDto.user_role == 0}">일반회원</c:when>
								<c:otherwise>관리자</c:otherwise>
							</c:choose>
						</td>
						<td id="save_change-${MemberDto.user_no}">
							<input type="hidden" value="${MemberDto.user_no}"/>
							<input type="hidden" value="${MemberDto.user_role}"/>
							<button type="button" onclick="goto_Userrole_modal()">변경하기</button>
						</td>
					</tr>
				</c:forEach>
			</table>
				<div class="modal fade" data-keyboard="false" data-backdrop="static" id="User_Role_Modal" role="dialog" tabindex="-1" aria-labelledby="pointpayModalLabel" aria-hidden="true" >
					<div class="modal-dialog" role="document">
						<div class="modal-content">
				            <div class="modal-header p-5 pb-4 border-bottom-0">
				                <h5 class="fw-bold mb-0">권한 변경하기</h5>
				                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				            </div>
			                <div class="modal-body p-5 pt-0">
			                	<input type="hidden" id="user_no_modal"/>
			                    <select id="User_Role" class="form-select fs-6">
									<option value="1">관리자</option>
									<option value="0">일반 회원</option>
								</select>
							</div>
			                <div class="modal-footer">
			                    <button id="gotochangeBtn" class="btn btn-primary" onclick="save_change()">변경하기</button> 
			                </div>
			          <!-- modal body -->
					    </div>
					</div>
				</div>
			</div>
			<div class="paging-container">
				<div class="justify-content-center d-flex" id="paging_user">
					<div class="col-1"></div>
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
  function goto_Userrole_modal(){
	  eventTarget = event.target;
	  user_role = eventTarget.previousElementSibling.value
	  user_no = eventTarget.previousElementSibling.previousElementSibling.value
	  $('#User_Role').val(user_role)
	  $('#user_no_modal').val(user_no)
	  $('#User_Role_Modal').modal("show");
	  
  }
  
  /* 파일 업로드 */
  	function save_change(){
  		eventTarget = event.target;
  		let role_select = $('#User_Role').val();
  		let user_no = $('#user_no_modal').val();
 		let user_data = {user_no:user_no,user_role:role_select};
  	
 		$.ajax({
			type:'post',	//통신방식 (get,post)
			url: '/purplaying/admin/listUser',                                                                                
			headers:{"content-type" : "application/json"},
			dataType : 'text',
			data : JSON.stringify(user_data),
			success:function(result){
				$('#User_Role_Modal').modal("hide");
				$('#user_list').html(toHtmlUser(JSON.parse(result)))
				
			},
			error : function(){
				alert("error");
			}					
		}); 
  	}
  	let toHtmlUser = function(table){
		let tmp = "<table class='table table-hover'><tr class='table-Secondary'><th class='user_no' scope='col'>번호</th><th class='user_id' scope='col'>아이디</th><th class='user_name' scope='col'>이름</th>";
		tmp += "<th class='user_nickname' scope='col'>닉네임</th><th class='user_phone' scope='col'>전화번호</th><th class='user_regdate' scope='col'>등록일</th>";
		tmp += "<th class='user_role' scope='col'>권한</th><th class='role_change' scope='col'></th></tr>";
	
		table.forEach(function(table_item){
			tmp += '<tr>'
			tmp += '<th scope="row" id="user_no-'+table_item.user_no+'">'+table_item.user_no+'</th>';
			tmp += '<td id="user_id-'+table_item.user_no+'">'+table_item.user_id+'</td>';
			tmp += '<td id="user_name-'+table_item.user_no+'">'+table_item.user_name+'</td>';
			tmp += '<td id="user_nickname-'+table_item.user_no+'">'+table_item.user_nickname+'</td>';
			tmp += '<td id="user_phone-'+table_item.user_no+'">'+table_item.user_phone+'</td>';
			tmp += '<td id="user_regdate-'+table_item.user_no+'">'+toStringByFormatting(table_item.user_regdate)+'</td>';
			tmp += '<td id="user_role-'+table_item.user_no+'">';
			if(table_item.user_role==1){
				tmp +='관리자</td>';
			}
			else if(table_item.user_role == 0){
				tmp +='일반회원</td>';
			}
			tmp += '<td id="save_change-'+table_item.user_no+'">';
			tmp += '<input type="hidden" value="'+table_item.user_no+'"/>';
			tmp += '<input type="hidden" value="'+table_item.user_role+'"/>'
			tmp += '<button type="button" onclick="goto_Userrole_modal()">변경하기</button>';
			tmp	+='</td>';
			tmp += '</tr>';
		});
		tmp += "</table>";
		return tmp;
	}
 	function toStringByFormatting(source,delimiter = '-'){
 		let date_source = new Date(source);
	    let month = date_source.getMonth() + 1;
        let day = date_source.getDate();
       
        month = month >= 10 ? month : '0' + month;
        day = day >= 10 ? day : '0' + day;
      
        return date_source.getFullYear() + '-' + month + '-' + day;
 		
 	} 
  </script>
	
  <!--푸터 인클루드-->
</body>
</html>