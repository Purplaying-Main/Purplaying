<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="loginId" value="${sessionScope.id }" />
   
<!DOCTYPE html>
<html>
<head>
  <!-- meta태그, CSS, JS, 타이틀 인클루드  -->
  <%@ include file ="meta4.jsp" %>
</head>

<body>
   <!--헤더 인클루드-->
   <%@ include file ="header.jsp" %>
   
   <!--페이지 내용 시작-->
   <section>
     <h1 class="visually-hidden">HOME</h1>
   	 <div class="contentsWrap">
      <!--컨텐츠 영역-->
      <div class="row justify-content-md-center">
        <h2 class="col-auto mb-5">프로젝트 기획 시작하기</h2>
      </div>
      <div class="tab-content px-5 row justify-content-center" id="v-pills-tabContent"><!-- 탭 컨텐츠 start -->
          <form class="row col-8 mb-4 text-center" id="form" action="" method="">   
             <input type="hidden" name="prdt_id" value="${projectDto.prdt_id }"> 
         	  <input type="hidden" name="writer" value="${sessionScope.user_id}"> 
          	      
              <h5>프로젝트 시작하기 전 읽어주세요.</h5>
              <ul class="bg-light rounded p-3 text-muted text-small">
                <li>
                  <p>Q.무엇을 만들기 위한 프로젝트인가요?</p>
                <li>
                  <p>Q.프로젝트를 간단히 소개한다면?</p>
                </li>
                <li>
                  <p>Q.이 프로젝트가 왜 의미있나요?</p>
                </li>
                <li>
                  <p>Q.이 프로젝트를 시작하게 된 배경이 무엇인가요?</p>
                </li>
              </ul>
              <button class="btn btn-primary col-6 mx-auto" type="button" id="writeBtn">시작하기</button>          
          </form>
      </div><!-- 탭 컨텐츠 end -->
    </div><!-- contentsWrap end -->
   </section>
   <!--페이지 내용 종료-->
 <!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
  <script type="text/javascript">
		$("#writeBtn").on("click", function() {
			let form = $("#form");
			form.attr("action", "<c:url value='/project/write' />")
			form.attr("method", "post")
			form.submit()
		})
  </script>
</body>
</html>