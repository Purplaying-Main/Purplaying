<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<!-- meta태그, CSS, JS, 타이틀 인클루드  -->
  <%@ include file ="meta.jsp" %>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/dashboard.css">
</head>
<body>
  <!--헤더 인클루드-->
   <%@ include file ="header.jsp" %>
 <!--메인 컨테이너 -->
  <section>
    <h1 class="visually-hidden">HOME</h1>
    <div class="contentsWrap col-md-8  mx-auto">
    
      <!--컨텐츠 영역-->
      <div class="row">
        <h2 class="col-auto mb-5 justify-content-md-center">창작중인 펀딩 관리</h2>
      </div>
      <div class="d-flex justify-content-between">
        <p>펀딩 이름 ${paymentDto.prdt_id }</p>
      	<input type="button" class="btn btn-sm btn-outline-primary" value="Export" onclick="location.href='${pageContext.request.contextPath}/downloadCSV/${prdt_id}'">
      </div>

   </div>
  </section>
   <%@ include file ="footer.jsp" %>
  <script src="${pageContext.request.contextPath}/resources/assets/js/dashboard.js"></script>
</body>
</html>