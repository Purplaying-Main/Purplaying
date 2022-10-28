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
		<!-- 프로젝트 작성 페이지 탭 -->
		<div class="container mb-3 col-8">
			<div class="border rounded">
				<div class="bg-light border-bottom d-flex">1
					<span class="col-auto px-1 border-right mx-2">10</span> <span
						class="col-8 border-right">[답변완료] 문의 사항 있어요</span>
					<div class="col-3 text-end">

						<span class="col-3 text-end">김**</span> <span
							class="col-4 text-end">비공개</span> <span class="col-5 text-end">2022.9.30</span>

					</div>
				</div>
				<div class="mb-5">
					<div class="mb-5 mx-2">문의 내용</div>
				</div>

				<div class="mb-5 border-top">
					<div class="mb-5 mx-2">답변 내용</div>
				</div>
			</div>
		</div>
	</section>
	<!--페이지 내용 종료-->

	<!--푸터 인클루드-->
	<%@ include file="footer.jsp"%>
</body>