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
                    <input type="email" class="form-control" id="user_name" name="user_name" placeholder="이름을 입력하세요">
                    <label for="user_number">Name</label>
                  </div>
                  <div class="form-floating py-2">
                    <input type="email" class="form-control" id="user_phone" name="user_phone" placeholder="- 을 제외한 전화번호">
                    <label for="user_phone">Phone Number</label>
                  </div>
                  <input class="w-100 btn btn-lg btn-primary" type="button" id="findAccountBtn" value="이메일 확인"/>
                  <!-- 아이디 찾기 : 등록되지 않은 계정 모달창 -->
                  <div class="modal fade" id="xfindAccountModal" tabindex="-1" aria-labelledby="xfindAccountModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="xfindAccountModalLabel">등록되지 않은 계정</h5>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                          일치하는 계정이 없습니다.<br>
                          회원가입을 진행해주시기 바랍니다.
                        </div>
                        <div class="modal-footer">
                          <a href="/purplaying/user/signup" class="w-100 btn btn-lg btn-primary">회원가입</a>
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
                          <h5 class="modal-title" id="findAccountModalLabel"></h5>
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
            <!-- 비밀번호 찾기 -->
            <div class="tab-pane fade" id="v-pills-tab02" role="tabpanel" aria-labelledby="v-pills-tab02-tab">
              <div class="form-signin w-100 m-auto">
                <p class="text-muted text-center">
                  가입하셨던 이메일 계정을 입력하시면<br>
                  임시 비밀번호를 새로 발급하여 이메일로 발송해드립니다.
                </p>
                <form id="PwdForm">
                  <div class="form-floating py-2">
                    <input type="email" class="form-control" id="floatingUser_id" placeholder="name@example.com">
                    <label for="floatingUser_id">Email address</label>
                  </div>
                  <input class="w-100 btn btn-lg btn-primary" type="button" id="findPwdBtn" value="인증번호 받기"/>
                  <!-- 비밀번호 찾기 : 이메일 오류 모달창 -->
                  <div class="modal fade" id="findPasswordModal" tabindex="-1" aria-labelledby="findPasswordModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="findPasswordModalLabel">임시 비밀번호 전송완료</h5>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                          <span class="text-danger" id="findPwd_UserId">xxx@site.com</span>으로 임시 비밀번호가 전송되었습니다<br>
                          <a id="linkToEmail" target='_blank'>비밀번호 보러가기</a>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-primary" onclick="location.href='/purplaying/user/login?toURL=http://localhost:8080/purplaying/setting'">로그인 하러가기</button>
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
	<script type="text/javascript">
	var header = $("meta[name='_csrf_header']").attr('content');
	var token = $("meta[name='_csrf']").attr('content');
	
		$(document).ready(function(){
			$('#findAccountBtn').click(function(){
				let find_data = {user_name:$('#user_name').val(),user_phone:$('#user_phone').val()} ;
				$.ajax({
					type:'post',	//통신방식 (get,post)
					url: '/purplaying/user/findaccount',                                                                                
					headers:{"content-type" : "application/json"},
					dataType : 'text',
					data : JSON.stringify(find_data),
					beforeSend: function(xhr){
				        xhr.setRequestHeader(header, token);
				    },
					success:function(result){
						//alert(result);
						if(result == null || result == ""){
							$('#xfindAccountModal').modal("show");
						}
						else{
							$('#findAccountModal').modal("show");
							$('#findAccountModalLabel').html(result);
						}
						
					},
					error : function(){
						alert("error");
					}					
				});
			});	
			
			$('#findPwdBtn').click(function(){
				let find_pwd = {user_id:$('#floatingUser_id').val()};
				let domain = $('#floatingUser_id').val().split('@')[1].split('.')[0];
				$.ajax({
					type:'post',	//통신방식 (get,post)
					url: '/purplaying/user/sendMail',                                                                                
					headers:{"content-type" : "application/json"},
					dataType : 'text',
					data : JSON.stringify(find_pwd),
					beforeSend: function(xhr){
				        xhr.setRequestHeader(header, token);
				    },
					success:function(result){
						//alert(result);
						if(domain == "gmail"){
							$('#linkToEmail').attr("href", "http://google.com");
						}else if(domain == "naver"){
							$('#linkToEmail').attr("href", "http://naver.com");
						}else if(domain == "hanmail"){
							$('#linkToEmail').attr("href", "http://daum.net");
						}
						
						$('#findPwd_UserId').html($('#floatingUser_id').val());
						$('#findPasswordModal').modal("show");
						
					},
					error : function(){
						alert("error");
					}					
				});
			});
		});
	
	</script>
  
  <!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
</body>
</html>