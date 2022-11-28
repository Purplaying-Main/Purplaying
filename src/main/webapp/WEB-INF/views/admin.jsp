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
   <%@ include file ="header.jsp" %>
   
  <!--메인 컨테이너 -->
  <section>
  <div class="container">
    <div class="my-4"> <!-- 탭 메뉴 -->
	  <div class="nav nav-tabs" id="v-pills-tab" role="tablist">
	    <button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab01" type="button" role="tab" aria-controls="v-pills-tab01" aria-selected="true">유저 권한</button>
	    <button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab02" type="button" role="tab" aria-controls="v-pills-tab02" aria-selected="false">펀딩 게시글</button>
	    <button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab03" type="button" role="tab" aria-controls="v-pills-tab03" aria-selected="false">커뮤니티</button> 
	  </div>
	</div>
    <div class="row container mb-4 px-5"><!-- 탭 컨텐츠 start -->
      <div class="tab-content row mx-auto" id="v-pills-tabContent">
        <!-- tab 1 contents -->
        <div class="tab-pane fade show active" id="v-pills-tab01" role="tabpanel" aria-labelledby="v-pills-tab01-tab">
        	<div id="user_list">
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
        </div>
        </div>
        <div class="tab-content row mx-auto" id="v-pills-tabContent">
        <!-- tab 1 contents -->
        <div class="tab-pane fade" id="v-pills-tab02" role="tabpanel" aria-labelledby="v-pills-tab02-tab">
        	<div id="product_list">
	        	<table>
	        	<tr>
					<th class="prdt_id">번호</th>
					<th class="prdt_name">제목</th>
					<th class="prdt_writer">작성자</th>
					<th class="prdt_opendate">오픈일</th>
					<th class="prdt_enddate">종료일</th>
					<th class="prdt_goal">목표금액</th>
					<th class="prdt_currenttotal">현재금액</th>
					<th class="prdt_save"></th>
				</tr>
	        	<c:forEach var="projectDto" items="${projectList}">
					<tr>
						<td name="prdt_id-${projectDto.prdt_id}">${projectDto.prdt_id}</td>
						<td name="prdt_name-${projectDto.prdt_id}"><a href="${pageContext.request.contextPath}/project/${projectDto.prdt_id}">${projectDto.prdt_name}</a></td>
						<td name="prdt_writer-${projectDto.prdt_id}">${projectDto.writer}</td>
						<td name="prdt_opendate-${projectDto.prdt_id}"><fmt:formatDate value="${projectDto.prdt_opendate}" pattern="yyyy-MM-dd" type="date" /></td>
						<td name="prdt_enddate-${projectDto.prdt_id}"><fmt:formatDate value="${projectDto.prdt_enddate}" pattern="yyyy-MM-dd" type="date" /></td>
						<td name="prdt_goal-${projectDto.prdt_id}">${projectDto.prdt_goal}</td>
						<td name="prdt_currenttotal-${projectDto.prdt_id}">${projectDto.prdt_currenttotal}</td>
						<td name="prdt_delete-${projectDto.prdt_id}">
							<button type="button" onclick="delete_project()">삭제하기</button>
						</td>
					</tr>
				</c:forEach>
			</table>
			</div>
        </div> <!-- tab 1 contents -->
        <div class="tab-pane fade" id="v-pills-tab03" role="tabpanel" aria-labelledby="v-pills-tab03-tab">
        <div class="input-group mb-3">
                <input type="file" class="form-control" name="file_id" id="file_id" value="${attachFileDto.file_id}"/>
                <button class="btn btn-outline-primary" id="fileAddBtn">Upload</button>
              </div>
        	<div id="product_list">
	        	<table>
	        	<tr>
					<th class="prdt_id">번호</th>
					<th class="prdt_name">제목</th>
					<th class="prdt_writer">작성자</th>
					<th class="prdt_opendate">오픈일</th>
					<th class="prdt_enddate">종료일</th>
					<th class="prdt_goal">목표금액</th>
					<th class="prdt_currenttotal">현재금액</th>
					<th class="prdt_save"></th>
				</tr>
	        	<c:forEach var="projectDto" items="${projectList}">
					<tr>
						<td name="prdt_id-${projectDto.prdt_id}">${projectDto.prdt_id}</td>
						<td name="prdt_name-${projectDto.prdt_id}"><a href="${pageContext.request.contextPath}/project/${projectDto.prdt_id}">${projectDto.prdt_name}</a></td>
						<td name="prdt_writer-${projectDto.prdt_id}">${projectDto.writer}</td>
						<td name="prdt_opendate-${projectDto.prdt_id}"><fmt:formatDate value="${projectDto.prdt_opendate}" pattern="yyyy-MM-dd" type="date" /></td>
						<td name="prdt_enddate-${projectDto.prdt_id}"><fmt:formatDate value="${projectDto.prdt_enddate}" pattern="yyyy-MM-dd" type="date" /></td>
						<td name="prdt_goal-${projectDto.prdt_id}">${projectDto.prdt_goal}</td>
						<td name="prdt_currenttotal-${projectDto.prdt_id}">${projectDto.prdt_currenttotal}</td>
						<td name="prdt_delete-${projectDto.prdt_id}">
							<button type="button" onclick="delete_project()">삭제하기</button>
						</td>
					</tr>
				</c:forEach>
			</table>
			</div>
        </div>

        </div>
       </div>
      </div>
     </div>
  </section>
  
  <script type="text/javascript">
  /* 파일 업로드 */
  	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$")
	var maxSize = 5242880 //5MB
	function checkExtension(file_name, fileSize) {
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과")
			return false
		}
		if(regex.test(file_name)){
			alert("해당 확장자의 파일은 업로드할 수 없습니다. ")
			return false
		}
		return true
	}
  
	$("#fileAddBtn").on("click", function() {
		var formData = new FormData()
		var inputFile = $("#file_id")
		var files = inputFile[0].files
		console.log(files)

		for (var i=0; i<files.length; i++){
			if(!checkExtension(files[i].name, files[i].size)){
				return false
			}
			formData.append("uploadFile", files[i]);
			//formData.append("prdt_id", prdt_id);
		}
		
		$.ajax({
			type: 'POST',	
			url: '/purplaying/admin/adminUpload',
			enctype: "multpart/form-data",
			data : formData,
			processData: false,
		    contentType: false,
		    dataType:'json',
			success: function(result) {
				console.log(result)
				//showUploadedFile(result)
			
				},
			error : function() { alert("error") }
		}) 
	})
  	function delete_project(){
  		eventTarget = event.target;
  		let prdt_id = eventTarget.parentNode.parentNode.firstElementChild.innerHTML;
  		let prdt_data = {prdt_id:prdt_id};
  		$.ajax({
			type:'post',	//통신방식 (get,post)
			url: '/purplaying/admin/listProject',                                                                                
			headers:{"content-type" : "application/json"},
			dataType : 'text',
			data : JSON.stringify(prdt_data),
			success:function(result){
				$('#product_list').html(toHtmlProduct(JSON.parse(result)))
			},
			error : function(){
				alert("error");
			}					
		});
  	}
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
  	let toHtmlProduct = function(table){
  		let tmp = "<table><tr><th class='prdt_id'>번호</th><th class='prdt_name'>제목</th><th class='prdt_writer'>작성자</th>";
  	 	tmp += "<th class='prdt_opendate'>오픈일</th><th class='prdt_enddate'>종료일</th><th class='prdt_goal'>목표금액</th>";
  		tmp += "<th class='prdt_currenttotal'>현재금액</th><th class='prdt_save'></th></tr>";
  		
		table.forEach(function(table_item){
			tmp += '<tr>'
			tmp += '<td name="prdt_id-'+table_item.prdt_id+'">'+table_item.prdt_id+'</td>';
			tmp += '<td name="prdt_name-'+table_item.prdt_id+'"><a href="${pageContext.request.contextPath}/project/'+table_item.prdt_id+'">'+table_item.prdt_name+'</a></td>';
			tmp += '<td name="prdt_writer-'+table_item.prdt_id+'">'+table_item.prdt_writer+'</td>';
			tmp += '<td name="prdt_opendate-'+table_item.prdt_id+'">'+toStringByFormatting(table_item.prdt_opendate)+'</td>';
			tmp += '<td name="prdt_enddate-'+table_item.prdt_id+'">'+toStringByFormatting(table_item.prdt_enddate)+'</td>';
			tmp += '<td name="prdt_goal-'+table_item.prdt_id+'">'+table_item.prdt_goal+'</td>';
			tmp += '<td name="prdt_currenttotal-'+table_item.prdt_id+'">'+table_item.currenttotal+'</td>'
			tmp += '<td name="prdt_delete-'+table_item.prdt_id+'">';
			tmp += '<button type="button" onclick="delete_project()">삭제하기</button>';
			tmp	+='</td>';
			tmp += '</tr>';
		});
		tmp += "</table>";
		return tmp;
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