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
		<!--컨텐츠 영역-->
		<div class="row justify-content-md-center">
        	<h2 class="col-auto my-5">고객센터</h2>
      	</div>
		<div class="container mb-5">
			<div class="mb-4"> <!-- 탭 start-->
			    <div class="nav nav-tabs nav-justified" id="v-pills-tab" role="tablist"> <!-- 탭 menu start-->
			      <button class="nav-link active" id="v-pills-01-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab01" type="button" role="tab" aria-controls="v-pills-tab01" aria-selected="true">공지사항</button>
			      <button class="nav-link" id="v-pills-02-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab02" type="button" role="tab" aria-controls="v-pills-tab02" aria-selected="false">자주 묻는 질문</button>
			      <button class="nav-link" id="v-pills-03-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab03" type="button" role="tab" aria-controls="v-pills-tab03" aria-selected="false">1:1 문의</button>
			    </div><!-- 탭 menu end-->
				<div class="row col-10 justify-content-center mx-auto"><!-- 탭 컨텐츠 start -->
				      <div class="tab-content" id="v-pills-tabContent">
				        <!-- tab 1 contents -->
				        <div class="tab-pane fade show active" id="v-pills-tab01" role="tabpanel" aria-labelledby="v-pills-tab01-tab">
				            <div class="row justify-content-end mt-4">
					            <form class=" col-lg-auto mb-5 mb-lg-0 me-lg-3" role="search" action="genre">
					            	<input type="search" class="form-control" name="search" placeholder="Search..." aria-label="Search" onclick="frm.submit()">
					           	</form>
				                <table class="table project-table table-centered table-nowrap table-hover">
				                    <thead class="border-3 border-bottom">
				                        <tr>
				                            <th scope="col">#</th>
				                            <th scope="col">카테고리</th>
				                            <th scope="col">제목</th>
				                            <th scope="col">작성자</th>
				                            <th scope="col">작성일</th>
				                        </tr>
				                    </thead>
				                    <tbody>
				                        <tr>
				                            <th scope="row">5</th>
				                            <td>이벤트</td>
				                            <td><a href="/purplaying/notice">퍼플레잉 오픈했습니다.퍼플레잉 오픈했습니다.퍼플레잉 오픈했습니다.</a></td>
				                            <td>관리자</td>
				                            <td>2022-01-11</td>
				                        </tr>
				                        <tr>
				                            <th scope="row">4</th>
				                            <td>이벤트</td>
				                            <td><a href="/purplaying/notice">퍼플레잉 오픈했습니다.퍼플레잉 오픈했습니다.퍼플레잉 오픈했습니다.</a></td>
				                            <td>관리자</td>
				                            <td>2022-01-11</td>
				                        </tr>
				                        <tr>
				                            <th scope="row">3</th>
				                            <td>공지사항</td>
				                            <td><a href="/purplaying/notice">퍼플레잉 오픈했습니다.퍼플레잉 오픈했습니다.퍼플레잉 오픈했습니다.</a></td>
				                            <td>관리자</td>
				                            <td>2022-01-11</td>
				                        </tr>
				                        <tr>
				                            <th scope="row">2</th>
				                            <td>공지사항</td>
				                            <td><a href="/purplaying/notice">퍼플레잉 오픈했습니다.퍼플레잉 오픈했습니다.퍼플레잉 오픈했습니다.</a></td>
				                            <td>관리자</td>
				                            <td>2022-01-11</td>
				                        </tr>
				                        <tr>
				                            <th scope="row">1</th>
				                            <td>공지사항</td>
				                            <td><a href="/purplaying/notice">퍼플레잉 오픈했습니다.퍼플레잉 오픈했습니다.퍼플레잉 오픈했습니다.</a></td>
				                            <td>관리자</td>
				                            <td>2022-01-11</td>
				                        </tr>
				                    </tbody>
				                </table>
				            </div>
				            <!-- end project-list -->
				            <div class="pt-3 row">
				                <!-- 검색창 -->
				                <div class="col-1"></div>
				                <ul class="pagination mb-0 col-10 justify-content-center">
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
								<button type="button" class="col-1 btn btn-primary">작성</button>
				            </div>
				            <!-- end row -->
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
				            <div class="row justify-content-end mt-4">
					            <form class=" col-lg-auto mb-5 mb-lg-0 me-lg-3" role="search" action="genre">
					            	<input type="search" class="form-control" name="search" placeholder="Search..." aria-label="Search" onclick="frm.submit()">
					           	</form>
					         
				                <table class="col-12 table project-table table-centered table-nowrap">
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
				            <div class="pt-3 row">
				                <!-- 검색창 -->
				                <div class="col-1"></div>
				                <ul class="pagination mb-0 col-10 justify-content-center">
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
								<button type="button" class="col-1 btn btn-primary">작성</button>
							
				            </div>
				            <!-- end row -->
				        </div>
				      </div><!-- 탭 컨텐츠 end -->
				</div><!-- 탭 end-->
			</div>
		</div><!-- 컨텐츠영역 end-->
	</section>
	<!--페이지 내용 종료-->

	<!--푸터 인클루드-->
	<%@ include file="footer.jsp"%>
</body>
</html>