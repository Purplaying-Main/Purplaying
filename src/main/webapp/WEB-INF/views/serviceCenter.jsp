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
		<div class="container">
			<h1 class="text-start">고객센터</h1>
			<div class="mb-4">
				<!-- 탭 start-->
				<div class="nav nav-tabs nav-justified" id="v-pills-tab"
					role="tablist">
					<!-- 탭 menu start-->
					<button class="nav-link active" id="v-pills-home-tab"
						data-bs-toggle="pill" data-bs-target="#v-pills-tab01"
						type="button" role="tab" aria-controls="v-pills-tab01"
						aria-selected="true">공지 사항</button>
					<button class="nav-link" id="v-pills-profile-tab"
						data-bs-toggle="pill" data-bs-target="#v-pills-tab02"
						type="button" role="tab" aria-controls="v-pills-tab02"
						aria-selected="false">자주 묻는 질문</button>
					<button class="nav-link" id="v-pills-messages-tab"
						data-bs-toggle="pill" data-bs-target="#v-pills-tab03"
						type="button" role="tab" aria-controls="v-pills-tab03"
						aria-selected="false">1:1 문의</button>
				</div>
				<!-- 탭 menu end-->
				<div class="row container mb-4 px-5">
					<!-- 탭 컨텐츠 start -->
					<div class="tab-content align-items-center" id="v-pills-tabContent">
						<!-- tab 1 contents -->
						<div class="tab-pane fade show active" id="v-pills-tab01"
							role="tabpanel" aria-labelledby="v-pills-tab01-tab">
							<div class="mt-5">
								<div class="row py-3">
									<div>
										<div id="submain">
											<h3 id="notice">
												<i class="fas fa-bullhorn" id="a3"></i><b>공지 사항</b>
											</h3>
											<hr />
											<!--문의 테이블 -->
											<table class="table table-hover"
												style="border-top: 2px solid black; border-bottom: 2px solid black;">
												<thead id="noticehead">
													<tr>
														<th>No.</th>
														<th>제목</th>
														<th>작성자</th>
														<th>등록일</th>
													</tr>
												</thead>
												<tbody id="ntbody">
													<tr onclick="location.href='notice'">
														<td>00</td>
														<td>[공지사항]공지 사항 있어요</td>
														<td>admin</td>
														<td>2022.09.30</td>
													</tr>
												</tbody>
												<tbody id="ntbody">
													<tr onclick="location.href='notice'">
														<td>00</td>
														<td>[공지사항]공지 사항 있어요</td>
														<td>admin</td>
														<td>2022.09.30</td>
													</tr>
												</tbody>
												<tbody id="ntbody">
													<tr onclick="location.href='notice'">
														<td>00</td>
														<td>[공지사항]공지 사항 있어요</td>
														<td>admin</td>
														<td>2022.09.30</td>
													</tr>
												</tbody>
												<tbody id="ntbody">
													<tr onclick="location.href='notice'">
														<td>00</td>
														<td>[공지사항]공지 사항 있어요</td>
														<td>admin</td>
														<td>2022.09.30</td>
													</tr>
												</tbody>
												<tbody id="ntbody">
													<tr onclick="location.href='notice'">
														<td>00</td>
														<td>[공지사항]공지 사항 있어요</td>
														<td>admin</td>
														<td>2022.09.30</td>
													</tr>
												</tbody>
												<tbody id="ntbody">
													<tr onclick="location.href='notice'">
														<td>00</td>
														<td>[공지사항]공지 사항 있어요</td>
														<td>admin</td>
														<td>2022.09.30</td>
													</tr>
												</tbody>
											</table>
											<!--각 페이지별 번호 부분 (맨 아래)-->
											<div class="row">
												<div class="col-1"></div>
												<div class='page text-center col-10' id="pagination modal">
													<a href="#" class="first">처음 페이지</a> <a href='javascript:'
														class='arrow left'><span>←</span></a> <span
														class='invisible' id="active num">현재</span><strong>
														1</strong><span class='invisible'>페이지</span> <a href="#"
														class="num">2</a><span class='invisible'>페이지</span> <a
														href="#" class="num">3</a><span class='invisible'>페이지</span>
													<a href="#" class="num">4</a><span class='invisible'>페이지</span>
													<a href="#" class="num">5</a><span class='invisible'>페이지</span>
													<a href="#" class="num">6</a><span class='invisible'>페이지</span>
													<a href="#" class="num">7</a><span class='invisible'>페이지</span>
													<a href="#" class="num">8</a><span class='invisible'>페이지</span>
													<a href="#" class="num">9</a><span class='invisible'>페이지</span>
													<a href="#" class="num">10</a><span class='invisible'>페이지</span>
													<a href="#" class='arrow right'><span>→</span></a> <a
														href="#" class="last">끝 페이지</a>
												</div>
												<div class="col-1"></div>
												<div class='inpage search mt-4 text-center'>
													<input name="search_str" id="textfield" value=""
														title="선택한 검색어 입력란" class="stxt" style="width: 25%;"
														type="text" maxlength="50" value="" /> <input
														class="btn_rgray a_h30" id="btn_retrieve"
														onclick="frm.submit()" type="button" value="검색" />
												</div>
											</div>
											<br />
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- tab 2 contents -->
						<div class="tab-pane fade" id="v-pills-tab02" role="tabpanel"
							aria-labelledby="v-pills-tab02-tab">
							<h3 id="notice">
								<i class="fas fa-bullhorn mt-5 py-3" id="a3"></i><b>자주 묻는 질문</b>
							</h3>
							<div id="best" class="mt-2">
								<!--자주 묻는 질문 탭 시작-->
								<div class="tab-pane" id="2a">
									<div>
										<div class=" text-start">
											<!-- 아코디언 클래스 -->
											<div class="accordion accordion-flush"
												id="accordionFlushExample">
												<div class="accordion-item">
													<h5 class="accordion-header" id="flush-heading1">
														<button class="accordion-button collapsed" type="button"
															data-bs-toggle="collapse"
															data-bs-target="#flush-collapse1" aria-expanded="false"
															aria-controls="flush-collapseOne">
															<b>Q.</b> <b>배송일자는 어떻게 되나요?</b>
														</button>
														</h2>
														<!--아코디언 아이템1 시작-->
														<div id="flush-collapse1"
															class="accordion-collapse collapse text-start"
															aria-labelledby="flush-heading1"
															data-bs-parent="#accordionFlushExample">
															<div class="row">
																<div class="accordion-body col-11">
																	<p class="p-3">배송일자는 펀딩에 따라 상이합니다. 판매자에게 문의해주세요</p>
																</div>
																<hr class="mb-0">
															</div>
														</div>
														<!--아코디언 아이템1 종료-->
												</div>
												<div class="accordion-item">
													<h5 class="accordion-header" id="flush-heading2">
														<button class="accordion-button collapsed" type="button"
															data-bs-toggle="collapse"
															data-bs-target="#flush-collapse2" aria-expanded="false"
															aria-controls="flush-collapseOne">
															<b>Q.</b> <b>배송 업체를 변경 할 수 있나요?</b>
														</button>
														</h2>
														<!--아코디언 아이템2 시작-->
														<div id="flush-collapse2"
															class="accordion-collapse collapse text-start"
															aria-labelledby="flush-heading2"
															data-bs-parent="#accordionFlushExample">
															<div class="row">
																<div class="accordion-body col-11">
																	<p class="p-3">판매자에게 문의하세요</p>
																</div>
																<hr class="mb-0">
															</div>
														</div>
														<!--아코디언 아이템2 종료-->
												</div>
												<div class="accordion-item">
													<h5 class="accordion-header" id="flush-heading3">
														<button class="accordion-button collapsed" type="button"
															data-bs-toggle="collapse"
															data-bs-target="#flush-collapse3" aria-expanded="false"
															aria-controls="flush-collapseOne">
															<b>Q.</b> <b>펀딩을 했는데 결제가 되지 않았습니다?</b>
														</button>
														</h2>
														<!--아코디언 아이템3 시작-->
														<div id="flush-collapse3"
															class="accordion-collapse collapse text-start"
															aria-labelledby="flush-heading3"
															data-bs-parent="#accordionFlushExample">
															<div class="row">
																<div class="accordion-body col-11">
																	<p class="p-3">펀딩 결제는 펀딩이 끝난 후 익일에 결제됩니다</p>
																</div>
																<hr class="mb-0">
															</div>
														</div>
														<!--아코디언 아이템3 종료-->
												</div>
												<div class="accordion-item">
													<h5 class="accordion-header" id="flush-heading4">
														<button class="accordion-button collapsed" type="button"
															data-bs-toggle="collapse"
															data-bs-target="#flush-collapse4" aria-expanded="false"
															aria-controls="flush-collapseOne">
															<b>Q.</b> <b>교환은 어떻게 되나요?</b>
														</button>
														</h2>
														<!--아코디언 아이템3 시작-->
														<div id="flush-collapse4"
															class="accordion-collapse collapse text-start"
															aria-labelledby="flush-heading4"
															data-bs-parent="#accordionFlushExample">
															<div class="row">
																<div class="accordion-body col-11">
																	<p class="p-3">안해줍니다</p>
																</div>
																<hr class="mb-0">
															</div>
														</div>
														<!--아코디언 아이템4 종료-->
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--자주 묻는 질문 탭 종료-->
						</div>
						<!-- tab 3 contents -->
						<div class="tab-pane fade" id="v-pills-tab03" role="tabpanel"
							aria-labelledby="v-pills-tab03-tab">
							<div class="mt-5">
								<div class="row py-3">
									<div>
										<div id="submain">
											<h3 id="notice">
												<i class="fas fa-bullhorn" id="a3"></i><b>1:1 문의</b>
											</h3>
											<hr />
											<!--문의 테이블 -->
											<table class="table table-hover"
												style="border-top: 2px solid black; border-bottom: 2px solid black;">
												<thead id="noticehead">
													<tr>
														<th>No.</th>
														<th>제목</th>
														<th>작성자</th>
														<th>공개여부</th>
														<th>등록일</th>
													</tr>
												</thead>
												<tbody id="ntbody">
													<tr onclick="location.href='showinquiry'">
														<td>00</td>
														<td>[답변전]문의 사항 있어요</td>
														<td>이**</td>
														<td>비공개</td>
														<td>2022.09.30</td>
													</tr>
												</tbody>
												<tbody id="ntbody">
													<tr onclick="location.href='showinquiry'">
														<td>00</td>
														<td>[답변전]문의 사항 있어요</td>
														<td>김**</td>
														<td>비공개</td>
														<td>2022.09.30</td>
													</tr>
												</tbody>
												<tbody id="ntbody">
													<tr onclick="location.href='showinquiry'">
														<td>00</td>
														<td>[답변전]문의 사항 있어요</td>
														<td>김**</td>
														<td>비공개</td>
														<td>2022.09.30</td>
													</tr>
												</tbody>
												<tbody id="ntbody">
													<tr onclick="location.href='showinquiry'">
														<td>00</td>
														<td>[답변전]문의 사항 있어요</td>
														<td>한**</td>
														<td>비공개</td>
														<td>2022.09.30</td>
													</tr>
												</tbody>
												<tbody id="ntbody">
													<tr onclick="location.href='showinquiry'">
														<td>00</td>
														<td>[답변전]문의 사항 있어요</td>
														<td>김**</td>
														<td>비공개</td>
														<td>2022.09.30</td>
													</tr>
												</tbody>
												<tbody id="ntbody">
													<tr onclick="location.href='showinquiry'">
														<td>00</td>
														<td>[답변전]문의 사항 있어요</td>
														<td>김**</td>
														<td>비공개</td>
														<td>2022.09.30</td>
													</tr>
												</tbody>
											</table>
											<!--각 페이지별 번호 부분 (맨 아래)-->
											<div class="row">
												<div class="col-1"></div>
												<div class='page text-center col-10' id="pagination modal">
													<a href="pf" class="first">처음 페이지</a> <a href='javascript:'
														class='arrow left'><span>←</span></a> <span
														class='invisible' id="active num">현재</span><strong>
														1</strong><span class='invisible'>페이지</span> <a href="#"
														class="active num button"
														onclick="location.href='1대1문의(merge)2번페이지 보이기용.html?'">2</a><span
														class='invisible'>페이지</span> <a href="#"
														class="active num button"
														onclick="location.href='1대1문의(merge)3번페이지 보이기용.html?'">3</a><span
														class='invisible'>페이지</span> <a href="#" class="num">4</a><span
														class='invisible'>페이지</span> <a href="#" class="num">5</a><span
														class='invisible'>페이지</span> <a href="#" class="num">6</a><span
														class='invisible'>페이지</span> <a href="#" class="num">7</a><span
														class='invisible'>페이지</span> <a href="#" class="num">8</a><span
														class='invisible'>페이지</span> <a href="#" class="num">9</a><span
														class='invisible'>페이지</span> <a href="#" class="num">10</a><span
														class='invisible'>페이지</span> <a href="#"
														class='arrow right'><span>→</span></a> <a href="#"
														class="last">끝 페이지</a>
												</div>
												<div class="col-1">
													<button class="btn btn-primary text-end"
														style="float: right;"
														onclick="location.href='inquirywrite'">등 록</button>
												</div>
											</div>
											<div class='inpage search mt-4 text-center'>
												<span class="select sel_s" id="sctxt01"> <select
													name="search" id="select" title="검색종류 선택">
														<option value="title">제목</option>
														<option value="name">작성자</option>
												</select>
												</span> <input name="search_str" id="textfield" value=""
													title="선택한 검색어 입력란" class="stxt" style="width: 25%;"
													type="text" maxlength="50" value="" /> <input
													class="btn_rgray a_h30" id="btn_retrieve"
													onclick="frm.submit()" type="button" value="검색" />
											</div>
										</div>
										<br />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 탭 컨텐츠 end -->
			</div>
			<!-- 탭 end-->
	</section>
	<!--페이지 내용 종료-->

	<!--푸터 인클루드-->
	<%@ include file="footer.jsp"%>
</body>
</html>