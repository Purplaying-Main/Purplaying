<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 카카오 로그인 버튼 노출 영역 -->
<div class="row col-10 mx-auto py-4">
	<div class="col">
		<a id="kakao-login-btn" href="javascript:loginWithKakao()">
			<img src="resources/assets/img/kakao_login.png" alt="카카오 로그인 버튼" style="height:2.8rem;"/>
		</a>
		<p id="token-result"></p>
	</div>
	
	<!-- 네이버 로그인 버튼 노출 영역 -->
	<div class="col text-center" id="naver_id_login">
		<img src="resources/assets/img/naver_login.png" alt="네이버 로그인 버튼" style="height:2.8rem;"/>
	</div>
	          
	<!-- 구글 로그인 버튼 노출 영역 -->
	<div id="buttonDiv" class="col" style="height:3rem;"></div> 
 	 <script src="https://accounts.google.com/gsi/client" async defer></script>
      <script>
        function handleCredentialResponse(response) {
          console.log("Encoded JWT ID token: " + response.credential);
        }
        window.onload = function () {
          google.accounts.id.initialize({
            client_id: "YOUR_GOOGLE_CLIENT_ID",
            callback: handleCredentialResponse
          });
          google.accounts.id.renderButton(
            document.getElementById("buttonDiv"),
            { theme: "outline", height:"4rem" }  // customization attributes
          );
          google.accounts.id.prompt(); // also display the One Tap dialog
        }
    </script>
    
</div>