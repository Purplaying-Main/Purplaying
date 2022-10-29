<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- meta태그, CSS, JS, 타이틀 인클루드  -->
<%@ include file="meta.jsp"%>
</head>
<body>
	<%@ include file="header.jsp"%>
 
	<!--메인 컨테이너 -->
	<section>
		<h1 class="visually-hidden">HOME</h1>
		<div class="contentsWrap">
			<!--컨텐츠 영역-->
			<!-- 펀딩 프로젝트 -->
			<div class="album">
				<div class="dropdown container">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						data-bs-toggle="dropdown" aria-expanded="false">달성률</button>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="#">최신등록순</a></li>
						<li><a class="dropdown-item" href="#">관심많은순</a></li>
					</ul>
				</div>
				<div class="container py-4">
					<!-- genre div start -->
					<h4>
						<a href="genreLiterature.html">문학</a>
					</h4>
					<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
						<div class="col">
							<!-- project thumb start -->
							<div class="card shadow-sm">
								<!-- 좋아요 버튼 -->
								<button class="likeBtn">
									<i class="fa-solid fa-heart"></i>
								</button>
								<svg class="bd-placeholder-img card-img-top" width="100%"
									height="225" xmlns="http://www.w3.org/2000/svg" role="img"
									aria-label="Placeholder: Thumbnail"
									preserveAspectRatio="xMidYMid slice" focusable="false">
									<title>Placeholder</title><rect width="100%" height="100%"
										fill="#55595c" />
									<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
								<div class="card-body">
									<p class="card-cate">웹툰</p>
									<p class="card-text">
									<h5>1999년 감성으로 찾아온 '세기말 풋사과 보습학원'</h5>
									</p>
									<div class="d-flex justify-content-between align-items-center">
										<strong class="text-danger">현재 달성률 75%</strong> <small
											class="text-muted">1,805,000원</small> <small
											class="text-muted text-end">43일 남음</small>
									</div>
									<div class="progress">
										<div class="progress-bar" role="progressbar"
											aria-label="Basic example" style="width: 75%"
											aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
							</div>
						</div>
						<!-- project thumb end -->
						<div class="col">
							<!-- project thumb start -->
							<div class="card shadow-sm">
								<!-- 좋아요 버튼 -->
								<button class="likeBtn">
									<i class="fa-solid fa-heart"></i>
								</button>
								<svg class="bd-placeholder-img card-img-top" width="100%"
									height="225" xmlns="http://www.w3.org/2000/svg" role="img"
									aria-label="Placeholder: Thumbnail"
									preserveAspectRatio="xMidYMid slice" focusable="false">
									<title>Placeholder</title><rect width="100%" height="100%"
										fill="#55595c" />
									<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
								<div class="card-body">
									<p class="card-cate">웹툰</p>
									<p class="card-text">
									<h5>1999년 감성으로 찾아온 '세기말 풋사과 보습학원'</h5>
									</p>
									<div class="d-flex justify-content-between align-items-center">
										<strong class="text-danger">현재 달성률 75%</strong> <small
											class="text-muted">1,805,000원</small> <small
											class="text-muted text-end">43일 남음</small>
									</div>
									<div class="progress">
										<div class="progress-bar" role="progressbar"
											aria-label="Basic example" style="width: 75%"
											aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
							</div>
						</div>
						<!-- project thumb end -->
						<div class="col">
							<!-- project thumb start -->
							<div class="card shadow-sm">
								<!-- 좋아요 버튼 -->
								<button class="likeBtn">
									<i class="fa-solid fa-heart"></i>
								</button>
								<svg class="bd-placeholder-img card-img-top" width="100%"
									height="225" xmlns="http://www.w3.org/2000/svg" role="img"
									aria-label="Placeholder: Thumbnail"
									preserveAspectRatio="xMidYMid slice" focusable="false">
									<title>Placeholder</title><rect width="100%" height="100%"
										fill="#55595c" />
									<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
								<div class="card-body">
									<p class="card-cate">웹툰</p>
									<p class="card-text">
									<h5>1999년 감성으로 찾아온 '세기말 풋사과 보습학원'</h5>
									</p>
									<div class="d-flex justify-content-between align-items-center">
										<strong class="text-danger">현재 달성률 75%</strong> <small
											class="text-muted">1,805,000원</small> <small
											class="text-muted text-end">43일 남음</small>
									</div>
									<div class="progress">
										<div class="progress-bar" role="progressbar"
											aria-label="Basic example" style="width: 75%"
											aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
							</div>
						</div>
						<!-- project thumb end -->
					</div>
					<!-- project row end -->
				</div>
				<!-- genre div end -->
				<div class="container py-4">
					<!-- genre div start -->
					<h4>
						<a href="genrePoemEssay.html">시/에세이</a>
					</h4>
					<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
						<div class="col">
							<!-- project thumb start -->
							<div class="card shadow-sm">
								<!-- 좋아요 버튼 -->
								<button class="likeBtn">
									<i class="fa-solid fa-heart"></i>
								</button>
								<svg class="bd-placeholder-img card-img-top" width="100%"
									height="225" xmlns="http://www.w3.org/2000/svg" role="img"
									aria-label="Placeholder: Thumbnail"
									preserveAspectRatio="xMidYMid slice" focusable="false">
									<title>Placeholder</title><rect width="100%" height="100%"
										fill="#55595c" />
									<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
								<div class="card-body">
									<p class="card-cate">웹툰</p>
									<p class="card-text">
									<h5>1999년 감성으로 찾아온 '세기말 풋사과 보습학원'</h5>
									</p>
									<div class="d-flex justify-content-between align-items-center">
										<strong class="text-danger">현재 달성률 75%</strong> <small
											class="text-muted">1,805,000원</small> <small
											class="text-muted text-end">43일 남음</small>
									</div>
									<div class="progress">
										<div class="progress-bar" role="progressbar"
											aria-label="Basic example" style="width: 75%"
											aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
							</div>
						</div>
						<!-- project thumb end -->
						<div class="col">
							<!-- project thumb start -->
							<div class="card shadow-sm">
								<!-- 좋아요 버튼 -->
								<button class="likeBtn">
									<i class="fa-solid fa-heart"></i>
								</button>
								<svg class="bd-placeholder-img card-img-top" width="100%"
									height="225" xmlns="http://www.w3.org/2000/svg" role="img"
									aria-label="Placeholder: Thumbnail"
									preserveAspectRatio="xMidYMid slice" focusable="false">
									<title>Placeholder</title><rect width="100%" height="100%"
										fill="#55595c" />
									<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
								<div class="card-body">
									<p class="card-cate">웹툰</p>
									<p class="card-text">
									<h5>1999년 감성으로 찾아온 '세기말 풋사과 보습학원'</h5>
									</p>
									<div class="d-flex justify-content-between align-items-center">
										<strong class="text-danger">현재 달성률 75%</strong> <small
											class="text-muted">1,805,000원</small> <small
											class="text-muted text-end">43일 남음</small>
									</div>
									<div class="progress">
										<div class="progress-bar" role="progressbar"
											aria-label="Basic example" style="width: 75%"
											aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
							</div>
						</div>
						<!-- project thumb end -->
						<div class="col">
							<!-- project thumb start -->
							<div class="card shadow-sm">
								<!-- 좋아요 버튼 -->
								<button class="likeBtn">
									<i class="fa-solid fa-heart"></i>
								</button>
								<svg class="bd-placeholder-img card-img-top" width="100%"
									height="225" xmlns="http://www.w3.org/2000/svg" role="img"
									aria-label="Placeholder: Thumbnail"
									preserveAspectRatio="xMidYMid slice" focusable="false">
									<title>Placeholder</title><rect width="100%" height="100%"
										fill="#55595c" />
									<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
								<div class="card-body">
									<p class="card-cate">웹툰</p>
									<p class="card-text">
									<h5>1999년 감성으로 찾아온 '세기말 풋사과 보습학원'</h5>
									</p>
									<div class="d-flex justify-content-between align-items-center">
										<strong class="text-danger">현재 달성률 75%</strong> <small
											class="text-muted">1,805,000원</small> <small
											class="text-muted text-end">43일 남음</small>
									</div>
									<div class="progress">
										<div class="progress-bar" role="progressbar"
											aria-label="Basic example" style="width: 75%"
											aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
							</div>
						</div>
						<!-- project thumb end -->
					</div>
					<!-- project row end -->
				</div>
				<!-- genre div end -->
				<div class="container py-4">
					<!-- genre div start -->
					<h4>
						<a href="genrePoemEssay.html">웹툰</a>
					</h4>
					<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
						<div class="col">
							<!-- project thumb start -->
							<div class="card shadow-sm">
								<!-- 좋아요 버튼 -->
								<button class="likeBtn">
									<i class="fa-solid fa-heart"></i>
								</button>
								<svg class="bd-placeholder-img card-img-top" width="100%"
									height="225" xmlns="http://www.w3.org/2000/svg" role="img"
									aria-label="Placeholder: Thumbnail"
									preserveAspectRatio="xMidYMid slice" focusable="false">
									<title>Placeholder</title><rect width="100%" height="100%"
										fill="#55595c" />
									<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
								<div class="card-body">
									<p class="card-cate">웹툰</p>
									<p class="card-text">
									<h5>1999년 감성으로 찾아온 '세기말 풋사과 보습학원'</h5>
									</p>
									<div class="d-flex justify-content-between align-items-center">
										<strong class="text-danger">현재 달성률 75%</strong> <small
											class="text-muted">1,805,000원</small> <small
											class="text-muted text-end">43일 남음</small>
									</div>
									<div class="progress">
										<div class="progress-bar" role="progressbar"
											aria-label="Basic example" style="width: 75%"
											aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
							</div>
						</div>
						<!-- project thumb end -->
						<div class="col">
							<!-- project thumb start -->
							<div class="card shadow-sm">
								<!-- 좋아요 버튼 -->
								<button class="likeBtn">
									<i class="fa-solid fa-heart"></i>
								</button>
								<svg class="bd-placeholder-img card-img-top" width="100%"
									height="225" xmlns="http://www.w3.org/2000/svg" role="img"
									aria-label="Placeholder: Thumbnail"
									preserveAspectRatio="xMidYMid slice" focusable="false">
									<title>Placeholder</title><rect width="100%" height="100%"
										fill="#55595c" />
									<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
								<div class="card-body">
									<p class="card-cate">웹툰</p>
									<p class="card-text">
									<h5>1999년 감성으로 찾아온 '세기말 풋사과 보습학원'</h5>
									</p>
									<div class="d-flex justify-content-between align-items-center">
										<strong class="text-danger">현재 달성률 75%</strong> <small
											class="text-muted">1,805,000원</small> <small
											class="text-muted text-end">43일 남음</small>
									</div>
									<div class="progress">
										<div class="progress-bar" role="progressbar"
											aria-label="Basic example" style="width: 75%"
											aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
							</div>
						</div>
						<!-- project thumb end -->
						<div class="col">
							<!-- project thumb start -->
							<div class="card shadow-sm">
								<!-- 좋아요 버튼 -->
								<button class="likeBtn">
									<i class="fa-solid fa-heart"></i>
								</button>
								<svg class="bd-placeholder-img card-img-top" width="100%"
									height="225" xmlns="http://www.w3.org/2000/svg" role="img"
									aria-label="Placeholder: Thumbnail"
									preserveAspectRatio="xMidYMid slice" focusable="false">
									<title>Placeholder</title><rect width="100%" height="100%"
										fill="#55595c" />
									<text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
								<div class="card-body">
									<p class="card-cate">웹툰</p>
									<p class="card-text">
									<h5>1999년 감성으로 찾아온 '세기말 풋사과 보습학원'</h5>
									</p>
									<div class="d-flex justify-content-between align-items-center">
										<strong class="text-danger">현재 달성률 75%</strong> <small
											class="text-muted">1,805,000원</small> <small
											class="text-muted text-end">43일 남음</small>
									</div>
									<div class="progress">
										<div class="progress-bar" role="progressbar"
											aria-label="Basic example" style="width: 75%"
											aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
									</div>
								</div>
							</div>
						</div>
						<!-- project thumb end -->
					</div>
					<!-- project row end -->
				</div>
				<!-- genre div end -->
			</div>
		</div>

	</section>


	<!--푸터 인클루드-->
	<%@ include file="footer.jsp"%>
</body>
</html>