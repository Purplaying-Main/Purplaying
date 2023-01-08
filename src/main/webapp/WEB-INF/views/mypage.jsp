<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:set var="loginId" value="${user_id}" />
<c:set var="default_thumbnail" value="${projectDto.prdt_thumbnail == null ? '' : 'display:none' }"/>
<c:set var="display_thumbnail" value="${projectDto.prdt_thumbnail == null ? 'display:none' : '' }"/>
<c:set var="today" value="<%=new java.util.Date()%>"/>
<fmt:formatDate var="now" value="${today }" type="date"  pattern="yyyy-MM-dd"/>


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
    <h1 class="visually-hidden">HOME</h1>
    <div class="contentsWrap">
    
      <!--컨텐츠 영역-->
      <div class="row justify-content-md-center">
        <h2 class="col-auto mb-5">마이 페이지</h2>
      </div>
      
      <!-- 탭 메뉴 -->
        <div class="mb-4">
          <div class="nav nav-tabs nav-justified" id="v-pills-tab" role="tablist">
            <button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab01" type="button" role="tab" aria-controls="v-pills-tab01" aria-selected="true">펀딩현황</button>
            <button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab02" type="button" role="tab" aria-controls="v-pills-tab02" aria-selected="false">관심펀딩</button>
            <button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab03" type="button" role="tab" aria-controls="v-pills-tab03" aria-selected="false">알림</button>          </div>
        </div>
        
        <!-- 펀딩현황 탭 시작 -->
        <div class="col-10 mx-auto">
          <div class="tab-content" id="v-pills-tabContent">          
            <div class="tab-pane fade show active" id="v-pills-tab01" role="tabpanel" aria-labelledby="v-pills-tab01-tab">
            
            <!-- 창작중인 펀딩 영역-->
              <h5 class="my-4">${prc.user_id}님이 창작중인 펀딩</h5>
			  <c:if test="${fn:length(list) ne 0}">
			  <c:forEach var="projectDto" items="${list}">
		             <form id="form" class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative"> 
		                <div class="col-auto d-none d-lg-block">
		                	<img class="bd-placeholder-img" width="230" height="100%" id="prdt_thumbnail" name="prdt_thumbnail"
		                		src="${projectDto.prdt_thumbnail}" style="${projectDto.prdt_thumbnail == null ? 'display:none' : '' }" >  
		                </div>
		                <div class="col p-4 d-flex flex-column position-static">
		                  <div class="row justify-content-between mb-2">
		                    <div class="col-auto me-auto text-primary">
		                    <c:choose>
		                    	<c:when test="${projectDto.prdt_comingday > 0 }">펀딩 예정</c:when>
		                    	<c:when test="${projectDto.prdt_dday >= 0}">펀딩 중</c:when>
		                    	<c:when test="${projectDto.prdt_comingday < 0 }">펀딩 종료</c:when>
		                    	<c:otherwise>펀딩상태</c:otherwise>
		                    </c:choose> 
		                    | 펀딩번호 ${projectDto.prdt_id }
		                    </div> 
		                    <div class="d-flex col-auto">
		                    	<div class="me-3">
		                    		 <a href="${pageContext.request.contextPath}/mypage/fundingmanage/${projectDto.prdt_id}">관리</a>
		                    	</div>
		                      <!-- on off btn -->
		                      <div class="form-check form-switch">
		                        <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked>
		                        <label class="form-check-label" for="flexSwitchCheckChecked"></label>
		                      </div>
		                    </div>
		                  </div>
		                  <a href='<c:url value="/project/modify/${projectDto.prdt_id }"/>'>
		                  <h4 class="mb-0">${projectDto.prdt_name}</h4>
		                  </a> 
		                  <p class="mb-1 text-danger">현재 달성률 ${projectDto.prdt_percent}% 
		                  <c:choose>
			                  <c:when test="${projectDto.prdt_comingday > 0 }">공개 D-${projectDto.prdt_comingday}</c:when>
			                  <c:when test="${projectDto.prdt_dday > 0}">종료 D-${projectDto.prdt_dday}</c:when>
			                  <c:when test="${projectDto.prdt_dday < 0}">종료 D+${-projectDto.prdt_dday}</c:when>
			                  <c:otherwise>D-DAY 출력</c:otherwise>
		                  </c:choose>
		                  </p>
		                  <p class="card-text mb-2 text-truncate" style="max-width:500px">${projectDto.prdt_desc}</p>
		                  <p class="text-muted mb-0">심사완료</p>
		                </div>
		             </form>  
		      </c:forEach>
		      </c:if>
	          
              <!-- 신규 프로젝트 작성 버튼 -->
              <div class="row">
             	 <button type="button" class="mx-auto col-8 btn btn-lg btn-outline-primary" onclick="location.href='project/write'">신규프로젝트 신청하기</button>
              </div>
              <hr class="mt-4 mb-2">
              
              <!-- 후원중인 펀딩 영역-->
              <h5 class="mt-4 mb-2">${prc.user_id}님이 후원중인 펀딩</h5>
               <c:choose>
               	<c:when test="${fn:length(userF) ne 0 }">
               	<c:set var="i" value="0"/>
              	<c:forEach items="${userF }" begin="0" end="${fn:length(userF)/8-1}">
	              <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
	                 <div class="col-auto d-none d-lg-block">
			             <img class="bd-placeholder-img" width="230" height="100%" id="prdt_thumbnail" name="prdt_thumbnail" src="${userF[i+2]}" style="${userF[i+2] == null ? 'display:none' : '' }" >                  
			         </div>
	                <div class="col p-4 d-flex flex-column position-static">
	                  <div class="row justify-content-between mb-2">
	                    <p class="col-auto me-auto text-primary">		                    
	                    		<c:choose>
			                    	<c:when test="${userF[i+5] > 0 }">펀딩 예정</c:when>
			                    	<c:when test="${userF[i+6] >= 0}">펀딩 중</c:when>
			                    	<c:when test="${userF[i+5] < 0 }">펀딩 종료</c:when>
			                    	<c:otherwise>펀딩상태</c:otherwise>
			                    </c:choose> | 펀딩번호 ${userF[i+1]}</p> 
	                    <div class="col-auto">
	                      <a href="${pageContext.request.contextPath}/paymentCompleted/${userF[i]}">결제내역 상세보기</a>
	                    </div>
	                  </div>
	                  <h4 class="mb-0"><a href="${pageContext.request.contextPath}/project/${userF[i+1]}">${userF[i+3]}</a></h4>
	                  <p class="mb-1 text-danger">현재 달성률 ${userF[i+7]}% 종료
	                  <c:choose>
	                  	<c:when test="${userF[i+6] >=0}">D-${userF[i+6]}</c:when>
	                  	<c:when test="${userF[i+6] <0}">D+${-userF[i+6]}</c:when>
	                  	<c:otherwise>종료일</c:otherwise>
	                  </c:choose>
	                 </p>
	                  <p class="card-text mb-2 text-truncate" style="max-width:500px">${userF[i+4]}</p>
	                </div>
	              </div>
	              	<c:set var="i" value="${i+8 }"/>
                </c:forEach>
               	</c:when>
	               	<c:otherwise>
		               	<div class="text-center mt-4">
		               		<h5>현재 후원중인 펀딩이 없습니다.</h5>
		               	</div>
	               	</c:otherwise>
               </c:choose>
              <div class="my-4">
              </div>
            </div>
            <!-- 펀딩현황 탭 종료 -->
            
            <!-- 관심 tab -->
            <div class="tab-pane fade" id="v-pills-tab02" role="tabpanel" aria-labelledby="v-pills-tab02-tab">
              <h5 class="my-4">${user_id}님이 관심중인 펀딩</h5>
              <!-- project card start-->
             <c:choose>
              <c:when test="${fn:length(list_like) ne 0 }">
              <!-- project card start-->
              <c:forEach var="projectDto" items="${list_like}">
	              
             		<!-- project card start -->
           		
	              <form id="form" class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
	                <div class="col-auto d-none d-lg-block">
	                	<img class="bd-placeholder-img" width="230" height="100%" id="prdt_thumbnail" name="prdt_thumbnail"
	                		src="${projectDto.prdt_thumbnail}" style="${projectDto.prdt_thumbnail == null ? 'display:none' : '' }" >  
	                </div>
	                <div class="col p-4 d-flex flex-column position-static">
	                  <div class="row justify-content-between mb-2">
	                    <div class="col-auto me-auto text-primary" id="mypage_prdt_id">
	                    	<c:choose>
		                    	<c:when test="${projectDto.prdt_comingday > 0 }">펀딩 예정</c:when>
		                    	<c:when test="${projectDto.prdt_dday >= 0}">펀딩 중</c:when>
		                    	<c:when test="${projectDto.prdt_comingday < 0 }">펀딩 종료</c:when>
		                    	<c:otherwise>펀딩상태</c:otherwise>
		                    </c:choose> | 펀딩번호 ${projectDto.prdt_id}</div> 
	                    <div class="col-auto">
	                      <!-- on off btn -->
	                     <div class="col-auto justify-content-end">
	                       <i class="fa-regular fa-bell fas active alretBtn text-info fs-6" onclick="alretBtn()">알림 ON</i>
	                    </div>
	                    </div>
	                  </div>
	                  <a class="mb-0" href="<c:url value="/project/${projectDto.prdt_id }"/>"><h4>${projectDto.prdt_name}</h4></a>
	                  <p class="mb-1 text-danger">현재 달성률 ${projectDto.prdt_percent}% 
	                  <c:choose>
		                  <c:when test="${projectDto.prdt_dday > 0}">종료 D-${projectDto.prdt_dday}</c:when>
		                  <c:when test="${projectDto.prdt_dday < 0}">종료 D+${-projectDto.prdt_dday}</c:when>
		                  <c:otherwise>D-DAY 출력</c:otherwise>
		              </c:choose>
	                  </p>
                  	  <p class="card-text mb-2 text-truncate" style="max-width:1000px">${projectDto.prdt_desc}</p>
	                  <p class="text-muted mb-0">심사완료</p>
	                </div>
	              </form> 
		      </c:forEach>
               	</c:when>
               	<c:otherwise>
	               	<div class="text-center mt-4">
	               		<h5>현재 관심중인 펀딩이 없습니다.</h5>
	               	</div>
               	</c:otherwise>
               </c:choose>	
              <!-- project card end -->		
              
              <!-- 알림신청 버튼 : 알림 확인 모달창 -->
              <!-- <div class="modal fade" id="NotifyRequestModal" tabindex="-1" aria-labelledby="NotifyRequestModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="NotifyRequestModalLabel">알림신청이 완료되었습니다!</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      프로젝트 소식을 이메일로 알려드립니다.
                    </div>
                    <div class="modal-footer">
                      <button type="submit" class="w-100 btn btn-lg btn-light border" data-bs-dismiss="modal">확   인</button>
                    </div>
                  </div>
                </div>
              </div> -->
              <!-- Modal end-->
            </div>
            
            <div class="tab-pane fade" id="v-pills-tab03" role="tabpanel" aria-labelledby="v-pills-tab03-tab">
            		<h5 class="my-4">${user_id}님의 관심펀딩 소식</h5>
	             <!-- project card start-->
	             <c:choose>
	              <c:when test="${fn:length(list_alarm) ne 0 }">
	              	<!-- project card start-->
	              	<table class="table table-borderless mt-4">
						  <thead>
						    <tr style="display:none;">
						      <th scope="col" style="display:none;">#</th>
						      <th width="80px">펀딩썸네일</th>
						      <th width="160px">펀딩명</th>
						      <th scope="col">알림내용</th>
						      <th scope="col">알림확인</th>
						    </tr>
						  </thead>
						  <tbody class="">
						  	<c:forEach var="alarmDto" items="${list_alarm}">
							    <tr id="new_alarm_tr" class="${alarmDto.alarm_cnt eq 0 ? 'table-light' : ''}">
							      <th scope="row" style="display:none;">${alarmDto.prdt_id } <input type="hidden" id="alarm_no" value="${alarmDto.alarm_no }"></th>
							      <td width="80px"><img class="bd-placeholder-img" width="60" height="60" id="alarm_thumbnail" name="alarm_thumbnail" src="${alarmDto.prdt_thumbnail }"></td>
							      <td width="160px" class="text-truncate"><a href="/purplaying/project/${alarmDto.prdt_id }" style="cursor:pointer"><h6>${alarmDto.prdt_name }</h6></a></td>
							      <td class="alarm_message">
<%-- 							      	<c:if test="${alarmDto.prdt_comingday eq 1}">
							      		<c:if test="${alarmDto.alarm_cnt eq 0}"><span class="badge bg-primary">OPEN</span></c:if>
							      		펀딩오픈이 하루 남았습니다.
							      	</c:if>
				                    <c:if test="${alarmDto.prdt_dday eq 1}">
				                    	<c:if test="${alarmDto.alarm_cnt eq 0}"><span class="badge bg-danger">CLOSE</span></c:if>
				                    	펀딩마감이 하루 남았습니다.
				                    </c:if>--%>
				                    <c:choose> 
				                    	<c:when test="${(alarmDto.prdt_comingday eq 1) && (alarmDto.alarm_cnt eq 0)}"><span class="badge bg-primary">OPEN </span>펀딩오픈이 하루 남았습니다.</c:when>
				                    	<c:when test="${(alarmDto.prdt_dday eq 1) && (alarmDto.alarm_cnt eq 0)}"><span class="badge bg-danger">CLOSE </span>펀딩마감이 하루 남았습니다.</c:when>
				                    </c:choose>
							      </td>
							      <td  class="text-end"><button id="alarm_confirm" type="button" onclick="alarm_confirm()">확인</button></td>
							    </tr>
						    </c:forEach>
						  </tbody>
						</table>
               	   </c:when>
	               	<c:otherwise>
		               	<div class="text-center mt-4">
		               		<h5>현재 알림 받고 있는 펀딩이 없습니다.</h5>
		               	</div>
	               	</c:otherwise>
              	 </c:choose>	 	
              
            </div>
          </div>
        </div>
    </div><!-- contentsWrap end -->
  </section>
  <!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
  	<script type="text/javascript">
  	function alretBtn() {
  	   let _buttonI = event.target;

  	   if (_buttonI.classList.contains("far")) {
  		  let prdt_id = $('#mypage_prdt_id').html().split(' ').reverse()[0]
  		 
  		    $.ajax({
  				type : 'post',				//요청 메서드
  				url : '/purplaying/like/addlike',				//요청 URI
  				headers :	{ "content-type" : "application/json"},				//요청 헤더
  				data : JSON.stringify({prdt_id:Number(prdt_id)}),				// 서버로 전송할 데이터. stringify()로 직렬화 필요.
  				success : function(result) {				// 서버로부터 응답이 도착하면 호출될 함수
  			 		 _buttonI.classList.add("fas");
  				   _buttonI.classList.add("active");
  				   _buttonI.classList.remove("far");
  				   _buttonI.innerText="알림 ON";
  				   _buttonI.classList.remove("text-muted");
  				   _buttonI.classList.add("text-info");
  				   	location.reload();
  		     	},
  		    	error : function() { alert("error") }			//에러가 발생했을 때, 호출될 함수
  			})
  	   } 
  	   else {
  		 let prdt_id = $('#mypage_prdt_id').html().split(' ').reverse()[0]
 			console.log(prdt_id)
  	   		$.ajax({
  				type : 'post',				//요청 메서드
  				url : '/purplaying/like/removelike',				//요청 URI
  				headers :	{ "content-type" : "application/json"},				//요청 헤더
  				data : JSON.stringify({prdt_id:Number(prdt_id)}),				// 서버로 전송할 데이터. stringify()로 직렬화 필요.
  				success : function(result) {				// 서버로부터 응답이 도착하면 호출될 함수
  				  	_buttonI.classList.remove("fas");
  					   _buttonI.classList.remove("active");
  					   _buttonI.classList.add("far");
  					   _buttonI.innerText="알림 OFF";
  					   _buttonI.classList.remove("text-info");
  					   _buttonI.classList.add("text-muted");
  			      	location.reload();
  		     	},
  		    	error : function() { alert("error") }			//에러가 발생했을 때, 호출될 함수
  			})
  		   
  	   }
  	}
	$(document).ready(function() {
		//let prdt_id = ${projectDto.prdt_id}
		
		//write
		$("#writeBtn").on("click", function() {
			let form = $("#form");
			form.attr("action", "<c:url value='/notice/write' />")
			form.attr("method", "post")
			
			if(formCheck())
				form.submit()					
		})
	})
	// 알림확인 버튼클릭시 조회수 1 증가
	function alarm_confirm(){
		let alarm_no = $("#alarm_no").val()
		let new_alarm_tr = $("#new_alarm_tr")
		let alarm_message = $(".alarm_message")
		console.log("alarm_no: ",alarm_no)	
		console.log("new_alarm_tr: ",new_alarm_tr)	
		console.log("alarm_message: ",alarm_message)	
		
		$.ajax({
			type:'PATCH',	//통신방식 (get,post)
			url: '/purplaying/alarm/read/'+alarm_no,
			headers:{"content-type" : "application/json"},
			data : JSON.stringify({alarm_no:Number(alarm_no)}),
			dataType : 'text',
			success:function(data){
				console.log("alarm_no: ",alarm_no)
				new_alarm_tr.classList.remove("table-light");
				
			},
			error : function(){
				console.log("alarm_no error");
			}
		})
	}
	</script>
	<script>
  	let msg = "${msg}";
  	if(msg == "no_authorization") alert("접근 권한이 없습니다.");
  	if(msg == "not_equal_error") alert("결제 정보를 다시 확인해주세요.");
  	if(msg == "payment_error") alert("결제 중 오류 발생");
  	if(msg == "invalid_request") alert("펀딩종료일 이후 결제취소가 불가능합니다.");
  	if(msg == "paymentCancel_error") alert("결제 취소 중 오류 발생");
  	if(msg == "payment_cancel") alert("결제가 취소 되었습니다.");
  </script>
</body>
</html>
