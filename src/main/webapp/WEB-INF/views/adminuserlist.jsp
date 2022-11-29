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
    		<form id="searchUserform" action="<c:url value="/admin/userlist"></c:url>" method="get" class="justify-content-end d-flex">
	  			<input name="keyword" id="searchUser" type="text" value="${param.keyword }"/>
        	</form>
        	<div id="user_list" class="justify-content-center d-flex">
	        	<table>
	        	<tr>
					<th class="user_no">번호</th>
					<th class="user_id">아이디</th>
					<th class="user_name">이름</th>
					<th class="user_phone">전화번호</th>
					<th class="user_regdate">등록일</th>
					<th class="user_active">활성화/비활성화</th>
					<th class="user_role">권한</th>
					<th class="user_role_select">권한 선택</th>
					<th class="user_role"></th>
				</tr>
	        	<c:forEach var="MemberDto" items="${UserList}">
					<tr>
						<td name="user_no-${MemberDto.user_no}">${MemberDto.user_no}</td>
						<td name="user_id-${MemberDto.user_no}">${MemberDto.user_id}</td>
						<td name="user_name-${MemberDto.user_no}">${MemberDto.user_name}</td>
						<td name="user_phone-${MemberDto.user_no}">${MemberDto.user_phone}</td>
						<td name="user_regdate-${MemberDto.user_no}"><fmt:formatDate value="${MemberDto.user_regdate}" pattern="yyyy-MM-dd" type="date" /></td>
						<td name="user_active-${MemberDto.user_no}">${MemberDto.user_activate}</td>
						<td name="user_role-${MemberDto.user_no}">${MemberDto.user_role}</td>
						<td name="user_role_select-${MemberDto.user_no}">
							<select id="role_select-${MemberDto.user_no}" class="form-select fs-6" name="role_select">
			              	  <option value="0"<c:if test="${MemberDto.user_role == 0}">selected</c:if>>일반회원</option>
			              	  <option value="1"<c:if test="${MemberDto.user_role == 1}">selected</c:if>>관리자</option>
							</select>
						</td>
						<td name="save_change-${MemberDto.user_no}">
							<button type="button" onclick="save_change()">저장하기</button>
						</td>
					</tr>
				</c:forEach>
			</table>
			</div>
			<div class="paging-container">
				<div class="justify-content-center d-flex" id="paging_user">
					<c:if test="${totalCnt == null}">
						<div> 게시물이 없습니다.</div>
					</c:if>
					<c:if test="${totalCnt != null || totalCnt != 0 }">
						<c:if test="${pr.showPrev }">
							<a class="page" href="<c:url value="/admin/userlist${pr.sc.getQueryString(pr.beginPage-1) }" />"> &lt; </a>
						</c:if>
						<c:forEach var="i" begin="${pr.beginPage }" end="${pr.endPage }">
							<a class="page <c:if test="${pr.sc.page==i}">active</c:if>" href="<c:url value="/admin/userlist${pr.sc.getQueryString(i)}" />">${i }</a>
						</c:forEach>
						<c:if test="${pr.showNext }">
							<a class="page" href="<c:url value="/admin/userlist${pr.sc.getQueryString(pr.endPage+1) }" />"> &gt; </a>
						</c:if>						
					</c:if>
				</div>
			</div>
		</div>
	</div>
  </section>
  
  <script type="text/javascript">
  /* 파일 업로드 */
  	function save_change(){
  		eventTarget = event.target;
  		let role_select = eventTarget.parentNode.previousElementSibling.firstElementChild;
  		let user_no = eventTarget.parentNode.parentNode.firstElementChild.innerHTML;
 		let role_value = role_select.options[role_select.selectedIndex].value;
 		let user_data = {user_no:user_no,user_role:role_value};
  	
 		$.ajax({
			type:'post',	//통신방식 (get,post)
			url: '/purplaying/admin/listUser',                                                                                
			headers:{"content-type" : "application/json"},
			dataType : 'text',
			data : JSON.stringify(user_data),
			success:function(result){
				$('#user_list').html(toHtmlUser(JSON.parse(result)))
				
			},
			error : function(){
				alert("error");
			}					
		}); 
  	}
  	let toHtmlUser = function(table){
		let tmp = "<table><tr><th class='user_no'>번호</th><th class='user_id'>아이디</th><th class='user_name'>이름</th>";
		tmp += "<th class='user_phone'>전화번호</th><th class='user_regdate'>등록일</th><th class='user_active'>활성화/비활성화</th>";
		tmp += "<th class='user_role'>권한</th><th class='user_role_select'>권한 선택</th><th class='user_role'></th></tr>";
	
		table.forEach(function(table_item){
			tmp += '<tr>'
			tmp += '<td name="user_no-'+table_item.user_no+'">'+table_item.user_no+'</td>';
			tmp += '<td name="user_id-'+table_item.user_no+'">'+table_item.user_id+'</td>';
			tmp += '<td name="user_name-'+table_item.user_no+'">'+table_item.user_name+'</td>';
			tmp += '<td name="user_phone-'+table_item.user_no+'">'+table_item.user_phone+'</td>';
			tmp += '<td name="user_regdate-'+table_item.user_no+'">'+toStringByFormatting(table_item.user_regdate)+'</td>';
			tmp += '<td name="user_active-'+table_item.user_no+'">'+table_item.user_activate+'</td>';
			tmp += '<td name="user_role-'+table_item.user_no+'">'+table_item.user_role+'</td>';
			tmp += '<td name="user_role_select-'+table_item.user_no+'">';
			tmp += '<select id="role_select-'+table_item.user_no+'" class="form-select fs-6" name="role_select">';
			if(table_item.user_role == 1){
				tmp += '<option value="0">일반회원</option>';
				tmp += '<option value="1" selected>관리자</option>';
			}
			else if(table_item.user_role == 0){
				tmp += '<option value="0" selected>일반회원</option>';
				tmp += '<option value="1">관리자</option>';
			}
			tmp += '</select>';
			tmp	+= '</td>';
			tmp += '<td name="save_change-'+table_item.user_no+'">';
			tmp += '<button type="button" onclick="save_change()">저장하기</button>';
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