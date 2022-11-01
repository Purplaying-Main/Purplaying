<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
	<!-- meta태그, CSS, JS, 타이틀 인클루드  -->
	<%@ include file="meta.jsp"%>
	<link rel="stylesheet" href="resources/assets/css/indexHover.css">
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
				<div class="mb-4">
					<!-- 탭 start-->
					<div class="nav nav-tabs nav-justified" id="v-pills-tab"
						role="tablist">
						<!-- 탭 menu start-->
						<button class="nav-link" aria-selected="false" onclick="location.href='servicecenter'">공지사항</button>
						<button class="nav-link" aria-selected="false"onclick="location.href='questions'">자주 묻는 질문</button>
						<button class="nav-link active" aria-selected="true">1:1 문의</button>
					</div>
					<!-- 탭 menu end-->
					<div class="row col-10 justify-content-center mx-auto">
						<div>
							<div class="row justify-content-end mt-4">
								<form class=" col-lg-auto mb-5 mb-lg-0 me-lg-3" role="search" action="genre">
									<input type="search" class="form-control" name="search"	placeholder="Search..." aria-label="Search"
										onclick="frm.submit()">
								</form>


								<table class="table project-table table-centered table-nowrap table-hover">
									<thead class="border-3 border-bottom">
										<tr>
											<th scope="col">#</th>
											<th scope="col">답변상태</th>
											<th scope="col">제목</th>
											<th scope="col">작성자</th>
											<th scope="col">공개여부</th>
											<th scope="col">작성일</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">5</th>
											<td>답변전</td>
											<td class="oneDetail" onclick="location.href='showinquiry'">문의사항있어요</td>
											<td>김**</td>
											<td>공개</td>
											<td>2022-10-31</td>
										</tr>
										<tr>
											<th scope="row">4</th>
											<td>답변전</td>
											<td class="oneDetail" onclick="location.href='showinquiry'">문의사항있어요</td>
											<td>김**</td>
											<td>비공개</td>
											<td>2022-10-31</td>
										</tr>
										<tr>
											<th scope="row">3</th>
											<td>답변완료</td>
											<td class="oneDetail" onclick="location.href='showinquiry'">문의사항있어요</td>
											<td>김**</td>
											<td>비공개</td>
											<td>2022-10-31</td>
										</tr>
										<tr>
											<th scope="row">2</th>
											<td>답변완료</td>
											<td class="oneDetail" onclick="location.href='showinquiry'">문의사항있어요</td>
											<td>김**</td>
											<td>공개</td>
											<td>2022-10-31</td>
										</tr>
										<tr>
											<th scope="row">1</th>
											<td>답변완료</td>
											<td class="hover" id="oneDetail" onclick="location.href='showinquiry'">문의사항있어요</td>
											<td>김**</td>
											<td>비공개</td>
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
									<li class="page-item disabled"><a class="page-link"
										href="#" tabindex="-1" aria-disabled="true">Previous</a></li>
									<li class="page-item active"><a class="page-link" href="#">1</a></li>
									<li class="page-item"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#">Next</a>
									</li>
								</ul>
								<button type="button" class="col-1 btn btn-primary" onclick="location.href='inquirywrite'">작성</button>
	
							</div>
							<!-- end row -->
						</div>
	
					</div>
					<!-- 탭 end-->
				</div>
			</div>
			<!-- 컨텐츠영역 end-->
		</section>
		<!--페이지 내용 종료-->
	
		<!--푸터 인클루드-->
		<%@ include file="footer.jsp"%>
	</body>
	</html>