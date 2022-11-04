<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <!-- meta태그, CSS, JS, 타이틀 인클루드  -->
  <%@ include file ="meta.jsp" %>
</head>
<body>
   <%@ include file ="header.jsp" %>
  
  <!--메인 컨테이너 -->
  <section>
    <h1 class="visually-hidden">HOME</h1>
    <div class="contentsWrap">
      <!--컨텐츠 영역-->
      <div class="row col-md-8 d-block mx-auto">
        <h3 class="text-center py-2 mb-2">펀딩 프로젝트 후원하기</h3>

        <!--상단 영역-->
        <div class="mb-2">
          <h5>퍼플레잉<span class="badge bg-primary ms-1">후원완료</span></h5>
          <p class="ms-2">후원해 주셔서 감사합니다.<br>후원 내역은 마이 페이지에서 확인 할 수 있습니다.</p>
        </div>

        <!--중간 영역 시작-->
        <div class="mb-2">

          <div class="mb-2">
            <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
              <div class="col-auto d-none d-lg-block">
                <svg class="bd-placeholder-img" width="230" height="100%" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                  <title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
              </div>
              <div class="col px-4 d-flex flex-column position-static">
                <div class ="text-end pt-1">
                  <p>예약번호 : <span id=dt_reserveNum>1234567</span></p>
                </div>
                <p class="col-6 mb-2"><span id="dt_caterory">카테고리명</span><span class="ms-2" id="dt_creator">창작자명</span></p> 
                <h4 class="fw-bold">1999년 감성으로 찾아온 '세기말 풋사과 보습학원'</h4>
              </div>
            </div>
          </div>
  
          <!--사분할 시작-->
          <div class="row justify-content-center">

            <!--리워드 정보-->
            <div class="d-flex mb-2">
            <div class="col-6">
              <div class="card">
                <h5 class="card-header">리워드 정보</h5>
                <div class="card-body">
                  <div class="row justify-content-between">
                    <p class="form-label fw-bold">리워드 패키지</p>
                    <p class="form-label">[<span id="dt_rewardName">1999년 감성으로 찾아온 '세기말 풋사과 보습학원'</span>]</p>
                  </div>
                  <div class="d-flex justify-content-between mx-1">
                    <p class="form-label fw-bold">리워드 가격</p>
                    <p class="form-label"><span id="dt_price">20,000</span>원</p>
                  </div>
                  <div class="d-flex justify-content-between mx-1">
                    <p class="form-label fw-bold">리워드 구성품</p>
                    <p class="form-label"><span id="dt_rewardItem">구성품1, 구성품2</span></p>
                  </div> 
                </div>
              </div>
            </div>
            
            <!-- 후원자 정보-->
            <div class="col-6">
              <div class="card">
                <h5 class="card-header">후원자 정보</h5>
                <div class="card-body" style="line-height: 3.47;">
                    <p class="form-label"><span class="fw-bold">연락처</span><span class="ms-1" id="dt_phoneNM">010-2023-0111</span></p>
                    <p class="form-label"><span class="fw-bold">이메일</span><span class="ms-1" id="dt_email">purplaying@email.com</span></p>
                </div>
              </div>
            </div>
            </div>
  
            <!--배송 정보-->
            <div class="d-flex">
            <div class="col-6">
              <div class="card">
                <h5 class="card-header">배송 정보</h5>
                <div class="card-body">
                  <div class="d-flex justify-content-between">
                    <p class="form-label fw-bold">수령인</p>
                    <p class="form-label" id="dt_recieverName">한승훈</p>
                  </div>
                  <div class="d-flex justify-content-between">
                    <p class="form-label fw-bold">연락처</p>
                    <p class="form-label" id="dt_phoneNumber">010-2023-0111</p>
                  </div>
                  <div class="d-flex justify-content-between">
                    <p class="form-label fw-bold">주소</p>
                    <p class="form-label" id="dt_address">서울특별시 서초구 강남대로 479 3층</p>
                  </div>
                  <div class="d-flex justify-content-between">
                    <p class="form-label fw-bold">배송요청사항</p>
                    <p class="form-label" id="dt_deliveryMemo">부재 시 연락주세요</p>
                  </div>
                </div>
              </div>
            </div>
  
            <!--결제정보-->
            <div class="col-6">
              <div class="card">
                <h5 class="card-header">결제 정보</h5>
                <div class="card-body">
                  <div class="d-flex justify-content-between">
                    <p class="form-label fw-bold">결제 방법</p>
                    <p class="form-label">간편 결제</p>
                  </div>
                  <div class="d-flex justify-content-between">
                    <p class="form-label fw-bold">후원 금액</p>
                    <p class="form-label"><span id="dt_fundingPrice">20,000</span>원</p>
                  </div>
                  <div class="d-flex justify-content-between">
                      <p class="form-label fw-bold">배송비</p>
                      <p class="form-label"><span>3,000원</span></p>
                  </div>
                  <div class="d-flex justify-content-between">
                    <p class="form-label fw-bold">결제 금액</p>
                    <p class="form-label"><span id="dt_totalPrice">23,000</span>원</p>
                  </div>
                </div>
              </div>
            </div>
            </div>

          </div><!--사분할 종료-->

        </div><!--중간 영역 끝-->

        <!--하단 영역-->
        <div class="d-flex justify-content-end mb-2">
          <a class="btn btn-primary" href="mypage">펀딩내역확인</a>
          <a class="btn btn-secondary ms-2" href="/purplaying/">메인으로</a>
        </div>

      </div><!--컨텐츠 영역-->
    </div><!-- contentsWrap end -->
  </section>


  <!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
</body>
</html>