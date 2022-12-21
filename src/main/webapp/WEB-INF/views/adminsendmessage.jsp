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
													<c:when test="${MemberDto.user_role == 0}">일반회원</c:when>
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
	let to_message = [];
	
	function Close_Modal(){
		to_message = [];
		$('#User_Message_Modal').modal('hide');	
		let pageData = {page:1};
		$.ajax({
			type:'post',	//통신방식 (get,post)
			url: '/purplaying/admin/pageselect',                                                                                
			headers:{"content-type" : "application/json"},
			dataType : 'text',
			data : JSON.stringify(pageData),
			success:function(result){
				let result_List = JSON.parse(result)
				var result_i = [result_List.totalCnt,result_List.pr,result_List.UserList]
				$('#user_list').html(touserlist_HTML(result_i))
				$('#paging_user').html(touserPages_HTML(result_i))
			},
			error : function(){
				alert("error");
			}					
		}); 
	}
	
	function send_message(){
		let title = $('#message_title').val()
		let user_id = $('#selected_user_list').val()
		let context = $('#message_context').val()
		$.post('/purplaying/admin/sendgroupmessage',{title:title, user_id:user_id, context:context}, function(result){
			alert("보내기 성공")
	    })
	}
	
  	function choice_to_user(){
  		$('#User_Message_Modal').modal({backdrop: 'static', keyboard: false});
  		$('#User_Message_Modal').modal('show');	
  	}
  	function select_user(element){
  		let find_user_no = 0;
  		let user = element.parentNode.nextElementSibling.nextElementSibling.innerHTML
  		
  		if(!to_message.includes(user)){
  			to_message.push(user)
  		}
  		else{
  			find_user_no = to_message.indexOf(user)
  			to_message.splice(find_user_no,1)
  		}
  	}
  	function add_touser(){
  		let user_list = "";
  		for(let i =0; i<to_message.length; i++){
  			if(i!=to_message.length-1){
  				user_list = user_list + to_message[i]+','
  			}
  			else{
  				user_list = user_list + to_message[i]
  			}
  		}
  		$('#selected_user_list').val(user_list)
  		
  		$('#User_Message_Modal').modal('hide');	
  	}
  	
  	function select_user_all(element){
  		let user_no_list = $('#user_list').find('.child').find('th').next()
  		if(element.checked){
	  		for(let i = 0; i<user_no_list.length; i++){
		  		if(!to_message.includes($(user_no_list[i]).html())){
		  			to_message.push($(user_no_list[i]).html())
		  		}
		  	} 
	  		$('[name=agree]').prop("checked", true);
  		}else{
  			for(let i = 0; i<user_no_list.length; i++){
  				if(to_message.includes($(user_no_list[i]).html())){
  					find_user_no = to_message.indexOf($(user_no_list[i]).html())
		  			to_message.splice(find_user_no,1)
		  		}
  			}
  			$('[name=agree]').prop("checked", false);
  		}
  	}
  	
  	function page(element){
  		pageData = {page:element.innerHTML};
  		
  		$.ajax({
			type:'post',	//통신방식 (get,post)
			url: '/purplaying/admin/pageselect',                                                                                
			headers:{"content-type" : "application/json"},
			dataType : 'text',
			data : JSON.stringify(pageData),
			success:function(result){
				let result_List = JSON.parse(result)
				var result_i = [result_List.totalCnt,result_List.pr,result_List.UserList]
				$('#user_list').html(touserlist_HTML(result_i))
				$('#paging_user').html(touserPages_HTML(result_i))
			},
			error : function(){
				alert("error");
			}					
		}); 
  	}
  	</script>
  	<script type="text/javascript">
  	
  	let touserlist_HTML = function(result){
		let tmp = "<table class='table table-hover'><tr class='table-Secondary'><th class='selectAll'><div class='form-check'><input type='checkbox' class='form-check-input' id='agreeAll' name='agree' onclick='select_user_all(this)'></div></th><th class='user_no' scope='col'>번호</th><th class='user_id' scope='col'>아이디</th>";
		tmp += "<th class='user_name' scope='col'>이름</th><th class='user_nickname' scope='col'>닉네임</th><th class='user_phone' scope='col'>전화번호</th>";
		tmp += "<th class='user_role' scope='col'>권한</th><th class='role_change' scope='col'></th>";
		tmp += '</tr>';
		let size = result[2].length
		result[2].forEach(function(result_item){
			tmp += '<tr class="child"><td>';
			if(to_message.includes(result_item.user_no)){
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
		if(result[0] == null){
			tmp += '<div> 유저가 없습니다.</div>';
		}
		else{
			if(result[1].showPrev){
				tmp += '<li class="page-item"><button class="page-link" onclick="beginPage()">&lt;</button></li>';
			}
			for(let i=result[1].beginPage; i<result[1].endPage+1; i++){
				tmp += '<li class="page-item"><button class="page-link"'; 
				if(result[1].sc.page==i){
					tmp += 'style="background-color:#9e62fa; color:#fff;"onclick="page(this)">'+i+'</button></li>';
				}
				else{
					tmp += 'onclick="page(this)">'+i+'</button></li>';
				}
			}
			if(result[1].showNext){
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