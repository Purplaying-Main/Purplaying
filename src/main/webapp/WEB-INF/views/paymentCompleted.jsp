<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
        <h3 class="text-center py-2 mb-2 fw-bold">펀딩 결제 정보</h3>

        <!--상단 영역-->
        <div class="mb-2">
          <h5><span class="badge bg-primary ms-1">후원완료</span></h5>
          <p class="ms-2">후원해 주셔서 감사합니다.<br>후원 내역은 마이 페이지에서 확인 할 수 있습니다.</p>
        </div>

        <!-- 프로젝트 정보 -->
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
	                <span> | </span>
	                <span class="ms-2" id="dt_creator">${projectDto.writer}</span>
	                </div> 
                 <div>예약번호 : ${pay_user.get(0).getPay_no() }</div>
                </div>
                <h4 class="fw-bold lh-lg">${projectDto.prdt_name}</h4>
                <br>
              </div>
            </div>
          </div>
  
          <div class="row justify-content-center">
            <!--리워드 정보-->
            <div class="d-flex mb-2">
            <div class="col-12">
              <div class="card">
                <h5 class="card-header">리워드 정보</h5>
                  <div class="card-body">
	        		<table class="table">
		        		<tr class="table-Secondary">
	                  		<th class="col-8" scope="col">리워드 패키지</th>
	                  		<th class="col-2 text-center" scope="col">수량</th>
	                  		<th class="col-2 text-center" scope="col">가격</th>
	                  	</tr>
	                    <c:set var="i" value="0"/>
	                    <c:forEach items="${reward_pay }" begin="0" end="${fn:length(reward_pay)/4-1}">
	                 	<tr>
	                    	<td class="col-8">${reward_pay[i]} - ${reward_pay[i+1]}</td>
	                    	<td class="col-2 text-center" > ${reward_pay[i+2]}개</td>
	                    	<td class="col-2 text-center" ><fmt:formatNumber type="number" maxFractionDigits="3" value="${reward_pay[i+3] }"/>원</td>
	                    </tr>
	                  	<c:set var="i" value="${i+4 }" />
	                  	</c:forEach>
                  </table>
                </div>
              </div>
            </div>
            </div>

            <div class="d-flex">            
            <!-- 결제 정보 -->
            <div class="col-6">
              <div class="card">
                <h5 class="card-header">결제 정보</h5>
                <div class="card-body">
                <div class="d-flex justify-content-between">
                    <p class="form-label fw-bold">이메일</p>
                    <p class="form-label"><span id="dt_email">${userDto.user_id}</span></p>
                </div>
				<div class="d-flex justify-content-between">
                    <p class="form-label fw-bold">연락처</p>
                    <p class="form-label"><span id="dt_phoneNM">${userDto.user_phone}</span></p>
                </div>
                  <div class="d-flex justify-content-between">
                    <p class="form-label fw-bold">후원 금액</p>
                     <p class="form-label"><span id="dt_totalPrice"><fmt:formatNumber type="number" maxFractionDigits="3" value="${pay_user.get(0).getPay_total()}"/></span>원</p>
                  </div>
<%--                   <div class="d-flex justify-content-between">
                    <p class="form-label fw-bold">결제 예정일</p>
                    <p class="form-label"><fmt:formatDate pattern ="yyyy.MM.dd" value="${projectDto.prdt_purchaseday}"/></p>
                  </div> --%>
                </div>
              </div>
            </div>            
            
            <!-- 배송 정보 -->
            <div class="col-6">
              <div class="card">
                <h5 class="card-header">배송 정보</h5>
                <div class="card-body">
                  <div class="d-flex justify-content-between">
                    <p class="form-label fw-bold">수령인</p>
                    <p class="form-label" id="dt_recieverName">${pay_user.get(0).getDelivery_reciever() }</p>
                  </div>
                  <div class="d-flex justify-content-between">
                    <p class="form-label fw-bold">연락처</p>
                    <p class="form-label" id="dt_phoneNumber">${pay_user.get(0).getDelivery_phone() }</p>
                  </div>
                  <div class="d-flex justify-content-between">
                    <p class="form-label fw-bold">주소</p>
                    <p class="form-label" id="dt_address">[${pay_user.get(0).getDelivery_postcode() }]${pay_user.get(0).getDelivery_address() } ${pay_user.get(0).getDelivery_addressdetail()}</p>
                  </div>
                  <div class="d-flex justify-content-between">
                    <p class="form-label fw-bold">배송요청사항</p>
                    <p class="form-label" id="dt_deliveryMemo">${pay_user.get(0).getDelivery_memo() }</p>
                  </div>
                </div>
              </div>
            </div>
		  </div>

        </div>
        </div><!--중간 영역 끝-->

        <!--하단 영역-->
        <div class="d-flex justify-content-end mb-2">
          <a class="btn btn-primary" href="${pageContext.request.contextPath}/mypage">펀딩내역확인</a>
          <a class="btn btn-secondary ms-2" href="${pageContext.request.contextPath}/">메인으로</a>
        </div>

      </div>
    </div>
  </section>

  <!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
</body>
</html>