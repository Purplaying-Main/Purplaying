<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <!-- meta태그, CSS, JS, 타이틀 인클루드  -->
  <%@ include file ="meta.jsp" %>
</head>
<link rel="stylesheet" href="resources/assets/css/heart.css">
<link rel="stylesheet" href="resources/assets/css/indexHover.css">
<script src="resources/assets/js/heart.js"></script>
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
          <h4>지금 달성률이 높은 펀딩</h4>
          <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <div class="col"><!-- project thumb start -->
              <div class="card shadow-sm">
                <!-- 좋아요 버튼 -->
                <button class="likeBtn" onclick="clickBtn()"><i class="fa-regular fa-heart far far"></i></button>
                <div onclick="location.href='projectdetail'" style="cursor:pointer">
                <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                </div>
                <div class="card-body">
                  <p class="card-cate" onclick="location.href='genrewebtoon'">웹툰</p>
                  <div class="link-div" onclick="location.href='projectdetail'">
	                  <p class="card-text"><h5>1999년 감성으로 찾아온 '세기말 풋사과 보습학원'</h5></p>
                   </div>
	                  <div class="d-flex justify-content-between align-items-center">
                     	<strong class="text-danger">현재 달성률 75%</strong>
                    	<small class="text-muted">1,805,000원</small>
                    	<small class="text-muted text-end">43일 남음</small>
                  	</div>
                  <div class="progress">
                    <div class="progress-bar" role="progressbar" aria-label="Basic example" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
              </div>
            </div><!-- project thumb end -->
            <div class="col"><!-- project thumb start -->
              <div class="card shadow-sm">
                <!-- 좋아요 버튼 -->
                <button class="likeBtn" onclick="clickBtn()"><i class="fa-regular fa-heart far far"></i></button>
                <div onclick="location.href='projectdetail'" style="cursor:pointer">
                <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                </div>
                <div class="card-body">
                  <p class="card-cate" onclick="location.href='genrewebtoon'">웹툰</p>
                  <div class="link-div" onclick="location.href='projectdetail'">
	                  <p class="card-text"><h5>1999년 감성으로 찾아온 '세기말 풋사과 보습학원'</h5></p>
                   </div>
	                  <div class="d-flex justify-content-between align-items-center">
                     	<strong class="text-danger">현재 달성률 75%</strong>
                    	<small class="text-muted">1,805,000원</small>
                    	<small class="text-muted text-end">43일 남음</small>
                  	</div>
                  <div class="progress">
                    <div class="progress-bar" role="progressbar" aria-label="Basic example" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
              </div>
            </div><!-- project thumb end -->
            <div class="col"><!-- project thumb start -->
              <div class="card shadow-sm">
                <!-- 좋아요 버튼 -->
                <button class="likeBtn" onclick="clickBtn()"><i class="fa-regular fa-heart far far"></i></button>
                <div onclick="location.href='projectdetail'" style="cursor:pointer">
                <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                </div>
                <div class="card-body">
                  <p class="card-cate" onclick="location.href='genrewebtoon'">웹툰</p>
                  <div class="link-div" onclick="location.href='projectdetail'">
	                  <p class="card-text"><h5>1999년 감성으로 찾아온 '세기말 풋사과 보습학원'</h5></p>
                   </div>
	                  <div class="d-flex justify-content-between align-items-center">
                     	<strong class="text-danger">현재 달성률 75%</strong>
                    	<small class="text-muted">1,805,000원</small>
                    	<small class="text-muted text-end">43일 남음</small>
                  	</div>
                  <div class="progress">
                    <div class="progress-bar" role="progressbar" aria-label="Basic example" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
              </div>
            </div><!-- project thumb end -->
          </div><!-- project row end -->
        </div><!-- genre div end -->
        <div class="container py-4"><!-- genre div start -->
          <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <div class="col"><!-- project thumb start -->
              <div class="card shadow-sm">
                <!-- 좋아요 버튼 -->
                <button class="likeBtn" onclick="clickBtn()"><i class="fa-regular fa-heart far far"></i></button>
                <div onclick="location.href='projectdetail'" style="cursor:pointer">
                <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                </div>
                <div class="card-body">
                  <p class="card-cate" onclick="location.href='genrewebtoon'">웹툰</p>
                  <div class="link-div" onclick="location.href='projectdetail'">
	                  <p class="card-text"><h5>1999년 감성으로 찾아온 '세기말 풋사과 보습학원'</h5></p>
                   </div>
	                  <div class="d-flex justify-content-between align-items-center">
                     	<strong class="text-danger">현재 달성률 75%</strong>
                    	<small class="text-muted">1,805,000원</small>
                    	<small class="text-muted text-end">43일 남음</small>
                  	</div>
                  <div class="progress">
                    <div class="progress-bar" role="progressbar" aria-label="Basic example" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
              </div>
            </div><!-- project thumb end -->
            <div class="col"><!-- project thumb start -->
              <div class="card shadow-sm">
                <!-- 좋아요 버튼 -->
                <button class="likeBtn" onclick="clickBtn()"><i class="fa-regular fa-heart far far"></i></button>
                <div onclick="location.href='projectdetail'" style="cursor:pointer">
                <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                </div>
                <div class="card-body">
                  <p class="card-cate" onclick="location.href='genrewebtoon'">웹툰</p>
                  <div class="link-div" onclick="location.href='projectdetail'">
	                  <p class="card-text"><h5>1999년 감성으로 찾아온 '세기말 풋사과 보습학원'</h5></p>
                   </div>
	                  <div class="d-flex justify-content-between align-items-center">
                     	<strong class="text-danger">현재 달성률 75%</strong>
                    	<small class="text-muted">1,805,000원</small>
                    	<small class="text-muted text-end">43일 남음</small>
                  	</div>
                  <div class="progress">
                    <div class="progress-bar" role="progressbar" aria-label="Basic example" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
              </div>
            </div><!-- project thumb end -->
            <div class="col"><!-- project thumb start -->
              <div class="card shadow-sm">
                <!-- 좋아요 버튼 -->
                <button class="likeBtn" onclick="clickBtn()"><i class="fa-regular fa-heart far far"></i></button>
                <div onclick="location.href='projectdetail'" style="cursor:pointer">
                <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                </div>
                <div class="card-body">
                  <p class="card-cate" onclick="location.href='genrewebtoon'">웹툰</p>
                  <div class="link-div" onclick="location.href='projectdetail'">
	                  <p class="card-text"><h5>1999년 감성으로 찾아온 '세기말 풋사과 보습학원'</h5></p>
                   </div>
	                  <div class="d-flex justify-content-between align-items-center">
                     	<strong class="text-danger">현재 달성률 75%</strong>
                    	<small class="text-muted">1,805,000원</small>
                    	<small class="text-muted text-end">43일 남음</small>
                  	</div>
                  <div class="progress">
                    <div class="progress-bar" role="progressbar" aria-label="Basic example" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
              </div>
            </div><!-- project thumb end -->
          </div><!-- project row end -->
        </div><!-- genre div end -->
      </div>
    </div>

  </section>
  
  <!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
</body>
</html>