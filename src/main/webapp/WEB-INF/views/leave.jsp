<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal" var="principal"/>
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
	            <a href="/purplaying/oneonone/list" class="w-100 btn btn-outline-primary btn-lg">1:1 문의</a>
	
	            <hr class="my-4">
				
	            <p class="lead text-center">
	              탈퇴 전, 유의사항을 반드시 확인해주세요.
	            </p>
	            <span class="form-control p-4" type="text" placeholder="Default input" readonly>
	              ① 회원은 회사에 언제든지 회원 탈퇴를 요청할 수 있으며, 회사는 원칙적으로 이를 즉시 처리합니다. 회사는 회원이 회원탈퇴를 요청한 경우 회사는 회원 본인 여부를 확인할 수 있습니다.<br/>
	              ② 제1항에도 불구하고 회원이 다음 각 사유에 해당될 때에는 회원의 탈퇴신청이 제한될 수 있습니다.<br/>
					- 창작자로서 자신이 진행한 프로젝트의 선물 전달이 끝나지 않은 경우와 같이 회사가 제공하는 서비스를 통해 진행 중인 거래 또는 절차가 있는 경우<br/>
					- 프로젝트에 관련된 분쟁이 진행 중인 경우<br/>
					- 기타 회원이 부담해야 할 의무를 다하지 않은 경우<br/>
				  ③ 회사가 회원 탈퇴 처리하면 관련 법령과 회사의 개인정보처리방침에 따라 회사가 보유하는 정보 이외의 데이터를 모두 폐기합니다. 단, 회원의 게시물은 삭제되지 않을 수 있습니다.	<br/>
				  ④ 제1항의 회원탈퇴 요청을 하면 이용계약 해지의 의사표시를 한 것으로 보며, 회사에 해지의 의사표시가 도달하여 회사가 제1항에 따른 탈퇴 처리를 했을 때에 이용계약의 해지효력이 발생합니다. 
				  해지효력이 발생한 때로부터 회원은 회원의 자격을 상실하며, 회사가 제공하는 모든 서비스를 이용할 수 없게 됩니다.
	            </span>
	            <div class="mt-3 row col-md-8 m-auto py-3">
	              <input type="checkbox" class="btn-check" name="options-outlined" id="danger-outlined" autocomplete="off">
	              <label class="btn btn-outline-danger btn-lg" for="danger-outlined" id="danger-outlined_label" onclick="leaveCheck()"> 탈퇴 유의사항을 확인했습니다.</label>  
	            </div>
	            <div class="text-center" id="leaveCheckAlert" style="display:none;"></div>
	
	            <hr class="my-4 mt-3">
	
	            <select class="form-select mb-3" aria-label="Default select example" id="leave_category" name="leave_category" onchange="leaveSelect()">
	              <option value="0" selected>탈퇴 사유를 선택해주세요</option>
	              <option value="1">서비스 대상이 아님</option>
	              <option value="2">서비스 이용이 복잡하고 불편함</option>
	              <option value="3">고객 서비스의 불만</option>
	              <option value="4">시스템 장애</option>
	              <option value="5">개인정보 (통신 및 신용정보 등) 노출 우려</option>
	              <option value="6">기타</option>
	            </select>
				<div class="text-center" id="leaveCategoryAlert" style="display:none;"></div>
	            <div class="input-group mb-3 " id="leave_reason" style="display:none;">
	              <span class="input-group-text">기타 사유<br/>(선택)</span>
	              <textarea class="form-control" aria-label="With textarea" name="leave_reason" id="leave_reason_text" style="resize:none"></textarea>
	            </div>
	
	            <hr class="my-4">
	
	            <div class="w-100 btn btn-outline-primary btn-lg" type="submit" onclick="leaveModal()" >본인 인증 하기</div>
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
	                      <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com" value="${principal.user_id} "disabled>
	                      <label for="floatingInput" placeholder="Disabled input" aria-label="Disabled input example" readonly>Email address</label>
	                    </div>
	                    <div class="form-floating py-2">
	                      <input type="password" class="form-control" id="floatingPassword" name="user_pwd" placeholder="Password">
	                      <label for="floatingPassword">Password</label>
	                    </div>
	                    <div class="text-center" id="leavePwAlert" style="display:none;"></div>
	                  </div>
	                  <div class="modal-footer">
	                  	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                    <button type="button" class="w-100 btn btn-lg btn-outline-primary" onclick="leaveSubmit()">회원 탈퇴하기</button>
	                    <button type="button" class="w-100 btn btn-lg btn-outline-secondary" data-bs-dismiss="modal">닫 기</button>
	                  </div>
	                </div>
	              </div>
	            </div> <!-- Modal end-->            
	         </div>
	     </form>
      </div>
    </div>
    <script type="text/javascript">
    function leaveCheck(){
    	let leave_check_btn = document.getElementById("danger-outlined");
    	if(leave_check_btn.classList.contains("LEAVECHECK")){
    		$('#danger-outlined').removeClass('LEAVECHECK')
    	}
    	else{
    		$('#danger-outlined').addClass('LEAVECHECK')
    		$('#leaveCheckAlert').hide().html('');
    	}
    }
    function leaveSelect(){
    	if($("#leave_category").val()=='6'){
    		$('#leave_reason').css('display','');
    		$('#leaveCategoryAlert').hide().html('').css("color","red");
    	}else{
    		$('#leave_reason').css('display','none');
    		$('#leaveCategoryAlert').hide().html('').css("color","red");
    	}
    }
    function leaveModal(){
    	let leave_check_btn = document.getElementById("danger-outlined");
    	let leave_check_label = document.getElementById("danger-outlined_label");
    	if(!leave_check_btn.classList.contains("LEAVECHECK")){
    		$('#leaveCheckAlert').show().html('탈퇴 유의사항을 확인해주세요').css("color","red");
    		leave_check_label.scrollIntoView({block:"center"});
    	}
    	else if($("#leave_category").val()=='0'){
    		$('#leaveCategoryAlert').show().html('탈퇴 사유를 선택해주세요').css("color","red");
    		$("#leave_category").focus()
    	}
    	else if($("#leave_category").val()=='6'){
    		if($('#leave_reason_text').val()==null || $('#leave_reason_text').val()=="" ){
    			$('#leaveCategoryAlert').show().html('탈퇴 사유를 입력해주세요').css("color","red");
    			$('#leave_reason').focus();
    		}else{
    			$('#leaveCategoryAlert').hide().html('').css("color","red");
    			$('#findAccountModal').modal({backdrop: 'static', keyboard: false});
    	    	$('#findAccountModal').modal('show')
    		}
    	}
    	else{
    		$('#findAccountModal').modal({backdrop: 'static', keyboard: false});
	    	$('#findAccountModal').modal('show')
    	}
    }
    function leaveSubmit(){
    	if($('#floatingPassword').val()==null || $('#floatingPassword').val()=="" ){
    		$('#leavePwAlert').show().html('비밀번호를 입력해주세요').css("color","red");
    	}
    	$.ajax({
			type:'post',	//통신방식 (get,post)
			url: '/purplaying/user/checkleavepw',       
			data : {user_id:$('#floatingInput').val(),user_pwd:$('#floatingPassword').val()},
		 	beforeSend: function(xhr){
		        xhr.setRequestHeader(header, token);
		    },
			success:function(result){
				if(result == true){
					$('#form').submit()
				}else{
					$('#leavePwAlert').show().html('비밀번호가 다릅니다').css("color","red");
				}
			},
			error : function(){
				alert("error")
			}					
		});
    }
    </script>

  </section>
  
  <!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
</body>
</html>