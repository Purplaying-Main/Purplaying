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
                 <img class="bd-placeholder-img" width="230" height="100%" id="prdt_thumbnail" name="prdt_thumbnail"
                		src="${projectDto.prdt_thumbnail}" style=" ${projectDto.prdt_thumbnail == null ? 'display:none' : '' }">
              </div>
              <div class="col px-4 d-flex flex-column position-static">
              	<br>
                <div class ="d-flex justify-content-between pt-1 lh-lg">
	                <div class="col-6 mb-2">
	                 <c:choose>
		                <c:when test="${projectDto.prdt_genre eq 1}">문학</c:when>
		                <c:when test="${projectDto.prdt_genre eq 2}">시/에세이</c:when>
		                <c:when test="${projectDto.prdt_genre eq 3}">웹툰</c:when>
		                <c:otherwise>장르</c:otherwise>
	                </c:choose>
	                <span class="ms-2" id="dt_creator">${projectDto.writer}</span>
	                </div> 
                  <div>예약번호 : ${paymentDto.pay_no }</div>
                </div>
                <h4 class="fw-bold lh-lg">${projectDto.prdt_name}</h4>
                <br>
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
                    <p class="form-label">${rewardDto.row_number}. ${rewardDto.reward_name}</p>
                  </div>
                  <div class="d-flex justify-content-between mx-1">
                    <p class="form-label fw-bold">리워드 구성품</p>
                    <p class="form-label"><span id="dt_rewardItem">${rewardDto.reward_desc }</span></p>
                  </div> 
                  <div class="d-flex justify-content-between mx-1">
                    <p class="form-label fw-bold">리워드 가격</p>
                    <p class="form-label"><span id="dt_price"><fmt:formatNumber type="number" maxFractionDigits="3" value="${rewardDto.reward_price }"/></span>원</p>
                  </div>
                </div>
              </div>
            </div>
            
            <!-- 후원자 정보-->
            <div class="col-6">
              <div class="card">
                <h5 class="card-header">후원자 정보</h5>
                <div class="card-body" style="line-height: 3.47;">
                    <p class="form-label"><span class="fw-bold">연락처</span><span class="ms-1" id="dt_phoneNM">${userDto.user_phone}</span></p>
                    <p class="form-label"><span class="fw-bold">이메일</span><span class="ms-1" id="dt_email">${userDto.user_id}</span></p>
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
                    <p class="form-label" id="dt_recieverName">${paymentDto.delivery_reciever }</p>
                  </div>
                  <div class="d-flex justify-content-between">
                    <p class="form-label fw-bold">연락처</p>
                    <p class="form-label" id="dt_phoneNumber">${paymentDto.delivery_phone }</p>
                  </div>
                  <div class="d-flex justify-content-between">
                    <p class="form-label fw-bold">주소</p>
                    <p class="form-label" id="dt_address">[${paymentDto.delivery_postcode }]${paymentDto.delivery_address } ${paymentDto.delivery_addressdetail}</p>
                  </div>
                  <div class="d-flex justify-content-between">
                    <p class="form-label fw-bold">배송요청사항</p>
                    <p class="form-label" id="dt_deliveryMemo">${paymentDto.delivery_memo }</p>
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
                    <p class="form-label fw-bold">후원 금액</p>
                    <p class="form-label"><span id="dt_fundingPrice">${paymentDto.pay_total }</span>원</p>
                  </div>
                  <div class="d-flex justify-content-between">
                      <p class="form-label fw-bold">배송비</p>
                      <p class="form-label"><span><fmt:formatNumber type="number" maxFractionDigits="3" value="${paymentDto.delivery_charge}"/></span>원</p>
                  </div>
                  <div class="d-flex justify-content-between">
                    <p class="form-label fw-bold">결제 금액</p>
                    <p class="form-label"><span id="dt_totalPrice">${paymentDto.pay_total }</span>원</p>
                  </div>
                  <div class="d-flex justify-content-between">
                    <p class="form-label fw-bold">결제 예정일</p>
                    <p class="form-label"><fmt:formatDate pattern ="yyyy.MM.dd" value="${projectDto.prdt_purchaseday}"/></p>
                  </div>
                </div>
              </div>
            </div>
            </div>
           

          </div><!--사분할 종료-->

        </div><!--중간 영역 끝-->

        <!--하단 영역-->
        <div class="d-flex justify-content-end mb-2">
          <a class="btn btn-primary" href="${pageContext.request.contextPath}/mypage">펀딩내역확인</a>
          <a class="btn btn-secondary ms-2" href="${pageContext.request.contextPath}/">메인으로</a>
        </div>

      </div><!--컨텐츠 영역-->
    </div><!-- contentsWrap end -->
  </section>


  <!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
</body>
</html>