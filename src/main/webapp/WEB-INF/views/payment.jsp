<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
 <!-- meta태그, CSS, JS, 타이틀 인클루드  -->
 <%@ include file ="meta.jsp" %>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
 
</head>
<body>
    <!--헤더 인클루드-->
   <%@ include file ="header.jsp" %>
  
	<!--메인 컨테이너 -->
  <section>
    <h1 class="visually-hidden">HOME</h1>
    <div class="contentsWrap">
      <!--컨텐츠 영역-->
      <div class="row col-md-8 d-block mx-auto">
        <h3 class="text-center py-2 mb-2">펀딩 프로젝트 후원하기</h3>
  
        <%-- <input type="text" id="user_id" value="${sessionScope.UserDto.user_id }"/>
        <input type="text" id="user_name" value="${sessionScope.UserDto.user_name}"/>
        <input type="text" id="user_phone" value="${sessionScope.UserDto.user_phone}"/>
		<input type="text" id="amount" value="${param.rewardTotalPrice}"/>
		<input type="text" id="prdt_nm" value="${projectDto.prdt_name}"/> --%>
        <!-- 프로젝트명 -->
        <div class="mb-4">
          <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
            <div class="col-auto d-none d-lg-block">
              <img class="bd-placeholder-img" width="230" height="100%" id="prdt_thumbnail" name="prdt_thumbnail"
                		src="${projectDto.prdt_thumbnail}" style=" ${projectDto.prdt_thumbnail == null ? 'display:none' : '' }">
            </div>
            <div class="col p-4 d-flex flex-column position-static">
              <div class="row mb-2">
                <p class="col-6 mb-2">
                <c:choose>
                <c:when test="${projectDto.prdt_genre eq 1}">문학</c:when>
                <c:when test="${projectDto.prdt_genre eq 2}">시/에세이</c:when>
                <c:when test="${projectDto.prdt_genre eq 3}">웹툰</c:when>
                <c:otherwise>장르</c:otherwise>
                </c:choose>
                <span> | </span>
                <span class="ms-2" id="dt_creator">${projectDto.writer}</span></p> 
                <h4 class="fw-bold mb-2">${projectDto.prdt_name}</h4>
                <p>
                <span class="text-danger" id="dt_fundingMoney"><fmt:formatNumber type="number" maxFractionDigits="3" value="${projectDto.prdt_currenttotal }"/>원</span>
                <span class="text-danger mx-2" id="dt_fundingRatio">현재 달성률 ${projectDto.prdt_percent}%</span>
                <span class="text-danger" id="dt_dDay">종료 D-${projectDto.prdt_dday}</span>
              	</p>
              </div>
            </div>
          </div>
        </div>

        <!-- 리워드 정보 -->
        <form class="paymentForm" id="paymentform" action="" method="">
        	<input type="hidden" id="pay_total" name="pay_total" value="">
        	<input type="hidden" id="reward_id" name="rewardid" value="">
        	<input type="hidden" id="reward_cnt" name="rewardcnt" value="">
        <div class="mb-4">
          <h5>리워드 정보</h5>
          <hr>
          	<div id="rewardCnt">
          <c:forEach var="reward" items="${reward }" varStatus="status">
          	<div>
          	   <div class="d-flex justify-content-between mx-1" id="rewardInfo${status.count }">
          	   <div class="form-label  fw-bold">
              	<c:choose>
              		<c:when test="${status.count%4 eq 1 }">No.</c:when>
              		<c:when test="${status.count%4 eq 2 }">패키지</c:when>
              		<c:when test="${status.count%4 eq 3 }">수량</c:when>
					<c:when test="${status.count%4 eq 0}">가격<hr>
					</c:when>              		
              	</c:choose>
          	   </div>
              <div class="form-label">
              		<c:choose>
              			<c:when test="${status.count%4 eq 0}">
              			<c:set var="price" value="${fn:split(reward,'원-')[0] }"/>
              			<fmt:parseNumber var="i" integerOnly="true"  type="number" value="${price}" />
              			<fmt:formatNumber type="number" maxFractionDigits="3" value="${i }"/>원
              			</c:when>
              			<c:otherwise>${reward }</c:otherwise>
              		</c:choose>
              </div> 
              </div>
          	</div>
            </c:forEach>
            <div class="d-flex justify-content-between mx-1 my-1">
            <p class="form-label fw-bold">후원 금액</p>
            <p class="form-label"><span id="dt_fundingPrice"><fmt:formatNumber type="number" maxFractionDigits="3" value="${param.rewardTotalPrice}"/></span>원</p>
          </div>
 			</div>
        </div>

        <!-- 후원자 정보 -->
        <div class="mb-4">
          <h5>후원자 정보</h5>
          <hr>
          <div class="d-flex justify-content-between mx-1">
              <div>
                <p class="form-label fw-bold">연락처</p>
                <p class="form-label" id="dt_phoneNM">${userDto.user_phone}</p>
                <br>
                <p class="form-label fw-bold">이메일</p>
                <p class="form-label" id="dt_email">${userDto.user_id}</p>
              </div>
              <div class=" py-3 my-4">
                <p class="text-left px-3 py-2">등록된 회원 정보로
                  프로젝트에 대한 알림 및 소식이 전달됩니다.</p>
              </div>
          </div>
        </div>

		
        <!-- 배송 정보 -->
        <div class="mb-4">
          <h5>배송정보</h5>
          <hr>
          <div class="d-flex justify-content-between mx-1 mb-1">
          	<p class="form-label fw-bold">배송지</p>
            <div class="d-flex">
          	<input type="button" class="form-label btn btn-primary btn-sm ms-1" data-bs-toggle="modal" data-bs-target="#deliveryModal" value="배송지목록">
                  <!-- Modal -->
                  <div class="modal fade" id="deliveryModal" tabindex="-1" aria-labelledby="deliveryModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="deliveryModalLabel">등록된 배송지</h5>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                     <div class="modal-body py-1">
	                   <!-- card start -->
                		<div class="card">
                  			<div class="d-flex justify-content-between card-title px-3 pt-1">
                    			<span class="text-primary pt-1">기본 배송지</span>
                      			<input type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#addressModiModal" value="선택">
                  	 		</div>
                  			<div class="card-body px-3 pt-1">
                    			<span class="card-text">수령인 : 한승훈</span><br>
                    			<span class="card-text">[06541] 서울특별시 서초구 강남대로 479 3층 </span><br>
                    			<span class="card-text">010-2023-0111</span>
                  			</div>
                		</div>
              			<!-- card end -->
	                   <!-- card start -->
                		<div class="card mt-1">
                  			<div class="d-flex justify-content-between card-title px-3 pt-1">
                    			<span class="text-primary pt-1">배송지2</span>
                      			<input type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#addressModiModal" value="선택">
                  	 		</div>
                  			<div class="card-body px-3 pt-1">
                    			<span class="card-text">수령인 : 이규황</span><br>
                    			<span class="card-text">[06541] 서울특별시 서초구 강남대로 479 3층 </span><br>
                    			<span class="card-text">010-2022-1104</span>
                  			</div>
                		</div>
              			<!-- card end -->              			
                       </div>
                       <div class="modal-footer">
                          <button type="button" class="btn-sm" data-bs-dismiss="modal">닫기</button>
                       </div>
                      </div>
                    </div>
                </div> <!-- Modal end-->
            <input type="checkbox" class="form-check-input ms-2" id="dt_sameChk" onclick="same()">
            <label class="form-check-label-sm ms-2" for="dt_sameChk">후원자 정보와 동일</label>
          	</div>
          </div>
          <div class="d-flex justify-content-between mx-1 mb-1">
            <p class="form-label fw-bold">수령인</p>
            <div class="col-2"><input type="text" class="form-control form-control-sm" id="dt_recieverName" name="delivery_reciever"  value="${paymentDto.delivery_reciever }" maxlength="7" required></div>
          </div>
          <div class="d-flex justify-content-between mx-1 mb-1">
            <p class="form-label fw-bold">연락처</p>
            <div class="col-2"><input type="text" class="form-control form-control-sm" id="dt_phoneNumber" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" name="delivery_phone"  value="${paymentDto.delivery_phone }"  maxlength="12" required></div>
          </div>
          <div class="mb-2">
            <div class="d-flex justify-content-between mx-1 mb-1">
              <p class="form-label fw-bold">주소</p>
            <!--JavaScript -->
              <div class="d-flex justify-content-end">
                <div class="col-4"><input type="text" class="form-control form-control-sm ps-1" id="address_num" name="delivery_postcode" placeholder="우편번호" value="${paymentDto.delivery_postcode }" readonly></div>
                <input type="button" class="btn btn-primary btn-sm ms-1" id="addressFindBtn" onclick="execDaumPostcode()" value="주소 찾기">
              </div>
            </div>
            <div class="d-flex justify-content-end mx-1 mb-1">
                <div class="col-2"><input type="text" class="form-control form-control-sm col-2 ps-1" id="address" name="delivery_address" value="${paymentDto.delivery_address }" placeholder="기본주소" required readonly></div>
                <div class="col-3 ps-1"><input type="text" class="form-control form-control-sm" id="address_detail" name="delivery_addressdetail" value="${paymentDto.delivery_addressdetail}" placeholder="상세주소" maxlength="50"></div>
            </div>
          </div>
          <!--JavaScript 종료 --> 
          <div class="d-flex justify-content-between mx-1">
            <p class="form-label fw-bold">배송 요청사항</p>
            <div class="col-7 text-end"><input type="text" class="form-control form-control-sm" id="dt_deliveryMemo" name="delivery_memo" value="${paymentDto.delivery_memo }" placeholder="배송시 요청 사항을 작성하세요." maxlength="50"></div>
          </div>
        </div>

        <!-- 포인트 및 쿠폰 
        <div class="mb-3">
          <h5>포인트 및 쿠폰</h5>
          <hr>
            <div class="d-flex justify-content-between mx-1">
                <p class="form-label fw-bold">쿠폰 선택</p>
                <div>
                  <select class="form-select-sm">
                    <option selected>선택 가능한 쿠폰</option>
                    <option id="dt_coupon">축! 신규 가입 쿠폰 -1,000원</option>
                    <option id="dt_coupon">5만원 이상 후원시 -1,500원</option>
                  </select>
                </div>
            </div>
            <div>
              <div class="d-flex justify-content-between mx-1">
                <p class="form-label fw-bold">포인트 사용</p>
                <p class="form-label text-end">
                  보유포인트 <span id="dt_point"><strong>0 </strong></span>P<br>
                </p>
            </div>
            <div class="d-flex justify-content-end mx-1">
                  <div class="col-2"><input type="text" class="form-control form-control-sm text-end" id="dt_usePoint" maxlength="7"></div>
                  <button class="btn btn-primary btn-sm ms-1 py-1" id="useAllBtn">모두 사용</button>
            </div>
            </div>
          </div>-->

        <!-- 결제수단 선택 -->
        <div class="mb-4">
          <h5>결제수단 선택</h5>
          <hr>
          <div class="d-flex mx-1">
            <div class="col-5">
              <p class="form-label fw-bold">간편 결제</p>
              <!--간편 결제 -->
              <div class="col-auto d-none d-lg-block text-center" data-bs-toggle="modal" data-bs-target="#agree2Modal">
                <svg class="bd-placeholder-img" width="230" height="100%" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                  <title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">간편결제카드추가</text></svg>
              </div>
              <!-- Modal start-->
              <div class="modal fade" id="agree2Modal" tabindex="-1" aria-labelledby="agree2ModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="agree2ModalLabel">간편결제카드추가</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="checked_agree2()">추가</button>
                    </div>
                  </div>
                </div>
              </div> <!-- Modal end-->
            </div>
            <div class="col-7">
              <p class="form-label fw-bold">카드 결제</p>
              <!--카드 결제 내용-->
                <div class="d-flex mb-2">
                  <label class="form-label">카드번호</label>
                  <div class=" d-flex col-8 ms-2">
                    <input type="hidden" id="dt_cardNumber" name="pay_cardnum"  value="${paymentDto.pay_cardnum }">
                    <input type="text" class="form-control form-control-sm" id="dt_cardNumber1" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4" required>
                    <input type="text" class="form-control form-control-sm ms-1" id="dt_cardNumber2"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4" required>
                    <input type="password" class="form-control form-control-sm ms-1" id="dt_cardNumber3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"  maxlength="4" required>
                    <input type="text" class="form-control form-control-sm ms-1" id="dt_cardNumber4" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="4" required>
                  </div>
                </div>
                <div class="d-flex">
                  <div class="d-flex mb-2">  
                    <label class="form-label">유효기간</label>
                    <div class="col-5"><input type="text" class="form-control form-control-sm ms-2" id="dt_validDate" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" name="pay_carddate" value="${paymentDto.pay_carddate }"  maxlength="4" placeholder="MMYY" required></div>
                  </div>
                  <div class="d-flex mb-2">
                    <label class="form-label">카드 비밀번호</label>
                    <div class="col-4"><input type="text" class="form-control form-control-sm ms-2" id="dt_cardPwd" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" name="pay_pwd" value="${paymentDto.pay_pwd }" maxlength="2" placeholder="앞 2자리" required></div>
                  </div>
                </div>
                <div class="d-flex mb-2">
                  <label class="form-label">CVC</label>
                  <div class="col-2"><input type="text" class="form-control form-control-sm ms-2" id="dt_userBirth" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" name="pay_cvc" value="${paymentDto.pay_cvc }" maxlength="3"required></div>
                </div>
            </div>
          </div>
        </div>

        
        <!-- 결제 금액 계산 -->
        <div class="mb-4">
<%--           <hr>
          <div class="d-flex justify-content-between mx-2">
            <p class="form-label fw-bold">후원 금액</p>
            <p class="form-label"><span id="dt_fundingPrice"><fmt:formatNumber type="number" maxFractionDigits="3" value="${rewardDto.reward_price }"/></span>원</p>
          </div>
          <div>   --%>         
<%--           <div class="d-flex justify-content-between mx-2">
              <p class="form-label fw-bold">배송비</p>
              <p class="form-label"><span id="dt_totalDiscount">${paymentDto.delivery_charge}</span></p>
          </div> --%>
            <!--쿠폰 & 포인트 주석처리<div class="d-flex justify-content-between me-1 ms-3">
              <p class="form-label">쿠폰 사용</p>
              <p class="form-label"><span id="dt_usedCoupon">-1,000원 [축! 신규 가입 쿠폰]</span></p>
            </div>
            <div class="d-flex justify-content-between me-1 ms-3">
              <p class="form-label">포인트 사용</p>
              <p class="form-label"><span id="dt_usedCoupon">-1,000원 [1,000포인트 사용]</span></p>
            </div>
          </div> -->
<%--           <div class="d-flex justify-content-between pt-2 mx-2">
            <p class="form-label fw-bold">결제 금액</p>
            <p class="form-label"><span id="dt_totalPrice">${rewardDto.reward_price + paymentDto.delivery_charge}</span>원</p>
          </div> --%>
        </div>
		
		

        <!-- 펀딩 유의 사항 -->
        <div class="my-3"> 
          <h5>펀딩 유의 사항</h5>
          <hr>
          <div class="d-flex justify-content-between py-1 mx-1">
            <p>
            후원은 구매가 아니며, 프로젝트에 대한 자금 지원입니다.<br>
            프로젝트는 계획과 다르게 진행 될 수 있습니다.
            </p>    
            <div>
              <div class="form-check">
                <input type="checkbox" class="form-check-input" id="chk1" name="agree1" required>
                <label class="form-check-label" for="chk1">개인정보 제 3자 제공 동의</label>
                <a data-bs-toggle="modal" data-bs-target="#agree4Modal" href="#">내용보기</a>
                  <!-- Modal -->
                  <div class="modal fade" id="agree4Modal" tabindex="-1" aria-labelledby="agree4ModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="agree4ModalLabel">개인정보 제 3자 제공 동의</h5>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <p class="modal-body">
                          회원의 개인정보는 당사의 개인정보 취급방침에 따라 안전하게 보호됩니다.
                          '회사'는 이용자들의 개인정보를 개인정보 취급방침의 '제 2조 수집하는 개인정보의 항목, 수집방법 및 이용목적'에서 
                          고지한 범위 내에서 사용하며, 이용자의 사전 동의 없이는 동 범위를 초과하여 이용하거나
                          원칙적으로 이용자의 개인정보를 외부에 공개하지 않습니다.
                        </p>
                        <div class="modal-footer">
                          <label for="chk1" class="btn btn-primary" data-bs-dismiss="modal">동의</label>
                        </div>
                      </div>
                    </div>
                </div> <!-- Modal end-->
              </div>
              <div class="form-check">
                <input class="form-check-input" id="chk2" type="checkbox" name="agree2" required>
                <label class="form-check-label" for="chk2">유의 사항 확인</label>
              </div>
            </div>
          </div>
          </form>
          <div class="row justify-content-center">
            <div class="col-8 text-center">
             <p class="fs-5 mt-4 mb-2">펀딩이 성공하면 <span id="dt_payDate"><strong><fmt:formatDate pattern ="yyyy.MM.dd" value="${projectDto.prdt_purchaseday}"/></strong></span> 에 자동으로 결제됩니다.</p>
            <%--  <button type="button" class="btn btn-primary fs-3 w-50 my-3" href="${pageContext.request.contextPath}/paymentCompleted/${prdt_id}">후원하기</button> --%>
             <button type="button" class="btn btn-primary fs-3 w-50 my-3" id="doPaymentBtn">후원하기</button>
            </div>
          </div> 
        </div>

      </div>
    </div><!-- contentsWrap end -->
  </section>
  <!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
  <script src="${pageContext.request.contextPath}/resources/assets/js/addressSearch.js"></script> <!-- 주소찾기 JS -->
  <script>
   	function same(){
  		let user_name = "${userDto.user_name}";
  		document.getElementById("dt_recieverName").value = user_name ;
  		let user_phone = "${userDto.user_phone}";
  		document.getElementById("dt_phoneNumber").value = user_phone ;
   	}
  
  </script>

  <script>
  	$("#doPaymentBtn").on("click",function(){
  		console.log("실행");
  		let dt_cardNumber1 = document.getElementById("dt_cardNumber1").value;
  		let dt_cardNumber2 = document.getElementById("dt_cardNumber2").value;
  		let dt_cardNumber3 = document.getElementById("dt_cardNumber3").value;
  		let dt_cardNumber4 = document.getElementById("dt_cardNumber4").value;
  		let cardNum = dt_cardNumber1+dt_cardNumber2+dt_cardNumber3+dt_cardNumber4
  		document.getElementById("dt_cardNumber").value = cardNum;
  		
  		let rn = [];
  	    let rc = [];

  	    let total = parseInt(document.getElementById("dt_fundingPrice").innerText.replace(',','').split('원',1)); //후원금액
  	  	document.getElementById("pay_total").value = total;
  	    
  	    for(let i = 1; i<=document.getElementById("rewardCnt").childElementCount-4; i+=4){
			let j = 2+i;
  	    	rn[i] = parseInt(document.getElementById("rewardInfo"+i).lastElementChild.innerText); //리워드 번호 가져오고 int로 변환
  	    	rc[i] = parseInt(document.getElementById("rewardInfo"+j).lastElementChild.innerText.replace(',','').split('원',1)); //리워드 수량 가져오고 int로 변환

  	    }
  	    
  	  document.getElementById("reward_id").value = rn;
  	  document.getElementById("reward_cnt").value = rc;
  	    
  	    
  		let form = $(".paymentForm");
  		
		form.attr("action", "<c:url value='/paymentCompleted/${prdt_id}' />")
		form.attr("method", "post")
		
		if(formCheck())
			form.submit()	
  	})  
  	
  	
		formCheck = function() {
		let form = document.getElementById("paymentform")
		
		if(form.delivery_reciever.value=="") {
			alert("수령인을 입력해 주세요.")
			return false
		}
		if(form.delivery_phone.value=="") {
			alert("연락처를 입력해 주세요.")
			return false
		}
		if(form.delivery_reciever.value=="") {
			alert("수령인을 입력해 주세요.")
			return false
		}
		
		if(form.delivery_postcode.value=="") {
			alert("우편번호를 입력해 주세요.")
			return false
		}
		
		if(form.delivery_address.value=="") {
			alert("주소를 입력해 주세요.")
			return false
		}
		
		if(form.pay_cardnum.value =="") {
			alert("카드번호를 확인해 주세요.")
			return false
		}
		
		
		if(form.pay_carddate.value==0) {
			alert("카드 유효기간을 입력해 주세요.")
			return false
		}
		
		
		if(form.pay_cvc.value==0) {
			alert("카드 cvc를 입력해 주세요.")
			return false
		}
		
		if(form.pay_pwd.value==0) {
			alert("카드 비밀번호를 입력해 주세요.")
			return false
		}
		
		if($("#chk1").is(":checked") == false ) {
			alert("개인정보 제 3자 제공에 동의해주세요")
			return false
		}
		
		if($("#chk2").is(":checked") == false ) {
			alert("유의 사항을 확인해주세요")
			return false
		}
		
		console.log("입력 성공");
		return true;
	}
			
  </script>
</body>
</html>