<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- meta태그, CSS, JS, 타이틀 인클루드  -->
<%@ include file="meta.jsp"%>
</head>

<body>
	<!--헤더 인클루드-->
	<%@ include file="header.jsp"%>

	<!--페이지 내용 시작-->
	<section>
		<h1 class="visually-hidden">홈</h1>
		<!--컨텐츠 영역-->
		<div class="row justify-content-md-center">
        	<h2 class="col-auto my-5">고객센터</h2>
      	</div>
		<div class="container mb-5">
			<div class="mb-4"> <!-- 탭 start-->
			    <div class="nav nav-tabs nav-justified" id="v-pills-tab" role="tablist"> <!-- 탭 menu start-->
			      <button class="nav-link" id="v-pills-01-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab01" type="button" role="tab" aria-controls="v-pills-tab01" aria-selected="false" onclick="location.href='servicecenter'">공지사항</button>
			      <button class="nav-link" id="v-pills-02-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab02" type="button" role="tab" aria-controls="v-pills-tab02" aria-selected="false" onclick="location.href='questions'">자주 묻는 질문</button>
			      <button class="nav-link active" id="v-pills-03-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab03" type="button" role="tab" aria-controls="v-pills-tab03" aria-selected="true" onclick="location.href='oneonone'">1:1 문의</button>
			    </div><!-- 탭 menu end-->
			    <div class="row col-10 justify-content-center mx-auto"><!-- 탭 컨텐츠 start -->
				    <div class="tab-content" id="v-pills-tabContent">
				        <!-- tab 1 contents -->
				        <div class="tab-pane fade show active py-5" id="v-pills-tab01" role="tabpanel" aria-labelledby="v-pills-tab01-tab">
							<!-- 게시판 글 내용 -->
							<div class="card p-5 mb-3">
								<!-- 제목 영역  -->
								<div class="mt-3">
									<h6 class="card-subtitle mb-2 text-muted">1:1 문의</h6>
									<h5 class="card-title">문의사항 있어요</h5>
									<small class="card-subtitle mb-2 text-muted">2022-05-26 12:27:41</small>
								</div>
								<hr class="my-4">
								<!--질문 내용 영역 -->
								<div class="px-4 py-2">
									<p>
									안녕하세요? <br/>
									문의사항이 있습니다.<br/><br/>
									서비스 개선 부탁드립니다.<br/><br/><br/>
									</p>
								</div>
							</div>
								<button type="button" class="col-1 btn btn-primary" style="${adminWrite}" onclick="location.href='noticeWrite'">답변</button>
							<!-- 목록으로 가기 -->
							<div class="row mx-auto col-md-4">
								<button type="button" class="btn btn-outline-primary my-3" onclick="history.back(-1)">목록으로 돌아가기</button>		
		      				</div>
						</div>
					</div><!-- 탭 end-->
				</div>
			</div><!-- 컨텐츠영역 end-->
		</div>
	</section>
	<!--페이지 내용 종료-->

	<!--푸터 인클루드-->
	<%@ include file="footer.jsp"%>
</body>
</html>