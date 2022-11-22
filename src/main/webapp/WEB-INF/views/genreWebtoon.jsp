<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  	<!-- meta태그, CSS, JS, 타이틀 인클루드  -->
  	<%@ include file ="meta.jsp" %>
	<link rel="stylesheet" href="resources/assets/css/heart.css">
	<link rel="stylesheet" href="resources/assets/css/indexHover.css">
	<script src="resources/assets/js/heart.js"></script>
</head>
<body>
  <!--헤더 인클루드-->
   <%@ include file ="header.jsp" %>
   
 
  <!--메인 컨테이너 -->
  <section>
    <h1 class="visually-hidden">HOME</h1>
    <div class="contentsWrap">
      <!--컨텐츠 영역-->
      <!-- 펀딩 프로젝트 -->
      <div class="album">
      	<div class="container d-flex justify-content-between">
          <h3 class="ms-2">📘<b>웹툰</b></h3>
	       <div class="dropdown dropdown-menu-end">
	        <form action='<c:url value="/genre/webtoon"/>' method="get">
	          <button class="btn btn-secondary dropdown-toggle" id="orderSelect" type="button" data-bs-toggle="dropdown" aria-expanded="false" > 정렬 </button>
	          <ul class="dropdown-menu dropdown-menu-end text-end">
	         	 <li><button class="dropdown-item"> 정렬 </button></li>
	            <li><button class="dropdown-item" name="order" value="popular">인기순</button></li>
	            <li><button class="dropdown-item" name="order" value="new" >최신순</button></li>
	          </ul>      
	        </form>
	       </div>
      	</div>
        <div class="container py-4"><!-- genre div start -->
          <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
          	<c:forEach var="ProjectDto" items="${list_gw }">        
            <div class="col"><!-- project thumb start -->
              <div class="card shadow-sm">
                <!-- 좋아요 버튼 -->
                <button class="likeBtn" onclick="clickBtn()"><i class="fa-regular fa-heart far"></i></button>
                <div onclick="location.href='${pageContext.request.contextPath}/projectdetail'" style="cursor:pointer">
                <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                </div>
                 <div class="card-body">
                  <p class="card-cate" onclick="location.href='webtoon'">
                  <c:choose>
                  	<c:when test="${ ProjectDto.prdt_genre eq 3}">웹툰</c:when>
                  	<c:otherwise>장르</c:otherwise>
                  </c:choose>
                  </p>
                  <div class="link-div" onclick="location.href='${pageContext.request.contextPath}/projectdetail'">
	                  <p class="card-text"><h5>${ProjectDto.prdt_name }</h5></p>
                   </div>
	                  <div class="d-flex justify-content-between align-items-center">
                     	<strong class="text-danger">현재 달성률 ${ProjectDto.prdt_percent }%</strong>
                    	<small class="text-muted"><fmt:formatNumber type="number" maxFractionDigits="3" value="${ProjectDto.prdt_currenttotal }"></fmt:formatNumber>원</small>
                    	<small class="text-muted text-end">${ProjectDto.prdt_dday}일 남음</small>
                  	</div>
                  <div class="progress">
                    <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-label="Animated striped example" style="width: ${ProjectDto.prdt_percent }%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
              </div>
            </div><!-- project thumb end -->
          	</c:forEach>
          </div><!-- project row end -->
        </div><!-- genre div end -->
      </div>
    </div>

  </section>
  	<script>
	/*progressbar 연동 JS*/
	const perValue = ${ProjectDto.prdt_percent };
	if(perValue >= 100) {perValue = 100;}
	</script>
	<script>
	let orderSelect = document.getElementById("orderSelect");
    function searchParam(key) {
         return new URLSearchParams(location.search).get(key);
    }
    let order = searchParam('order');
    switch (order){
    case 'popular' :
        orderSelect.innerText = '인기순';
        break;
    case 'new' : 
        orderSelect.innerText = '최신순';
        break;
    default :
        orderSelect.innerText = ' 정렬 ';
    }
	</script>
  <!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
</body>
</html>