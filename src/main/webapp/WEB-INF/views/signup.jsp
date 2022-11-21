<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.URLDecoder" %>   
<!DOCTYPE html>
<html>
<head>
  <!-- meta태그, CSS, JS, 타이틀 인클루드  -->
  <%@ include file ="meta.jsp" %>
</head>
<body>
  <!--헤더 인클루드-->
  <%@ include file ="header.jsp" %>
  <!-- 전체 동의 체크-->
  <script src="resources/assets/js/selectAll.js"></script>
  <script src="resources/assets/js/loginValidation.js"></script>
  <!--메인 컨테이너 -->
 <section>
 <script type="text/javascript">
	
 </script>
    <h1 class="visually-hidden">HOME</h1>
    <div class="contentsWrap">
      <!--컨텐츠 영역-->
      <div class="row col-md-8 d-block mx-auto">
        <h2 class="mb-3">이메일 간편가입</h2>
        <form class="needs-validation"  > <!--novalidate--><!-- action="<c:url value='/user/signup'/>" method="post" -->
          <div class="row">
            <label for="email" class="form-label">Email</label>
            <div class="input-group mb-2">
                <input type="email" class="form-control" id="email" name="user_id" placeholder="you@example.com" value="" required autofocus>
                <input class="btn btn-outline-secondary" type="button" id="check_id" value="중복체크" required>
                <div class="invalid-feedback">
                  아이디를 입력해주세요
                </div>   
            </div>
            <i class="fa fa-exclamation-circle" id="check_id_msg" style="display:none"></i>
            
          </div>

          <div class="col-12 mt-2" onsubmit="return formCheck(this)">
            <label for="password" class="form-label">비밀번호</label>
            <input type="password" class="form-control mb-2" id="password" name="user_pwd" placeholder="비밀번호 입력" required>
            <input type="password" class="form-control" id="passwordConfirm" name="chk_user_pwd" placeholder="비밀번호 확인" onchange="check_pw()" required><!-- onchange='func_chk_Pwd()' 값바뀌면 script실행--> 
            <div class="invalid-feedback">
              비밀번호를 입력해주세요
            </div>
            <i class="fa fa-exclamation-circle" id="check_pwd_msg" style="display:none"></i>
          </div>

            <div class="col-12 mt-2">
              <label for="username" class="form-label">Username</label>
              <div class="input-group has-validation">
                <span class="input-group-text">@</span>
                <input type="text" class="form-control" id="user_name" name="user_name" placeholder="Username" required>
              <div class="invalid-feedback">
                  이름을 입력해주세요
                </div>
              </div>
               <i class="fa fa-exclamation-circle" id="check_name_msg" style="display:none"></i>
            </div>

            <div class="col-12 mt-2">
              <label for="userphone" class="form-label">연락처</label>
              <div class="input-group mb-3">
                <input type="number" class="form-control" id="user_phone" name="user_phone" placeholder="휴대폰 번호 (-없이 입력)" required>
               	<div class="invalid-feedback">
                  번호를 입력해주세요
                </div>
                <!-- <button class="btn btn-outline-secondary" type="button" id="button-addon2">인증번호 받기</button> -->
              </div>
              <!-- <input type="number" class="form-control" id="userphoneConfirm" placeholder="인증번호 입력 (남은 시간 2분 58초)"> -->
               <i class="fa fa-exclamation-circle" id="check_phone_msg" style="display:none"></i>
            </div>
            
            <hr class="my-4">
			<!-- 전체 동의 -->
            <div class="accordion" id="accordionPanelsStayOpenExample">
              <div class="accordion-item">
                <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                  <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                    <div class="form-check">
                      <input type="checkbox" class="form-check-input" id="agreeAll" name="agree" onclick="selectAll(this)"> 
                      <label class="form-check-label" for="agree-14">전체동의  <i class="fa fa-exclamation-circle" id="check_check_msg" style="display:none"></i></label>
                    </div>
                  </button>
                </h2>
                <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
                  <div class="accordion-body">
                    <div class="row mb-2">
                      <div class="col-8">
                        <input type="checkbox" class="form-check-input" id="agree1" name="agree1" required>
                        <label class="form-check-label" for="agree-1">만 14세 이상입니다. (* 필수)</label>
                         <div class="invalid-feedback">
		                  체크 해주세요
		                </div>
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
                              <label for="agree1" class="btn btn-primary" data-bs-dismiss="modal">동의</label>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    
                    <div class="row mb-2">
                      <div class="col-8">
                        <input type="checkbox" class="form-check-input" id="agree2" name="agree2" required>
                        <label class="form-check-label" for="agree-2">퍼플레잉 이용 약관 동의 (* 필수)</label>
                        <div class="invalid-feedback">
		                  체크 해주세요
		                </div>
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
                              <label for="agree2" class="btn btn-primary" data-bs-dismiss="modal">동의</label>
                            </div>
                          </div>
                        </div>
                      </div> <!-- Modal end-->
                      
                    </div>
                    
                    <div class="row mb-2">
                      <div class="col-8">
                        <input type="checkbox" class="form-check-input" id="agree3" name="agree3" required>
                        <label class="form-check-label" for="agree-3">개인정보 수집 및 이용 동의 (* 필수)</label>
                        <div class="invalid-feedback">
		                  체크 해주세요
		                </div>
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
                              <label for="agree3" class="btn btn-primary" data-bs-dismiss="modal">동의</label>
                            </div>
                          </div>
                        </div>
                      </div> <!-- Modal end-->
                    </div>

                    <div class="row mb-2">
                      <div class="col-8">
                        <input type="checkbox" class="form-check-input" id="agree4" name="agree4"	>
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
                              <label for="agree4" class="btn btn-primary" data-bs-dismiss="modal">동의</label>
                            </div>
                          </div>
                        </div>
                      </div> <!-- Modal end-->
                    </div>

                    <div class="row mb-2">
                      <div class="col-8">
                        <input type="checkbox" class="form-check-input" id="agree5" name="agree5">
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
                              .<br>x
                              .<br>
                              .<br>
                              .<br>
                              .<br>
                              .<br>
                              .<br>
                            </div>
                            <div class="modal-footer">
                              <label for="agree5" class="btn btn-primary" data-bs-dismiss="modal">동의</label>
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
          <input type="button" class="w-100 btn btn-primary btn-lg mt-4" id="signUp" value="회원가입"><!--  -->
          </form>
          <!-- 회원가입 완료 모달창 -->
          <div class="modal fade" id="signUpCompleteModal" tabindex="-1" aria-labelledby="signUpCompleteModalLabel" data-bs-toggle="modal" aria-hidden="true"><!--  모달실행 -->
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="signUpCompleteModalLabel">🎉 회원가입이 완료되었습니다! </h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="modalCloseBtn"></button>
                </div>
                <div class="modal-body">
                  축하합니다! 번역 크라우드 펀딩 사이트,<br>
                  퍼플레잉에서 다양한 작품을 만나보세요.
                </div>
                <div class="modal-footer">
                  <button class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close" onclick="location.href='<c:url value='/user/login'/>'">확인</button>
                </div>
              </div>
            </div>
          </div> <!-- Modal end-->
        

        <hr class="my-4">
        
        <p class="text-center">이미 퍼플레잉 계정이 있나요? <a href="login">로그인</a></p>
        <h5 class="mb-3 text-center">또는 다른 방법으로 회원가입</h5>
       	<!--소셜 로그인 인클루드-->
  		<%@ include file ="socialLogin.jsp" %>

      </div>

    </div>
	<script type="text/javascript">
		function check_pw(){
			var pw = document.getElementById('password').value;
			if(document.getElementById('password').value == document.getElementById('passwordConfirm').value && document.getElementById('password').value != null ){
				$("#check_pwd_msg").show().html(' 비밀번호와 비밀번호확인이 일치합니다').css("color","#9E62FA");
			}
			else{
				$("#check_pwd_msg").show().html(' 비밀번호와 비밀번호확인이 일치하지 않습니다').css("color","red");
			}
		}
		$(document).ready(function(){
		

			$('#check_id').click(function(){
				let val = document.getElementById("email").value;
				let user_id = {user_id: val};
				let user_id_check = {};
				if(val==null || val==""){
					$("#check_id_msg").show().html(' 아이디를 입력해주세요').css("color","red");
				}else{
					alert("the request is sent");
					$.ajax({
						type:'post',	//통신방식 (get,post)
						url: '/purplaying/user/chkuserid',                                                                                
						headers:{"content-type" : "application/json"},
						dataType : 'text',
						data : JSON.stringify(user_id),
						success:function(result){
							user_id_check = JSON.parse(result);
							if(user_id_check.user_id==null || user_id_check.user_id == ""){
								$("#email").val('');
								$("#check_id_msg").show().html('이미 존재하는 아이디입니다').css("color","red");
								/* $("#check_msg").show();
								$("#check_msg") */	
							}else{
								$("#check_id_msg").show().html(' 사용가능한 아이디 입니다').css("color","#9E62FA");
							}
						},
						error : function(){
							alert("error");
						}					
					});
				}
			});
			
			$('#signUp').click(function(){
				let id = document.getElementById("email");
				let pwd = document.getElementById("password");
				let name = document.getElementById("user_name");
				let phone = document.getElementById("user_phone");
				let agree1 = document.getElementById("agree1");
				let agree2 = document.getElementById("agree2");
				let agree3 = document.getElementById("agree3");
			
				if(id.value == null || id.value == ""){
					id.scrollIntoView({block:"center"});
					$("#check_id_msg").show().html('아이디를 입력해주세요').css("color","red");
				}else if(pwd.value == null || pwd.value == ""){
					pwd.scrollIntoView({block:"center"});
					$("#check_pwd_msg").show().html('비밀번호를 입력해주세요').css("color","red");
				}else if(name.value == null || name.value == ""){
					name.scrollIntoView({block:"center"});
					$("#check_name_msg").show().html('이름을 입력해주세요').css("color","red");
				}else if(phone.value == null || phone.value == ""){
					phone.scrollIntoView({block:"center"});
					$("#check_phone_msg").show().html('전화번호를 입력해주세요').css("color","red");
				}else if(!agree1.checked){
					agree1.scrollIntoView({block:"center"});
					$("#check_check_msg").show().html('필수항목을 체크해주세요').css("color","red");
				}else if(!agree2.checked){
					agree2.scrollIntoView({block:"center"});
					$("#check_check_msg").show().html('필수항목을 체크해주세요').css("color","red");
				}else if(!agree3.checked){
					agree3.scrollIntoView({block:"center"});
					$("#check_check_msg").show().html('필수항목을 체크해주세요').css("color","red");
				}else{
					let user_info = {
							user_id : document.getElementById("email").value,
							user_pwd : document.getElementById("password").value,
							user_name : document.getElementById("user_name").value,
							user_phone : document.getElementById("user_phone").value,
							user_name : document.getElementById("user_name").value,
							Agree_age : document.getElementById("agree1").value,
							Agree_terms : document.getElementById("agree2").value,
							Agree_inform : document.getElementById("agree3").value,
							Agree_inform_third : document.getElementById("agree4").value,
							Agree_marketing : document.getElementById("agree5").value
					} 
					
					$.ajax({
						type:'post',	//통신방식 (get,post)
						url: '/purplaying/user/signup',                                                                                
						headers:{"content-type" : "application/json"},
						dataType : 'text',
						data : JSON.stringify(user_info),
						success:function(result){
							$("#signUpCompleteModal").modal("show");
						},
						error : function(){
							alert("error");
						}					
					});
				}
			});
		});
	</script>
	</section>
  <!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
 
</body>
</html>