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
</head>
<body>
  <!--헤더 인클루드-->
   <%@ include file ="header.jsp" %>
   
  <!-- 카로셀 -->
  <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
    <c:forEach var="bannerimg" items="${bannerList}" varStatus="status">
      <div class="carousel-item ${status.index == 0 ? 'active' : ''}" id="item${status.index}">
        <div class="container">
         <img src="${bannerimg.bannerfile_file }" class="d-block w-100">
          <div class="carousel-caption text-start">
            <p><a class="btn btn-outline-secondary" href="/purplaying/project/${bannerimg.bannerfile_prdt_id }">자세히보기</a></p>
          </div>
        </div>
      </div>
     </c:forEach>
      <!-- <div class="carousel-item"  id="item01">
        <div class="container">
          <div class="carousel-caption text-start">
            <h1>화제의 번역서 원서로 읽기</h1>
            <p>읽고 싶었던 원서 번역 펀딩하기</p>
            <p><a class="btn btn-outline-secondary" href="/purplaying/fundingguide">펀딩 가이드</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item" id="item03">
        <div class="container">
          <div class="carousel-caption text-start">
            <h1>2022 노벨문학상, 아니 에르노</h1>
            <p>Some representative placeholder content for the third slide of this carousel.</p>
            <p><a class="btn btn-outline-secondary" href="/purplaying/projectDetail">자세히보기</a></p>
          </div>
        </div>
      </div>
    </div> -->
    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>

  <!--메인 컨테이너 -->
  <section>
    <h1 class="visually-hidden">HOME</h1>
    <div class="contentsWrap">
      <!--컨텐츠 영역-->
      <!-- 펀딩 프로젝트 -->
      <div class="album py-5">
        <div class="container">
          <h4 class="mb-2"><a href="/purplaying/popularFunding">지금 달성률이 높은 펀딩🔥</a></h4>
          <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3 mb-4">           
          <c:forEach var="ProjectDto" items="${list_p }">
            <div class="col"><!-- project thumb start -->
              <div class="card shadow-sm">
                <!-- 좋아요 버튼 -->
                <button class="likeBtn" onclick="clickBtn()"><i class="fa-regular fa-heart ${fn:contains(Likelist, ProjectDto.prdt_id)? 'fas active' : 'far' }"></i></button>
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
          </div>
         
          <h4 class="mb-2"><a href="/purplaying/newFunding">오늘의 신규 펀딩✨</a></h4>
          <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3 mb-4">         
          	<c:forEach var="ProjectDto" items="${list_n }">
            <div class="col"><!-- project thumb start -->
              <div class="card shadow-sm">
                <!-- 좋아요 버튼 -->
               	
                <button class="likeBtn" onclick="clickBtn()"><i class="fa-regular fa-heart ${fn:contains(Likelist, ProjectDto.prdt_id)? 'fas active' : 'far' }"></i></button>
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
          </div>
        </div>
      </div>
    </div>
  </section>
	<script>
	/*progressbar 연동 JS*/
	const perValue = ${ProjectDto.prdt_percent };
	if(perValue >= 100) {perValue = 100;}
	</script>
  <!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
</body>
</html>