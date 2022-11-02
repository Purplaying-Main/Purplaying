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
        <h2 class="mb-3">아이디 비밀번호 찾기</h2>

        <div class="row container mb-4">
          <div class="nav nav-tabs nav-justified my-4" id="v-pills-tab" role="tablist">
            <button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab01" type="button" role="tab" aria-controls="v-pills-tab01" aria-selected="true">아이디 찾기</button>
            <button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab02" type="button" role="tab" aria-controls="v-pills-tab02" aria-selected="false">비밀번호 찾기</button>
          </div>
        </div>
        <div class="row container">
          <div class="tab-content" id="v-pills-tabContent">
            <div class="tab-pane fade show active" id="v-pills-tab01" role="tabpanel" aria-labelledby="v-pills-tab01-tab">
              <!-- 아이디 찾기 -->
              <div class="form-signin">
                <p class="text-center">
         		  계정의 가입여부를 확인해드립니다.
                </p>
                <form>
                  <div class="form-floating py-2">
                    <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
                    <label for="floatingInput">Email address</label>
                  </div>
                  <div class="w-100 btn btn-lg btn-primary" type="submit" data-bs-toggle="modal" data-bs-target="#findAccountModal">이메일 확인</div>
                  <!-- 아이디 찾기 : 등록되지 않은 계정 모달창 -->
                  <div class="modal fade" id="xfindAccountModal" tabindex="-1" aria-labelledby="xfindAccountModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="xfindAccountModalLabel">등록되지 않은 계정</h5>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                          <span class="text-danger">xxx@site.com</span>은 퍼플레잉에 등록되어 있지 않은 계정입니다.<br>
                          다른 계정을 입력해주세요.
                        </div>
                        <div class="modal-footer">
                          <a href="/purplaying/login" class="w-100 btn btn-lg btn-primary">회원가입</a>
                          <button type="submit" class="w-100 btn btn-lg btn-light border" data-bs-dismiss="modal">닫    기</button>
                        </div>
                      </div>
                    </div>
                  </div> <!-- Modal end-->
                  <!-- 아이디 찾기 : 등록된 계정 모달창 -->
                  <div class="modal fade" id="findAccountModal" tabindex="-1" aria-labelledby="findAccountModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="findAccountModalLabel">xxx@site.com</h5>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                          퍼플레잉에 가입한 계정입니다.<br>로그인 하시고 퍼플레잉을 이용하세요
                        </div>
                        <div class="modal-footer">
                          <a href="/purplaying/login" class="w-100 btn btn-lg btn-outline-primary">로그인</a>
                          <button type="submit" class="w-100 btn btn-lg btn-outline-secondary" data-bs-dismiss="modal">다시 확인</button>
                        </div>
                      </div>
                    </div>
                  </div> <!-- Modal end-->
                </form>
              </div>
            </div><!-- tab 01 end-->
            <div class="tab-pane fade" id="v-pills-tab02" role="tabpanel" aria-labelledby="v-pills-tab02-tab">
              <!-- 비밀번호 찾기 -->
              <div class="form-signin w-100 m-auto">
                <p class="text-muted text-center">
                  가입하셨던 이메일 계정을 입력하시면<br>
                  비밀번호를 새로 만들 수 있는 링크를 이메일로 발송해드립니다.
                </p>
                <form>
                  <div class="form-floating py-2">
                    <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
                    <label for="floatingInput">Email address</label>
                  </div>
                  <div class="w-100 btn btn-lg btn-primary" type="submit" data-bs-toggle="modal" data-bs-target="#findPasswordModal">인증번호 받기</div>
                  <!-- 비밀번호 찾기 : 이메일 오류 모달창 -->
                  <div class="modal fade" id="findPasswordModal" tabindex="-1" aria-labelledby="findPasswordModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="findPasswordModalLabel">등록되지 않은 계정</h5>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                          <span class="text-danger">xxx@site.com</span>은 퍼플레잉에 등록되어 있지 않은 계정입니다.<br>
                          다른 계정을 입력해주세요.
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close">확인</button>
                        </div>
                      </div>
                    </div>
                  </div> <!-- Modal end-->
                </form>
              </div>
            </div><!-- tab 02 end-->
          </div>
        </div>

        <hr class="my-4">
    
        <p class="text-center">아직 퍼플레잉 계정이 없나요? <a href="signup">회원가입</a></p>
        <h5 class="mb-3 text-center">또는 다른 방법으로 로그인</h5>
		<!--소셜 로그인 인클루드-->
  		<%@ include file ="socialLogin.jsp" %>
      </div>
    </div>
  </section>
  
  <!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
</body>
</html>