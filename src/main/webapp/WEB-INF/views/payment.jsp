<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
  <link rel="stylesheet" href="resources/assets/css/dist/bootstrap.min.css"> <!-- 부트스트랩 -->
  <link rel="stylesheet" href="resources/assetss/css/animate.css">   <!-- 애니메이션효과 -->
  <link rel="stylesheet" href="resources/assets/css/main.css" > <!-- main style-->
  <link rel="stylesheet" href="resources/assets/css/headers.css" > <!-- header-->
  <!-- JS -->
  <script src="resources/assets/js/bootstrap.bundle.min.js"></script> 
  <script src="http://www.w3schools.com/lib/w3data.js"></script> 
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <!-- 아이콘  -->
  <script src="https://kit.fontawesome.com/7f409b18dd.js" crossorigin="anonymous"></script>

<title>Purplaying</title>
</head>
<body>
	<!--메인 컨테이너 -->
  <section>
    <h1 class="visually-hidden">HOME</h1>
    <div class="contentsWrap">
      <!--컨텐츠 영역-->
      <div class="row col-md-8 d-block mx-auto">
        <h3 class="text-center py-2 mb-2">펀딩 프로젝트 후원하기</h3>

        <!-- 프로젝트명 -->
        <div class="mb-3">
          <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
            <div class="col-auto d-none d-lg-block">
              <svg class="bd-placeholder-img" width="230" height="100%" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                <title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
            </div>
            <div class="col p-4 d-flex flex-column position-static">
              <div class="row mb-2">
                <p class="col-6 mb-2"><span id="dt_caterory">카테고리명</span><span class="ms-2" id="dt_creator">제작자명</span></p> 
                <h4 class="fw-bold mb-2">1999년 감성으로 찾아온 '세기말 풋사과 보습학원'</h4>
                <p>
                <span class="text-danger" id="dt_fundingMoney">1,234,567원</span>
                <span class="text-danger mx-2" id="dt_fundingRatio">현재 달성률 123%</span>
                <span class="text-danger" id="dt_dDay">종료 D-10</span>
              </p>
              </div>
            </div>
          </div>
        </div>

        <!-- 리워드 정보 -->
        <div class="mb-3">
          <h5>리워드 정보</h5>
          <hr>
            <div class="d-flex justify-content-between mx-1">
              <p class="form-label fw-bold">리워드 패키지</p>
              <p class="form-label">[<span id="dt_rewardName">1999년 감성으로 찾아온 '세기말 풋사과 보습학원'</span>]</p>
            </div>
            <div class="d-flex justify-content-between mx-1">
              <p class="form-label fw-bold">리워드 가격</p>
              <p class="form-label"><span id="dt_price">20,000</span>원</p>
            </div>
            <div class="d-flex justify-content-between mx-1">
              <p class="form-label fw-bold">리워드 구성품</p>
              <p class="form-label" id="dt_rewardItem">구성품1, 구성품2</p>
            </div>
        </div>

        <!-- 후원자 정보 -->
        <div class="mb-3">
          <h5>후원자 정보</h5>
          <hr>
          <div class="d-flex justify-content-between mx-1">
              <div>
                <p class="form-label fw-bold">연락처</p>
                <p class="form-label" id="dt_phoneNM">010-2023-0111</p>
                <br>
                <p class="form-label fw-bold">이메일</p>
                <p class="form-label" id="dt_email">purplaying@email.com</p>
              </div>
              <div class=" py-3 my-4">
                <p class="text-left px-3 py-2">등록된 회원 정보로
                  프로젝트에 대한 알림 및 소식이 전달됩니다.</p>
              </div>
          </div>
        </div>

        <!-- 배송 정보 -->
        <div class="mb-3">
          <h5>배송정보</h5>
          <hr>
          <div class="form-check d-flex justify-content-end text-end mb-1 pe-2">
            <input type="checkbox" class="form-check-input" id="dt_sameChk">
            <label class="form-check-label ms-2" for="dt_sameChk">후원자 정보와 동일</label>
          </div>
          <div class="d-flex justify-content-between mx-1 mb-1">
            <p class="form-label fw-bold">수령인</p>
            <div class="col-2"><input type="text" class="form-control form-control-sm" id="dt_recieverName" maxlength="7" required></div>
          </div>
          <div class="d-flex justify-content-between mx-1 mb-1">
            <p class="form-label fw-bold">연락처</p>
            <div class="col-2"><input type="text" class="form-control form-control-sm" id="dt_phoneNumber" maxlength="12" required></div>
          </div>
          <div class="mb-2">
            <div class="d-flex justify-content-between mx-1 mb-1">
              <p class="form-label fw-bold">주소</p>
            <!--JavaScript -->
              <div class="d-flex justify-content-end">
                <div class="col-4"><input type="text" class="form-control form-control-sm ps-1" id="dt_postcode" placeholder="우편번호" readonly></div>
                <input type="button" class="btn btn-primary btn-sm ms-1" id="addressFindBtn" onclick="execDaumPostcode()" value="주소 찾기">
              </div>
            </div>
            <div class="d-flex justify-content-end mx-1 mb-1">
                <div class="col-2"><input type="text" class="form-control form-control-sm col-2 ps-1" id="dt_address" placeholder="기본주소" required></div>
                <div class="col-3 ps-1"><input type="text" class="form-control form-control-sm" id="dt_detailAddress" placeholder="상세주소" maxlength="50"></div>
            </div>
          </div>
          <!--JavaScript 종료 --> 
          <div class="d-flex justify-content-between mx-1">
            <p class="form-label fw-bold">배송 요청사항</p>
            <div class="col-7 text-end"><input type="text" class="form-control form-control-sm" id="dt_deliveryMemo" placeholder="배송시 요청 사항을 작성하세요." maxlength="50"></div>
          </div>
        </div>

        <!-- 포인트 및 쿠폰 -->
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
          </div>

        <!-- 결제수단 선택 -->
        <div class="mb-3">
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
                    <input type="text" class="form-control form-control-sm" id="dt_cardNumber1" maxlength="4" required>
                    <input type="text" class="form-control form-control-sm ms-1" id="dt_cardNumber2" maxlength="4" required>
                    <input type="password" class="form-control form-control-sm ms-1" id="dt_cardNumber3" maxlength="4" required>
                    <input type="text" class="form-control form-control-sm ms-1" id="dt_cardNumber4" maxlength="4" required>
                  </div>
                </div>
                <div class="d-flex">
                  <div class="d-flex mb-2">  
                    <label class="form-label">유효기간</label>
                    <div class="col-5"><input type="text" class="form-control form-control-sm ms-2" id="dt_validDate" maxlength="4" placeholder="MMYY" required></div>
                  </div>
                  <div class="d-flex mb-2">
                    <label class="form-label">카드 비밀번호</label>
                    <div class="col-4"><input type="text" class="form-control form-control-sm ms-2" id="dt_cardPwd" maxlength="2" placeholder="앞 2자리" required></div>
                  </div>
                </div>
                <div class="d-flex mb-2">
                  <label class="form-label">CVC</label>
                  <div class="col-2"><input type="text" class="form-control form-control-sm ms-2" id="dt_userBirth" maxlength="3"required></div>
                </div>
            </div>
          </div>
        </div>

        
        <!-- 결제 금액 계산 -->
        <div class="mb-3">
          <hr>
          <div class="d-flex justify-content-between mx-2">
            <p class="form-label fw-bold">후원 금액</p>
            <p class="form-label"><span id="dt_fundingPrice">20,000</span>원</p>
          </div>
          <div>
          <div class="d-flex justify-content-between mx-2">
              <p class="form-label fw-bold">할인 금액</p>
              <p class="form-label text-danger"><span id="dt_totalDiscount">-2,000원</span></p>
          </div>
            <div class="d-flex justify-content-between me-1 ms-3">
              <p class="form-label">쿠폰 사용</p>
              <p class="form-label"><span id="dt_usedCoupon">-1,000원 [축! 신규 가입 쿠폰]</span></p>
            </div>
            <div class="d-flex justify-content-between me-1 ms-3">
              <p class="form-label">포인트 사용</p>
              <p class="form-label"><span id="dt_usedCoupon">-1,000원 [1,000포인트 사용]</span></p>
            </div>
          </div>
          <div class="d-flex justify-content-between pt-2 mx-2 my-2">
            <p class="form-label fw-bold">결제 금액</p>
            <p class="form-label"><span id="dt_totalPrice">18,000</span>원</p>
          </div>
        </div>

        <!-- 펀딩 유의 사항 -->
        <div class="mb-2"> 
          <h5>펀딩 유의 사항</h5>
          <hr>
          <div class="d-flex justify-content-between py-1 mx-1">
            <p>
            후원은 구매가 아니며, 프로젝트에 대한 자금 지원입니다.<br>
            프로젝트는 계획과 다르게 진행 될 수 있습니다.
            </p>    
            <div>
              <div class="form-check">
                <input type="checkbox" class="form-check-input" id="chk1" name="agree" required>
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
                          <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="checked_agree4()">동의</button>
                        </div>
                      </div>
                    </div>
                </div> <!-- Modal end-->
              </div>
              <div class="form-check">
                <input class="form-check-input" id="chk2" type="checkbox" name="agree" required>
                <label class="form-check-label" for="chk2">유의 사항 확인</label>
              </div>
            </div>
          </div>
          <div class="row justify-content-center">
            <div class="col-8 text-center">
             <p class="fs-5 mt-4 mb-2">펀딩이 성공하면 <span id="dt_payDate"><strong>2023.01.11</strong></span> 에 자동으로 결제됩니다.</p>
             <a class="btn btn-primary fs-3 w-50 my-3" href="paymentCompleted.html">후원하기</a>
            </div>
          </div> 
        </div>

      </div>
    </div><!-- contentsWrap end -->
  </section>

  <script>
    /*----주소 찾기----*/
    function execDaumPostcode() { 
          new daum.Postcode({
              oncomplete: function(data) {
                  var addr = '';
                  var extraAddr = '';
  
                  if (data.userSelectedType === 'R') { 
                      addr = data.roadAddress;
                  } else { 
                      addr = data.jibunAddress;
                  }
  
                  document.getElementById('dt_postcode').value = data.zonecode;
                  document.getElementById("dt_address").value = addr;
                  document.getElementById("dt_detailAddress").focus();
              }
          }).open();
      } //API reference  http://postcode.map.daum.net/guide
  
  </script>
</body>
</html>