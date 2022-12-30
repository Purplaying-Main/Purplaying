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
	<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
    <c:forEach var="bannerimg" items="${bannerList}" varStatus="status">
      <div class="carousel-item ${status.index == 0 ? 'active' : ''}" id="item${status.index}"
      		style="background: url(${bannerimg.bannerfile_file }) center; background-repeat: no-repeat; background-size: cover; width: 100%;">
        <div class="container">
          <div class="carousel-caption text-end">
            <c:if test="${bannerimg.bannerfile_prdt_id != 0}">
            <h1></h1>
            <p></p>
            <p><a class="btn btn-lg btn-primary" href="/purplaying/project/${bannerimg.bannerfile_prdt_id }">자세히보기</a></p>
            </c:if> 
          </div>
        </div>
      </div>
	</c:forEach>
    </div>
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
          <div class="mb-2 row justify-content-between">
          	 <a class="col-6" href="/purplaying/popularFunding"><span class="fs-4 fw-bold">지금 달성률이 높은 펀딩🔥</span>   <i class="fa-regular fa-square-plus"></i> 더보기</a>
          	 <div class="col-4">
				<!-- 페이지 네비게이션 -->
				<div class="col-1"></div>
					<div class="pagination mb-0 justify-content-end">
				    	<c:if test="${totalCnt == null || totalCnt == 0 }">
							<h6 class="row text-center ">게시물이 없습니다.</h6>
						</c:if>
					    <!-- 게시물이 있는 경우, page nav 출력  -->
						<c:if test="${totalCnt != null || totalCnt != 0 }">
						    <!-- <button type="button" role="presentation" class="page-link"> <i class="fa-solid fa-angle-left"></i></button>
						    <button type="button" role="presentation" class="page-link"><i class="fa-solid fa-angle-right"></i> </button> -->
<!-- 						    <div class="owl-nav">
						    	<button type="button" role="presentation" class="owl-prev"><i class="fa-solid fa-angle-left"></i></button>
						    	<button type="button" role="presentation" class="owl-next"><i class="fa-solid fa-angle-right"></i></button>
						    </div> -->
						</c:if>
					</div>          	 	
          	 	</div>
          	</div>
          <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3 mb-4"> 
          
          <div class="featured-carousel owl-carousel">
          	 <c:forEach var="ProjectDto" items="${list_p}">
	          	<div class="item">
					<div class="work">
						
						<div class="" id="popularList"><!-- project thumb start -->
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
			                </div><!-- card-body end  -->
			              </div><!-- card end  -->
			            </div><!-- project thumb end -->
					</div>
				</div>
			 </c:forEach>
          </div>  

          </div>
         
          <h4 class="mb-2 fw-bold"><a href="/purplaying/newFunding">오늘의 신규 펀딩✨</a></h4>
          <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3 mb-4">
          <div class="featured-carousel owl-carousel">         
          	<c:forEach var="ProjectDto" items="${list_n }">
          	  <div class="item">
			    <div class="work">
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
               </div>
			  </div>
          	</c:forEach>
           </div><!-- carousel end -->
          
          </div>
        </div>
      </div>
    </div>
  </section>
<!--   <script type="text/javascript">
	/*progressbar 연동 JS*/
	const perValue = ${ProjectDto.prdt_percent };
	if(perValue >= 100) {perValue = 100;}
	</script> -->
  <!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
  <script type="text/javascript">
  (function($) {

		"use strict";

		var fullHeight = function() {

			$('.js-fullheight').css('height', $(window).height());
			$(window).resize(function(){
				$('.js-fullheight').css('height', $(window).height());
			});

		};
		fullHeight();

		var carousel = function() {
			$('.featured-carousel').owlCarousel({
		    loop:true,
		    autoplay: false,
		    margin:30,
		    animateOut: 'fadeOut',
		    animateIn: 'fadeIn',
		    nav:true,
		    dots: true,
		    autoplayHoverPause: false,
		    items: 1,
		    navText : ["<i class='fa-solid fa-angle-left'></i>","<i class='fa-solid fa-angle-right'></i>"],
		    responsive:{
		      0:{
		        items:1
		      },
		      600:{
		        items:2
		      },
		      1000:{
		        items:3
		      }
		    }
			});

		};
		carousel();

	})(jQuery);
  </script>
</body>
</html>