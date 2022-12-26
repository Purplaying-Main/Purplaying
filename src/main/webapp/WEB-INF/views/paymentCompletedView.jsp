<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          <div class="d-flex justify-content-between">
          	<div class="ms-2">후원해 주셔서 감사합니다.<br>후원 내역은 마이 페이지에서 확인 할 수 있습니다.</div>
          	<div class="lh-lg mt-2"><button class="btn btn-secondary btn-sm me-1" id="paymentCancelBtn"  data-bs-toggle="modal" data-bs-target="#paymentCancel">펀딩취소</button></div>
          	  <!-- Modal -->
                  <div class="modal fade" id="paymentCancel" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="paymentCancelModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title fw-bold" id="paymentCancelModalLabel">펀딩 취소 하기</h5>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                          <input type="hidden" id="cancelDay">
                          <table class="table text-center">
                            <tr>
                          	<th>취소 기간</th>
                          	<td>환불 금액</td>
                          	</tr>
                          	<tr>
                          	<th>결제 예정 3일 전</th>
                          	<td>취소 불가</td>
                          	</tr>
							<tr>
                          	<th>결제 예정 7일 전</th>
                          	<td>결제 금액의 80% </td>
                          	</tr>
                          	<tr>
                          	<th>결제 예정 15일 전</th>
                          	<td>결제 금액의 90%</td>
                          	</tr>
                          	 <tr>
                          	<th>결제 예정 15일 이상</th>
                          	<td>결제 금액 전액 환불</td>
                          	</tr>
                          </table> 
                        </div>
                        <div class="modal-footer">
                          <div>
                          환불예정금액
							<input type="text" value="${paymentDto.get(0).getPay_total() }" readonly>
						  </div>
                          <button class="btn btn-danger" data-bs-dismiss="modal">취소</button>
                        </div>
                      </div>
                    </div>
                </div> <!-- Modal end-->
          </div>
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
	                <span> | </span>
	                <span class="ms-2" id="dt_creator">${projectDto.writer}</span>
	                </div> 
                  <div>예약번호 : ${paymentDto.get(0).getPay_no() }</div>
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
            
  
            <!--배송 정보-->
            <div class="d-flex">
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
                    <p class="form-label"><span id="dt_totalPrice"><fmt:formatNumber type="number" maxFractionDigits="3" value="${paymentDto.get(0).getPay_total()}"/></span>원</p>
                  </div> 
                  <div class="d-flex justify-content-between">
                    <p class="form-label fw-bold">결제 예정일</p>
                    <p class="form-label" id="purchaseDay"><fmt:formatDate pattern ="yyyy.MM.dd" value="${projectDto.prdt_purchaseday}"/></p>
                  </div>
                </div>
              </div>
            </div>            
            
             <div class="col-6">
              <div class="card">
                <h5 class="card-header">배송 정보</h5>
                <div class="card-body">
                  <div class="d-flex justify-content-between">
                    <p class="form-label fw-bold">수령인</p>
                    <p class="form-label" id="dt_recieverName">${paymentDto.get(0).getDelivery_reciever() }</p>
                  </div>
                  <div class="d-flex justify-content-between">
                    <p class="form-label fw-bold">연락처</p>
                    <p class="form-label" id="dt_phoneNumber">${paymentDto.get(0).getDelivery_phone() }</p>
                  </div>
                  <div class="d-flex justify-content-between">
                    <p class="form-label fw-bold">주소</p>
                    <p class="form-label" id="dt_address">[${paymentDto.get(0).getDelivery_postcode() }]${paymentDto.get(0).getDelivery_address() } ${paymentDto.get(0).getDelivery_addressdetail()}</p>
                  </div>
                  <div class="d-flex justify-content-between">
                    <p class="form-label fw-bold">배송요청사항</p>
                    <p class="form-label" id="dt_deliveryMemo">${paymentDto.get(0).getDelivery_memo() }</p>
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
  
  <script type="text/javascript">
  $(document).ready(function(){
 	let today = new Date();
 	today = new Date(today.getFullYear()+"."+(today.getMonth()+1)+"."+today.getDate());
 	let purchaseDay = new Date($("#purchaseDay").text());
	let diffDay = (purchaseDay - today)/(1000*60*60*24);
 	if(diffDay <= 3){
 		document.getElementById("paymentCancelBtn").disabled = true;
 	}
 	else{
 		document.getElementById("cancelDay").value = diffDay;
 		} 
  });
  </script>
</body>
</html>