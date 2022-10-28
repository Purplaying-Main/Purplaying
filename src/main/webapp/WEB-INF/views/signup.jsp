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
       
        <div class="form-signin w-100 m-auto">
          <form>
            <img class="mb-4 text-center" src="assets/img/purplaying_logo_kor.png" alt="" width="200px">
            <h1 class="mb-3 fw-normal text-center">퍼플레잉 로그인</h1>
        
            <div class="form-floating py-2">
              <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
              <label for="floatingInput">Email address</label>
            </div>
            <div class="form-floating py-2">
              <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
              <label for="floatingPassword">Password</label>
            </div>
        
            <div class="checkbox mb-3">
              <label>
                <input type="checkbox" value="remember-me"> 다음에도 내 정보 기억하기
              </label>
            </div>
            <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
            <p class="mt-5 mb-3 text-muted">&copy; 2017–2022</p>
          </form>
        </div>

        <hr class="my-4">
        
        <p class="text-center">아직 퍼플레잉 계정이 없나요? <a href="signUp.html">회원가입</a></p>
        <h5 class="mb-3 text-center">또는 다른 방법으로 로그인</h5>
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
          <div class="col-4 g-signin2" data-onsuccess="onSignIn"></div>
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