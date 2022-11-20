<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="loginId" value="${sessionScope.id}" />

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
        
        
        <div class="col-10 mx-auto">
          <div class="tab-content" id="v-pills-tabContent">
          <h5 class="my-2">${sessionScope.user_id}님이 창작중인 펀딩</h5>
            <!-- 펀딩현황 tab -->
            <div class="tab-pane fade show active" id="v-pills-tab01" role="tabpanel" aria-labelledby="v-pills-tab01-tab">
			  <c:forEach var="projectDto" items="${list}">
	              <c:if test="${projectDto.writer eq sessionScope.user_id}">
              		<!-- project card start -->
              		<a href='<c:url value="/project/modify/${projectDto.prdt_id }"/>'>
		              <form id="form" class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
		                <div class="col-auto d-none d-lg-block">
		                  <svg class="bd-placeholder-img" width="230" height="100%" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
		                </div>
		                <div class="col p-4 d-flex flex-column position-static">
		                  <div class="row justify-content-between mb-2">
		                    <div class="col-auto me-auto text-primary">펀딩중 | 펀딩번호 ${projectDto.prdt_id }</div> 
		                    <div class="col-auto">
		                      <!-- on off btn -->
		                      <div class="form-check form-switch">
		                        <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked>
		                        <label class="form-check-label" for="flexSwitchCheckChecked"></label>
		                      </div>
		                    </div>
		                  </div>
		                  <h4 class="mb-0">${projectDto.prdt_title}</h4>
		                  <p class="mb-1 text-danger">현재 달성률 00% 종료 D-0</p>
		                  <p class="card-text mb-2">${projectDto.prdt_desc}</p>
		                  <p class="text-muted mb-0">심사완료</p>
		                </div>
		              </form> 
		            </a> 
		      	</c:if>
		      </c:forEach>
	          <!-- project card end -->
	          
              <!-- 신규 프로젝트 작성 버튼 -->
              <div class="row">
             	 <button type="button" class="mx-auto col-8 btn btn-lg btn-outline-primary" onclick="location.href='project/write'">신규프로젝트 신청하기</button>
              </div>
              <hr class="mt-4 mb-2">
              
              <h5 class="mt-4 mb-2">${sessionScope.user_id}님이 후원중인 펀딩</h5>
               <!-- project card start -->
              <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                <div class="col-auto d-none d-lg-block">
                  <svg class="bd-placeholder-img" width="230" height="100%" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                </div>
                <div class="col p-4 d-flex flex-column position-static">
                  <div class="row justify-content-between mb-2">
                    <p class="col-auto me-auto text-primary">펀딩중 | 펀딩번호 00XXAA11</p> 
                    <div class="col-auto">
                      <a href="paymentcompleted">결제내역 상세보기</a>
                    </div>
                  </div>
                  <h4 class="mb-0"><a href="projectdetail">1999년 감성으로 찾아온 '세기말 풋사과 보습학원'</a></h4>
                  <div class="mb-1 text-danger">현재 달성률 00% 종료 D-0</div>
                  <p class="card-text mb-2">This is a wider card with supporting text below as a natural lead-in to additional content.</p>
                  
                </div>
              </div>
              <!-- project card end -->
              <div class="my-4"></div>
            </div>
            
            <!-- 관심 tab -->
            <div class="tab-pane fade" id="v-pills-tab02" role="tabpanel" aria-labelledby="v-pills-tab02-tab">
              <!-- project card start-->
              <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-220 position-relative">
                <div class="col-auto d-none d-lg-block">
                  <svg class="bd-placeholder-img" width="230" height="100%" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                </div>
                <div class="col p-4 d-flex flex-column position-static">
                  <div class="row justify-content-between mb-2">
                    <small class="col-auto justify-content-start text-primary">펀딩예정 | 펀딩번호 00XXAA11</small> 
                    <div class="col-auto justify-content-end form-check form-switch">
                       <i class="fa-regular fa-bell far alretBtn text-muted fs-6" onclick="alretBtn()">알림 OFF</i>                   	
					</div>
                  </div>
                  <h4 class="mb-0">1999년 감성으로 찾아온 '세기말 풋사과 보습학원'</h4>
                  <div class="mb-1 text-danger">현재 달성률 00%</div>
                  <p class="card-text mb-2">This is a wider card with supporting text below as a natural lead-in to additional content.</p>
                </div>
              </div>
              <!-- project card end -->
              
              <!-- project card start-->
              <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-220 position-relative">
                <div class="col-auto d-none d-lg-block">
                  <svg class="bd-placeholder-img" width="230" height="100%" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                </div>
                <div class="col p-4 d-flex flex-column position-static">
                  <div class="row justify-content-between mb-2">
                    <p class="col-auto me-auto text-primary">펀딩예정 | 펀딩번호 00XXAA11</p> 
                    <div class="col-auto justify-content-end">
                       <i class="fa-regular fa-bell far alretBtn text-muted fs-6" onclick="alretBtn()">알림 OFF</i>
                    </div>
                  </div>
                  <h4 class="mb-0">1999년 감성으로 찾아온 '세기말 풋사과 보습학원'</h4>
                  <div class="mb-1 text-danger">현재 달성률 00%</div>
                  <p class="card-text mb-2">This is a wider card with supporting text below as a natural lead-in to additional content.</p>
                </div>
              </div>
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
              <!-- project card start-->
              <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-220 position-relative">
                <div class="col-auto d-none d-lg-block">
                  <svg class="bd-placeholder-img" width="230" height="100%" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                </div>
                <div class="col p-4 d-flex flex-column position-static">
                  <div class="row justify-content-between mb-2">
                    <p class="col-auto me-auto text-primary">펀딩예정 | 펀딩번호 00XXAA11</p> 
                    <div class="col-auto justify-content-end">
                      <button class="btn btn-outline-info" type="button" data-bs-toggle="modal" onclick="location.href='/purplaying/projectdetail'">
                      	<span class="badge bg-danger">New</span> 프로젝트 내용 업데이트
                      </button>
                    </div>
                  </div>
                  <h4 class="mb-0"><a href="/purplaying/projectdetail">1999년 감성으로 찾아온 '세기말 풋사과 보습학원'</a></h4>
                  <div class="mb-1 text-danger">현재 달성률 00%</div>
                  <p class="card-text mb-2">This is a wider card with supporting text below as a natural lead-in to additional content.</p>
                </div>
              </div>
              <!-- project card end -->
              
              <!-- project card start-->
              <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-220 position-relative">
                <div class="col-auto d-none d-lg-block">
                  <svg class="bd-placeholder-img" width="230" height="100%" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                </div>
                <div class="col p-4 d-flex flex-column position-static">
                  <div class="row justify-content-between mb-2">
                    <p class="col-auto me-auto text-primary">펀딩예정 | 펀딩번호 00XXAA11</p> 
                    <div class="col-auto justify-content-end">
                      <button class="btn btn-outline-info" type="button" onclick="location.href='/purplaying/projectdetail'">
                      	<span class="badge bg-danger">New</span> 펀딩이 시작되었습니다.
                      </button>
                    </div>
                  </div>
                  <h4 class="mb-0"><a href="/purplaying/projectdetail">1999년 감성으로 찾아온 '세기말 풋사과 보습학원'</a></h4>
                  <div class="mb-1 text-danger">현재 달성률 00%</div>
                  <p class="card-text mb-2">This is a wider card with supporting text below as a natural lead-in to additional content.</p>
                </div>
              </div>
              <!-- project card end -->
            </div>
          </div>
        </div>
    </div><!-- contentsWrap end -->
  </section>
  <!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
  	<script type="text/javascript">
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
	</script>
</body>
</html>