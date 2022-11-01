<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <!-- meta태그, CSS, JS, 타이틀 인클루드  -->
  <%@ include file ="meta.jsp" %>
  <!-- 전체 동의 체크 -->
  <script src="resources/assets/js/selectAll.js"></script>
  <!-- 소셜 로그인(카카오, 네이버, 구글) -->
  <script src="resources/assets/js/social.js"></script>
</head>
<body>
  <!--헤더 인클루드-->
   <%@ include file ="header.jsp" %>
   <!--메인 컨테이너 -->
  <section>
    <h1 class="visually-hidden">Sign In</h1>
    <div class="contentsWrap">
      <!--컨텐츠 영역-->
      <div class="row col-md-8 d-block mx-auto">
      
        <div class="form-signin w-100 m-auto">
          <form action="<c:url value='/login/login'/>"  method="POST" onsubmit="return formCheck(this)">
            <img class="mb-4 text-center" src="resources/assets/img/purplaying_logo_kor.png" alt="" width="200px">
            <h1 class="mb-3 fw-normal text-center">퍼플레잉 로그인</h1>
        	<div id="msg">
				<c:if test="${ not empty param.msg }">
					<i class="fa fa-exclamation-circle">${URLDecoder.decode(param.msg) }</i>
				</c:if>
			</div>
            <div class="form-floating py-2">
              <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" name="id" value="${cookie.id.value}" autofocus>
              <label for="floatingInput">Email address</label>
            </div>
            <div class="form-floating py-2">
              <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="pwd">
              <label for="floatingPassword">Password</label>
            </div>
            <div class="form-floating py-2">
              <input type="hidden" name="toURL" value="${param.toURL }" />
            </div>
        
            <div class="checkbox mb-3">
              <label>
                <input type="checkbox" name="rememberId" value="on" ${empty cookie.id.value ? "" : "checked" }/> 다음에도 내 정보 기억하기
              </label>
            </div>
            <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
            <p class="text-center mt-4">아이디/비밀번호를 잊으셨나요?<a href="findaccount">아이디 / 비밀번호 찾기</a></p>
            <p class="mt-5 mb-3 text-muted">&copy; 2022 Purplaying</p>
            
          </form>
        </div>

        <hr class="my-4">
        
        <p class="text-center">아직 퍼플레잉 계정이 없나요? <a href="signup">회원가입</a></p>
        <h5 class="mb-3 text-center">또는 다른 방법으로 로그인</h5>
        <div class="row">
            <!-- 카카오 로그인 버튼 노출 영역 -->
            <div class="col-4">
              <a id="kakao-login-btn" href="javascript:loginWithKakao()">
                <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="180" alt="카카오 로그인 버튼" />
              </a>
              <p id="token-result"></p>
            </div>
          <!-- 구글 로그인 버튼 노출 영역 -->
          <div class="col-4 g-signin2" data-onsuccess="onSignIn"></div>
        </div>

      </div>

    </div>

  </section>
   <!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
</body>
</html>