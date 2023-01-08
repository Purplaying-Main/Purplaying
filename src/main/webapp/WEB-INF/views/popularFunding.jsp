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
      <!-- 펀딩 프로젝트 -->
      <div class="album">
		<div class="container py-4"><!-- genre div start -->
          <h3>지금 달성률이 높은 펀딩🔥</h3>
          <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3 mb-3">
          	<c:forEach var="ProjectDto" items="${list_p }">
            <div class="col"><!-- project thumb start -->
              <div class="card shadow-sm">
                <!-- 좋아요 버튼 -->
	                <button class="likeBtn" onclick="clickBtntest()"><i class="fa-regular fa-heart ${fn:contains(Likelist, ProjectDto.prdt_id)? 'fas active' : 'far' }"></i></button>
	                <div onclick="location.href='/purplaying/project/${ProjectDto.prdt_id}'" style="cursor:pointer">
	                	<img class="bd-placeholder-img" width="100%" height="225" id="prdt_thumbnail" name="prdt_thumbnail"
	                		src="${ProjectDto.prdt_thumbnail}" style=" ${ProjectDto.prdt_thumbnail == null ? 'display:none' : '' }">					
	                </div>
                <div class="card-body">
                  	<c:choose>
                  		<c:when test="${ProjectDto.prdt_genre eq 1 }"><p class="card-cate" onclick="location.href='genre/literature'">문학</p></c:when>
                  		<c:when test="${ProjectDto.prdt_genre eq 2 }"><p class="card-cate" onclick="location.href='genre/poemessay'">시/에세이</p></c:when>
                  		<c:when test="${ProjectDto.prdt_genre eq 3 }"><p class="card-cate" onclick="location.href='genre/webtoon'">웹툰</p></c:when>
                  		<c:otherwise><p class="card-cate">장르</p></c:otherwise>
                  	</c:choose>
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
            </div><!-- project thumb end -->
          	</c:forEach>			
          </div><!-- project row end -->
          
			<!-- 페이지 네비게이션 -->
			<div class="col-1"></div>
				<ul class="pagination mt-4 justify-content-center">
					<c:if test="${totalCnt == null || totalCnt == 0 }">
						<h6 class="row text-center ">게시물이 없습니다.</h6>
					</c:if>
					<!-- 게시물이 있는 경우, page nav 출력  -->
					<c:if test="${totalCnt != null || totalCnt != 0 }">
						<c:if test="${pr.showPrev }">
							<li class="page-item">
						    	 <a class="page-link" href="<c:url value="/popularFunding?page=${pr.beginPage-1 }"/>">Previous</a>
							</li>
						</c:if>
						<c:forEach var="i" begin="${pr.beginPage }" end="${pr.endPage }">
							<li class="page-item" style="">
								<a class="page-link <c:if test="${pr.sc2.page==i}">active</c:if>" href="<c:url value="/popularFunding?page=${i}"/>"> ${i} </a>
							</li>
						</c:forEach>
						<c:if test="${pr.showNext }">
							<li class="page-item">
						    	<a class="page-link" href="<c:url value="/popularFunding?page=${pr.endPage+1 }"/>">Next</a>
							</li>
						</c:if>
					</c:if>
				</ul>   
				       
        </div><!-- genre div end -->
      </div>
    </div>

  </section>

  <!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
</body>
</html>