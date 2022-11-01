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
      <div class="row col-md-8 d-block mx-auto">
        <h4 class="mb-3">이메일 간편가입</h4>
        <form class="needs-validation" novalidate>
          <div class="row">
            <label for="email" class="form-label">Email</label>
            <div class="input-group mb-2">
                <input type="email" class="form-control" id="email" placeholder="you@example.com" required autofocus>
                <button type="submit" class="btn btn-secondary col-md-3">인증하기</button> 
                <div class="invalid-feedback">
                  Please enter a valid email address for shipping updates.
                </div>
            </div>
          </div>

          <div class="col-12 mt-2">
            <label for="password" class="form-label">비밀번호</label>
            <input type="password" class="form-control mb-2" id="password" placeholder="비밀번호 입력" required>
            <input type="password" class="form-control" id="passwordConfirm" placeholder="비밀번호 확인" required>
            <div class="invalid-feedback">
              Please enter your shipping address.
            </div>
          </div>

          <!--  이름 <div class="row">
            <div class="col-sm-6">
              <label for="firstName" class="form-label">First name</label>
              <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
              <div class="invalid-feedback">
                Valid first name is required.
              </div>
            </div>

            <div class="col-sm-6">
              <label for="lastName" class="form-label">Last name</label>
              <input type="text" class="form-control" id="lastName" placeholder="" value="" required>
              <div class="invalid-feedback">
                Valid last name is required.
              </div>
            </div>
          </div> -->

            <div class="col-12 mt-2">
              <label for="username" class="form-label">Username</label>
              <div class="input-group has-validation">
                <span class="input-group-text">@</span>
                <input type="text" class="form-control" id="username" placeholder="Username" required>
              <div class="invalid-feedback">
                  Your username is required.
                </div>
              </div>
            </div>

            <div class="col-12 mt-2">
              <label for="userphone" class="form-label">연락처</label>
              <div class="input-group mb-3">
                <input type="number" class="form-control" id="userphone" placeholder="휴대폰 번호 (-없이 입력)">
                <button class="btn btn-outline-secondary" type="button" id="button-addon2">인증번호 받기</button>
              </div>
              <input type="number" class="form-control" id="userphoneConfirm" placeholder="인증번호 입력 (남은 시간 2분 58초)">
            </div>
            
            <hr class="my-4">
            <!-- 전체 동의 -->
            <div class="accordion" id="accordionPanelsStayOpenExample">
              <div class="accordion-item">
                <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                  <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                    <div class="form-check">
                      <input type="checkbox" class="form-check-input" id="agreeAll" name="agree" onclick="selectAll(this)"> 
                      <label class="form-check-label" for="agree-14">전체동의</label>
                    </div>
                  </button>
                </h2>
                <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
                  <div class="accordion-body">
                    <div class="row mb-2">
                      <div class="col-8">
                        <input type="checkbox" class="form-check-input" id="agree1" name="agree">
                        <label class="form-check-label" for="agree-1">만 14세 이상입니다. (* 필수)</label>
                      </div>
                      <!-- Button trigger modal -->
                      <div class="col-4 text-small text-muted text-end" data-bs-toggle="modal" data-bs-target="#agree1Modal"><a href="#">내용보기</a></div>
                      <!-- Modal -->
                      <div class="modal fade" id="agree1Modal" tabindex="-1" aria-labelledby="agree1ModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="agree1ModalLabel">만 14세 이상 동의</h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                              만 14세 이상입니다.
                              .<br>
                              .<br>
                              .<br>
                              .<br>
                              .<br>
                              .<br>
                              .<br>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="checked_agree1()">동의</button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    
                    <div class="row mb-2">
                      <div class="col-8">
                        <input type="checkbox" class="form-check-input" id="agree2" name="agree">
                        <label class="form-check-label" for="agree-2">퍼플레잉 이용 약관 동의 (* 필수)</label>
                      </div>
                      <!-- Button trigger modal -->
                      <div class="col-4 text-small text-muted text-end" data-bs-toggle="modal" data-bs-target="#agree2Modal"><a href="#">내용보기</a></div>
                      <!-- Modal -->
                      <div class="modal fade" id="agree2Modal" tabindex="-1" aria-labelledby="agree2ModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="agree2ModalLabel">퍼플레잉 이용 약관 동의</h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                              퍼플레잉 이용 약관 동의합니다.
                              .<br>
                              .<br>
                              .<br>
                              .<br>
                              .<br>
                              .<br>
                              .<br>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="checked_agree2()">동의</button>
                            </div>
                          </div>
                        </div>
                      </div> <!-- Modal end-->
                      
                    </div>
                    
                    <div class="row mb-2">
                      <div class="col-8">
                        <input type="checkbox" class="form-check-input" id="agree3" name="agree">
                        <label class="form-check-label" for="agree-3">개인정보 수집 및 이용 동의 (* 필수)</label>
                      </div>
                      <!-- Button trigger modal -->
                      <div class="col-4 text-small text-muted text-end" data-bs-toggle="modal" data-bs-target="#agree3Modal"><a href="#">내용보기</a></div>
                      <!-- Modal -->
                      <div class="modal fade" id="agree3Modal" tabindex="-1" aria-labelledby="agree3ModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="agree3ModalLabel">개인정보 수집 및 이용 동의</h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                              개인정보 수집 및 이용 동의합니다.
                              .<br>
                              .<br>
                              .<br>
                              .<br>
                              .<br>
                              .<br>
                              .<br>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="checked_agree3()">동의</button>
                            </div>
                          </div>
                        </div>
                      </div> <!-- Modal end-->
                    </div>

                    <div class="row mb-2">
                      <div class="col-8">
                        <input type="checkbox" class="form-check-input" id="agree4" name="agree">
                        <label class="form-check-label" for="agree-4">개인정보 제 3자 제공 동의 (선택)</label>
                      </div>
                      <!-- Button trigger modal -->
                      <div class="col-4 text-small text-muted text-end" data-bs-toggle="modal" data-bs-target="#agree4Modal"><a href="#">내용보기</a></div>
                      <!-- Modal -->
                      <div class="modal fade" id="agree4Modal" tabindex="-1" aria-labelledby="agree4ModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="agree4ModalLabel">개인정보 제 3자 제공 동의</h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                              개인정보 제 3자 제공 동의합니다.
                              .<br>
                              .<br>
                              .<br>
                              .<br>
                              .<br>
                              .<br>
                              .<br>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="checked_agree4()">동의</button>
                            </div>
                          </div>
                        </div>
                      </div> <!-- Modal end-->
                    </div>

                    <div class="row mb-2">
                      <div class="col-8">
                        <input type="checkbox" class="form-check-input" id="agree5" name="agree">
                        <label class="form-check-label" for="agree-5">마케팅 정보 수신 동의 (선택)</label>
                      </div>
                      <!-- Button trigger modal -->
                      <div class="col-4 text-small text-muted text-end" data-bs-toggle="modal" data-bs-target="#agree5Modal"><a href="#">내용보기</a></div>
                      <!-- Modal -->
                      <div class="modal fade" id="agree5Modal" tabindex="-1" aria-labelledby="agree5ModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="agree5ModalLabel">마케팅 정보 수신 동의</h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                              마케팅 정보 수신 동의합니다.
                              .<br>
                              .<br>
                              .<br>
                              .<br>
                              .<br>
                              .<br>
                              .<br>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="checked_agree5()">동의</button>
                            </div>
                          </div>
                        </div>
                      </div> <!-- Modal end-->
                    </div>

                  </div>
                </div>
              </div>
            </div>
          <!-- 회원가입 완료 버튼 -->
          <div class="w-100 btn btn-primary btn-lg mt-4" type="submit" data-bs-toggle="modal" data-bs-target="#signUpCompleteModal">회원가입</div>
          <!-- 회원가입 완료 모달창 -->
          <div class="modal fade" id="signUpCompleteModal" tabindex="-1" aria-labelledby="signUpCompleteModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="signUpCompleteModalLabel">🎉 회원가입이 완료되었습니다! </h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  축하합니다! 번역 크라우드 펀딩 사이트,<br>
                  퍼플레잉에서 다양한 작품을 만나보세요.
                </div>
                <div class="modal-footer">
                  <button type="submit" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
                </div>
              </div>
            </div>
          </div> <!-- Modal end-->
        </form>

        <hr class="my-4">
        
        <p class="text-center">이미 퍼플레잉 계정이 있나요? <a href="login">로그인</a></p>
        <h5 class="mb-3 text-center">또는 다른 방법으로 회원가입</h5>
        <div class="row">
            <!-- 카카오 로그인 버튼 노출 영역 -->
            <div class="col-4">
              <a id="kakao-login-btn" href="javascript:loginWithKakao()">
                <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="180" alt="카카오 로그인 버튼" />
              </a>
              <p id="token-result"></p>
            </div>
          <!-- 네이버 로그인 버튼 노출 영역 -->
          <div class="col-4" id="naver_id_login"></div>
          <!-- 구글 로그인 버튼 노출 영역 -->
          <div class="g-signin2" data-onsuccess="onSignIn"></div>
        </div>

      </div>

     



    </div>

  </section>
  <!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
  <!-- 전체 동의 체크 -->
  <script>
    function selectAll(selectAll)  {
      const checkboxes 
          = document.getElementsByName("agree");
      
      checkboxes.forEach((checkbox) => {
        checkbox.checked = selectAll.checked;
      })
    }
    function checked_agree1() {
      $('input[id="agree1"]').prop('checked', true);
    }
    function checked_agree2() {
      $('input[id="agree2"]').prop('checked', true);
    }
    function checked_agree3() {
      $('input[id="agree3"]').prop('checked', true);
    }
    function checked_agree4() {
      $('input[id="agree4"]').prop('checked', true);
    }
    function checked_agree5() {
      $('input[id="agree5"]').prop('checked', true);
    }
  </script>

  <!-- //네이버 로그인 버튼 노출 영역 -->
  <script type="text/javascript">
    var naver_id_login = new naver_id_login("YOUR_CLIENT_ID", "YOUR_CALLBACK_URL");
    var state = naver_id_login.getUniqState();
    naver_id_login.setButton("green", 3, 42);
    naver_id_login.setDomain("YOUR_SERVICE_URL");
    naver_id_login.setState(state);
    naver_id_login.setPopup();
    naver_id_login.init_naver_id_login();
  </script>

  <!-- 카카오 로그인 -->
  <script>
    function loginWithKakao() {
      Kakao.Auth.authorize({
        redirectUri: 'https://developers.kakao.com/tool/demo/oauth',
      });
    }

    function getCookie(name) {
      var parts = document.cookie.split(name + '=');
      if (parts.length === 2) { return parts[1].split(';')[0]; }
    }
  </script>

  <!-- 구글 로그인 -->
  <script>
    function onSuccess(googleUser) {
      console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
    }
    function onFailure(error) {
      console.log(error);
    }
    function renderButton() {
      gapi.signin2.render('my-signin2', {
        'scope': 'profile email',
        'width': 240,
        'height': 50,
        'longtitle': true,
        'theme': 'outline',
        'onsuccess': onSuccess,
        'onfailure': onFailure
      });
    }
  </script>
</body>
</html>