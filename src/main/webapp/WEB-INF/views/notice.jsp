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
			      <button class="nav-link active" id="v-pills-01-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab01" type="button" role="tab" aria-controls="v-pills-tab01" aria-selected="true" onclick="location.href='servicecenter'">공지사항</button>
			      <button class="nav-link" id="v-pills-02-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab02" type="button" role="tab" aria-controls="v-pills-tab02" aria-selected="false" onclick="location.href='questions'">자주 묻는 질문</button>
			      <button class="nav-link" id="v-pills-03-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab03" type="button" role="tab" aria-controls="v-pills-tab03" aria-selected="false" onclick="location.href='oneonone'">1:1 문의</button>
			    </div><!-- 탭 menu end-->
			    <div class="row col-10 justify-content-center mx-auto"><!-- 탭 컨텐츠 start -->
			      <div class="tab-content" id="v-pills-tabContent">
			        <!-- tab 1 contents -->
			        <div class="tab-pane fade show active py-5" id="v-pills-tab01" role="tabpanel" aria-labelledby="v-pills-tab01-tab">
									<!-- 게시판 글 내용 -->
									<div class="card p-5 mb-3">
										<!-- 제목 영역  -->
										<div class="mt-3">
											<h6 class="card-subtitle mb-2 text-muted">이벤트</h6>
											<h5 class="card-title">퍼플레잉 기획전</h5>
											<small class="card-subtitle mb-2 text-muted">2022-05-26 12:27:41</small>
										</div>
										<hr class="my-4">
										<!-- 본문 영역 -->
										<div class="px-4 py-2">
											<p>
											안녕하세요, 퍼플레잉입니다.<br/>
											언제나 퍼플레잉을 이용해 주셔서 감사합니다.<br/><br/>
											2022년 10월 26일(수) 서비스 개선사항을 안내드립니다.<br/><br/><br/>
											[창작자] 현금영수증 발행 정보를 확인할 수 있습니다.<br/>
											펀딩 종료 후 현금영수증 발급 요청을 받으셨다면 프로젝트 관리 > 후원자 관리 페이지 > 우측 상단 '이메일로 모든 명단의 엑셀 파일 요청' 버튼을 클릭해 보세요. 메일로 발송된 엑셀 파일을 열어보시면 후원자의 현금영수증 발행 정보를 확인하실 수 있습니다. 
											</p>
										</div>
									</div>
									<!-- 이전글, 다음글 영역 -->
									<div class="table project-table table-centered table-nowrap table-hover mb-4">
										<div class="fs-6 w-90">
												<ul class="row border-2 border-bottom py-2">
													<li class="col fw-semibold">이전글</li>
													<li class="col text-muted">공지사항</li>
													<li class="col-8 fw-light text-truncate">[서비스 개선] 10월 17일 업데이트 (메시지 이미지 첨부, 알림 세부설정, 대시보드 업데이트)</li>
													<li class="col text-muted">2022-10-17</li>
												</ul>
												<ul class="row border-2 border-bottom py-2">
													<li class="col fw-semibold">이전글</li>
													<li class="col text-muted">공지사항</li>
													<li class="col-8 fw-light text-truncate">[서비스 개선] 10월 17일 업데이트 (메시지 이미지 첨부, 알림 세부설정, 대시보드 업데이트)</li>
													<li class="col text-muted">2022-10-17</li>
												</ul>
										</div>
									</div>
									<div class="row mx-auto col-md-4">
										<button type="button" class="btn btn-outline-primary my-3" onclick="history.back(-1)">목록으로 돌아가기</button>		
			       					</div>
			        </div>
			        <!-- tab 2 contents -->
			        <div class="tab-pane fade" id="v-pills-tab02" role="tabpanel" aria-labelledby="v-pills-tab02-tab">
			            <!-- 아코디언 start -->
			            <div class="accordion mt-5" id="accordionBoard">
			                <div class="accordion-item">
			                  <h2 class="accordion-header" id="heading1">
			                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse1" aria-expanded="true" aria-controls="collapse1">
			                      <strong>배송일자는 어떻게 되나요?</strong>
			                    </button>
			                  </h2>
			                  <div id="collapse1" class="accordion-collapse collapse show" aria-labelledby="heading1" data-bs-parent="#accordionBoard">
			                    <div class="accordion-body">
			                        <p>
			                            배송일자는 펀딩에 따라 상이합니다. 프로젝트 상세페이지 내 커뮤니티에서 판매자에게 문의해주세요.
			                        </p>
			                    </div>
			                  </div>
			                </div>
			                <div class="accordion-item">
			                  <h2 class="accordion-header" id="heading2">
			                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse2" aria-expanded="false" aria-controls="collapse2">
			                        <strong>배송 업체를 변경 할 수 있나요?</strong>
			                    </button>
			                  </h2>
			                  <div id="collapse2" class="accordion-collapse collapse" aria-labelledby="heading2" data-bs-parent="#accordionBoard">
			                    <div class="accordion-body">
			                        <p>
			                            배송이 시작되기 전, 프로젝트 상세페이지 내 커뮤니티에서 판매자에게 문의해주세요.
			                        </p>
			                    </div>
			                  </div>
			                </div>
			                <div class="accordion-item">
			                  <h2 class="accordion-header" id="heading4">
			                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse4" aria-expanded="false" aria-controls="collapse4">
			                        <strong>펀딩을 했는데 결제가 되지 않았어요</strong>
			                    </button>
			                  </h2>
			                  <div id="collapse4" class="accordion-collapse collapse" aria-labelledby="heading4" data-bs-parent="#accordionBoard">
			                    <div class="accordion-body">
			                        <p>
			                            펀딩 결제는 펀딩이 끝난 후 익일에 결제됩니다
			                        </p>
			                    </div>
			                  </div>
			                </div>
			                
			                <div class="accordion-item">
			                  <h2 class="accordion-header" id="heading3">
			                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse3" aria-expanded="false" aria-controls="collapse3">
			                        <strong>상품 불량 등 교환은 어떻게 하나요?</strong>
			                    </button>
			                  </h2>
			                  <div id="collapse3" class="accordion-collapse collapse" aria-labelledby="heading3" data-bs-parent="#accordionBoard">
			                    <div class="accordion-body">
			                        <p>
			                            프로젝트 상세페이지 내 커뮤니티에서 판매자에게 문의해주세요.
			                        </p>
			                    </div>
			                  </div>
			                </div>
			            </div>
			
			        </div>
			        <!-- tab 3 contents -->
			        <div class="tab-pane fade" id="v-pills-tab03" role="tabpanel" aria-labelledby="v-pills-tab03-tab">
			            <div class="row mx-auto mt-5">
			                <table class="table project-table table-centered table-nowrap">
			                    <thead class="border-3 border-bottom">
			                        <tr>
			                            <th scope="col">#</th>
			                            <th scope="col">답변상태</th>
			                            <th scope="col">제목</th>
			                            <th scope="col">작성자</th>
			                            <th scope="col">작성일</th>
			                        </tr>
			                    </thead>
			                    <tbody>
			                        <tr>
			                            <th scope="row">5</th>
			                            <td>답변전</td>
			                            <td>문의사항있어요</td>
			                            <td>김**</td>
			                            <td>2022-10-31</td>
			                        </tr>
			                        <tr>
			                            <th scope="row">4</th>
			                            <td>답변전</td>
			                            <td>문의사항있어요</td>
			                            <td>김**</td>
			                            <td>2022-10-31</td>
			                        </tr>
			                        <tr>
			                            <th scope="row">3</th>
			                            <td>답변완료</td>
			                            <td>문의사항있어요</td>
			                            <td>김**</td>
			                            <td>2022-10-31</td>
			                        </tr>
			                        <tr>
			                            <th scope="row">2</th>
			                            <td>답변완료</td>
			                            <td>문의사항있어요</td>
			                            <td>김**</td>
			                            <td>2022-10-31</td>
			                        </tr>
			                        <tr>
			                            <th scope="row">1</th>
			                            <td>답변완료</td>
			                            <td>문의사항있어요</td>
			                            <td>김**</td>
			                            <td>2022-10-31</td>
			                        </tr>
			                    </tbody>
			                </table>
			            </div>
			            <!-- end project-list -->
			            <div class="pt-3">
			                <!-- 검색창 -->
			                <ul class="pagination justify-content-end mb-0">
			                    <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search" action="genre">
			                        <input type="search" class="form-control" name="search" placeholder="Search..." aria-label="Search" onclick="frm.submit()">
			                    </form>
			
			                    <li class="page-item disabled">
			                        <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
			                    </li>
			                    <li class="page-item"><a class="page-link" href="#">1</a></li>
			                    <li class="page-item active"><a class="page-link" href="#">2</a></li>
			                    <li class="page-item"><a class="page-link" href="#">3</a></li>
			                    <li class="page-item">
			                        <a class="page-link" href="#">Next</a>
			                    </li>
			                </ul>
			            </div>
			            <!-- end row -->
			        </div>
			    </div><!-- 탭 컨텐츠 end -->
			</div><!-- 탭 end-->
			
		</div><!-- 컨텐츠영역 end-->
	</section>
	<!--페이지 내용 종료-->

	<!--푸터 인클루드-->
	<%@ include file="footer.jsp"%>
</body>
</html>