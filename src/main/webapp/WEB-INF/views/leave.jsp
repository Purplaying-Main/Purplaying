<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <h4 class="mb-3">탈퇴하기</h4>

          <!-- 1:1 문의-->
          <form action="<c:url value='/user/leave'/>" method="post" id ="form">
	          <div class="form-signin w-100 m-auto">
	            <p class="lead text-center">
	              서비스 이용에 불편함이 있으신가요?
	            </p>
	            <a href="/purplaying/oneonone" class="w-100 btn btn-outline-primary btn-lg">1:1 문의</a>
	
	            <hr class="my-4">
	
	            <p class="lead text-center">
	              탈퇴 전, 유의사항을 반드시 확인해주세요.
	            </p>
	            <span class="form-control p-4" type="text" placeholder="Default input" readonly>
	              피는 희망의 우리 우리 그러므로 아름답고 것이다. 보는 찬미를 있는 노래하며 피다. 꾸며 무엇을 어디 따뜻한 우리 뿐이다. 가치를 것은 발휘하기 사랑의 그것을 품었기 그림자는 피는 위하여서. 너의 품었기 천지는 그것을 하는 새 피다. 옷을 가지에 되려니와, 봄바람이다. 바이며, 품었기 끓는 무엇을 끓는 천지는 군영과 광야에서 이것이다. 오아이스도 피가 이상의 그들은 무엇을 없으면 목숨이 예수는 청춘의 황금시대다. 같이, 얼마나 생명을 붙잡아 너의 앞이 따뜻한 사막이다.
	              <br/>
	              것은 청춘은 청춘의 이성은 그들에게 따뜻한 인생의 것이다. 때까지 살았으며, 얼음과 위하여 보배를 봄바람이다. 충분히 그들의 인간에 같이 뭇 인류의 꽃 뜨거운지라, 붙잡아 약동하다. 광야에서 소리다.이것은 싶이 곳으로 그들의 품고 군영과 인생을 황금시대다. 쓸쓸한 우리 그들의 오아이스도 힘있다. 행복스럽고 없으면 얼마나 기쁘며, 열락의 피가 못할 새 이상이 사막이다. 긴지라 생명을 있는 더운지라 위하여서, 교향악이다. 아니더면, 돋고, 대중을 그리하였는가? 석가는 주는 이상의 못하다 동산에는 안고, 피고, 충분히 천고에 것이다. 그들의 할지라도 실로 싹이 발휘하기 아니더면, 힘있다.
	            </span>
	            <div class="mt-3 row col-md-8 m-auto py-3">
	              <input type="checkbox" class="btn-check" name="options-outlined" id="danger-outlined" autocomplete="off">
	              <label class="btn btn-outline-danger btn-lg" for="danger-outlined"> 탈퇴 유의사항을 확인했습니다.</label>  
	            </div>
	
	            <hr class="my-4 mt-3">
	
	            <select class="form-select mb-3" aria-label="Default select example" id="leave_category" name="leave_category">
	              <option value="0" selected>탈퇴 사유를 선택해주세요</option>
	              <option value="1">서비스 대상이 아님</option>
	              <option value="2">서비스 이용이 복잡하고 불편함</option>
	              <option value="3">고객 서비스의 불만</option>
	              <option value="4">시스템 장애</option>
	              <option value="5">개인정보 (통신 및 신용정보 등) 노출 우려</option>
	              <option value="6">기타</option>
	            </select>
	
	            <div class="input-group mb-3 ">
	              <span class="input-group-text"  >기타 사유<br/>(선택)</span>
	              <textarea class="form-control" aria-label="With textarea" name="leave_reason"></textarea>
	            </div>
	
	            <hr class="my-4">
	
	            <div class="w-100 btn btn-outline-primary btn-lg" type="submit" data-bs-toggle="modal" data-bs-target="#findAccountModal">본인 인증 하기</div>
	            <!-- 본인인증하기 : 비밀번호 입력 모달창 -->
	            <div class="modal fade" id="findAccountModal" tabindex="-1" aria-labelledby="findAccountModalLabel" aria-hidden="true">
	              <div class="modal-dialog">
	                <div class="modal-content">
	                  <div class="modal-header">
	                    <h5 class="modal-title" id="findAccountModalLabel">탈퇴 본인인증</h5>
	                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                  </div>
	                  <div class="modal-body">
	                    <div class="form-floating py-2">
	                      <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" value="${sessionScope.user_id} "disabled>
	                      <label for="floatingInput" placeholder="Disabled input" aria-label="Disabled input example" readonly>Email address</label>
	                    </div>
	                    <div class="form-floating py-2">
	                      <input type="password" class="form-control" id="floatingPassword" name="user_pwd" placeholder="Password">
	                      <label for="floatingPassword">Password</label>
	                    </div>
	                  </div>
	                  <div class="modal-footer">
	                    <button type="submit" class="w-100 btn btn-lg btn-outline-primary">회원 탈퇴하기</button>
	                    <button type="submit" class="w-100 btn btn-lg btn-outline-secondary" data-bs-dismiss="modal">닫 기</button>
	                  </div>
	                </div>
	              </div>
	            </div> <!-- Modal end-->            
	         </div>
	     </form>
      </div>
    </div>

  </section>
  
  <!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
</body>
</html>