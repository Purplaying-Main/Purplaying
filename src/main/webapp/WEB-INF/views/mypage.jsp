<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          
            <!-- 펀딩현황 tab -->
            <div class="tab-pane fade show active" id="v-pills-tab01" role="tabpanel" aria-labelledby="v-pills-tab01-tab">
              
              <!-- project card start -->
              <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                <div class="col-auto d-none d-lg-block">
                  <svg class="bd-placeholder-img" width="230" height="100%" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                </div>
                <div class="col p-4 d-flex flex-column position-static">
                  <div class="row justify-content-between mb-2">
                    <p class="col-auto me-auto text-primary">펀딩중 | 펀딩번호 00XXAA11</p> 
                    <div class="col-auto">
                      <!-- on off btn -->
                      <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked>
                        <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                      </div>
                    </div>
                  </div>
                  <h4 class="mb-0">1999년 감성으로 찾아온 '세기말 풋사과 보습학원'</h4>
                  <div class="mb-1 text-danger">현재 달성률 00%</div>
                  <p class="card-text mb-2">This is a wider card with supporting text below as a natural lead-in to additional content.</p>
                  <p class="text-muted mb-0">심사완료</a>
                </div>
              </div>
              <!-- project card end -->
              <button type="button" class="w-100 btn btn-lg btn-outline-primary" onclick="location.href='projectregister'">신규프로젝트 신청하기</button>
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
                    <p class="col-auto me-auto text-primary">펀딩예정 | 펀딩번호 00XXAA11</p> 
                    <div class="col-auto justify-content-end">
                      <button class="btn btn-outline-info" type="button" data-bs-toggle="modal" data-bs-target="#NotifyRequestModal">프로젝트 소식 알림신청</button>
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
                      <button class="btn btn-outline-info" type="button" data-bs-toggle="modal" data-bs-target="#NotifyRequestModal">프로젝트 소식 알림신청</button>
                    </div>
                  </div>
                  <h4 class="mb-0">1999년 감성으로 찾아온 '세기말 풋사과 보습학원'</h4>
                  <div class="mb-1 text-danger">현재 달성률 00%</div>
                  <p class="card-text mb-2">This is a wider card with supporting text below as a natural lead-in to additional content.</p>
                </div>
              </div>
              <!-- project card end -->
              
              <!-- 알림신청 버튼 : 알림 확인 모달창 -->
              <div class="modal fade" id="NotifyRequestModal" tabindex="-1" aria-labelledby="NotifyRequestModalLabel" aria-hidden="true">
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
              </div>
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
                      <button class="btn btn-outline-info" type="button" data-bs-toggle="modal">프로젝트 내용이 추가되었습니다.</button>
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
                      <button class="btn btn-outline-info" type="button">펀딩이 시작되었습니다.</button>
                    </div>
                  </div>
                  <h4 class="mb-0">1999년 감성으로 찾아온 '세기말 풋사과 보습학원'</h4>
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
</body>
</html>