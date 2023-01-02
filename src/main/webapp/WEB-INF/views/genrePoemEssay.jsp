<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
      <div class="album">
      	<div class="container d-flex justify-content-between">
          <h3 class="ms-2">📗<b>시/에세이</b></h3>
	       <div class="dropdown me-1">
	        <form action='<c:url value="/genre/poemessay"/>' method="get">
	          <button class="btn btn-secondary dropdown-toggle" id="orderSelect" type="button" data-bs-toggle="dropdown" aria-expanded="false" >정렬</button>
	          <ul class="dropdown-menu dropdown-menu-end text-end">
	         	 <li><button class="dropdown-item">정렬</button></li>
	            <li><button class="dropdown-item" name="order" value="popular">인기순</button></li>
	            <li><button class="dropdown-item" name="order" value="new" >최신순</button></li>
	          </ul>      
	          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	          
	        </form>
	       </div>
      	</div>
        <div class="container py-4">
          <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
          	<c:forEach var="ProjectDto" items="${list_gpe }">        
            <div class="col">
              <div class="card shadow-sm">
                <!-- 좋아요 버튼 -->
                <button class="likeBtn" onclick="clickBtntest()"><i class="fa-regular fa-heart ${fn:contains(Likelist, ProjectDto.prdt_id)? 'fas active' : 'far' }"></i></button>
                <div onclick="location.href='/purplaying/project/${ProjectDto.prdt_id}'" style="cursor:pointer">
					<img class="bd-placeholder-img" width="100%" height="225" id="prdt_thumbnail" name="prdt_thumbnail"
                		src="${ProjectDto.prdt_thumbnail}" style=" ${ProjectDto.prdt_thumbnail == null ? 'display:none' : '' }">
                </div>
                 <div class="card-body">
                  <p class="card-cate" onclick="location.href='poemessay'">
                  <c:choose>
                  	<c:when test="${ ProjectDto.prdt_genre eq 2}">시/에세이</c:when>
                  	<c:otherwise>장르</c:otherwise>
                  </c:choose>
                  </p>
                  <div class="link-div" onclick="location.href='/purplaying/project/${ProjectDto.prdt_id}'">
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
            </div>
          	</c:forEach>
          </div>
        </div>
      </div>
    </div>

  </section>
  	<!-- 드롭박스 필터 -->
	<script type="text/javascript">
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