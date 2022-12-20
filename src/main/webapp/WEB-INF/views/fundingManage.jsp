<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="loginId" value="${sessionScope.id}" /> 

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
      <input type="hidden" id="dayNtotal" value="${dayNtotal}">
       <form id="form" class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
         <div class="px-4 pt-4 position-static">
           <div class="d-flex justify-content-between">
	           <div class="d-flex">
	           		<a class="mb-0" href="<c:url value="/project/${proj_dto.prdt_id }"/>"><h4>${proj_dto.prdt_name}</h4></a>
	           		<p class="mx-3 text-danger">종료 D
	           		<c:choose>
	           			<c:when test="${proj_dto.prdt_dday >= 0 }">-${proj_dto.prdt_dday }</c:when>
	           			<c:when test="${proj_dto.prdt_dday < 0 }">+${-proj_dto.prdt_dday }</c:when>
	           			<c:otherwise>DDAY출력</c:otherwise>
	           		</c:choose>
	           		</p>
	           		<p>종료일 <fmt:formatDate value="${proj_dto.prdt_enddate }" pattern="yyyy년 MM월 dd일"/></p>
	      		</div>
	      		<div>
	      			<input type="button" class="btn btn-sm btn-outline-primary " data-bs-toggle="tooltip" data-bs-placement="top" data-bs-custom-class="custom-tooltip"
        					data-bs-title="배송지 포함 구매목록 출력" value="Export" onclick="location.href='${pageContext.request.contextPath}/downloadCSV/${prdt_id}'">
	      		</div>
           </div>
         <div class="row ps-2 pt-2">
	  		<p>
	  		달성률 ${proj_dto.prdt_percent }% | 후원자수  ${proj_dto.prdt_buyercnt }명 | 
	  		전체 모금액 <fmt:formatNumber value="${proj_dto.prdt_currenttotal }" pattern="#,###" />원
	  		</p>
	 	 </div>
        </div>
        
      	<!-- 대시보드 -->
        <div>
   	   <canvas class="my-4 w-100 chartjs-render-monitor" id="myChart" width="1000" height="400" style="display: block; height: 300px; width: 300;">
   	   </canvas>
        </div>
   	   
       <!-- 테이블 -->       
		  <table class="table">
		  	<tr class="table-Secondary">
			  	<th class="text-center col-1" scope="col">주문<br>번호</th>
			  	<th class="text-center col-3" scope="col">주문 일자</th>
			  	<th class="text-center col-1"  scope="col">회원<br>번호</th>
			  	<th  class="text-center col-5"  scope="col">주문 정보</th>
			  	<th  class="text-end col-2" scope="col">주문 금액</th>
		  	</tr>
			<c:if test="${empty list_pay }">
			<tr class="text-center" >
			  	<td colspan="5">일주일간 주문내역이 없습니다.</td>
			</tr>
			 </c:if>
			 <c:if test="${not empty list_pay }">
			  	<c:forEach var="paymentDto" items="${list_pay }">
			  	<tr>
					  <td class="text-center col-1"><a href="${pageContext.request.contextPath}/paymentCompleted/${paymentDto.pay_no}">${paymentDto.pay_no }</a></td>
					  <td  class="col-3 text-center"><fmt:formatDate value="${paymentDto.pay_time }" pattern="yyyy년 MM월 dd일"/></td>
					  <td class="text-center col-1">${paymentDto.user_no }</td>
					  <td  class="col-5 text-center">${paymentDto.reward_id_s }|${paymentDto.reward_user_cnt_s }</td>
					  <td  class="col-2 text-end"><fmt:formatNumber value="${paymentDto.pay_total }" pattern="#,###" />원</td>
				  </tr>
			  	</c:forEach>
			  	</c:if>
		  </table>
   	   	  
   	   </form>       
	  
   </div>
  </section>
  <%@ include file ="footer.jsp" %>
    <script src="${pageContext.request.contextPath}/resources/assets/js/dashboard.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" ></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
	<script>
	const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
	const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
	</script>
</body>
</html>