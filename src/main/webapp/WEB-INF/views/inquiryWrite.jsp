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
		<div class="container col-8">
			<h3>1 : 1 문의 등록</h3>
			<div class="form-control mb-3 px-4">
				<div class="row py-3">
					<textarea class="form-control" placeholder="제목을 입력하세요​"
						style="resize: none;"></textarea>
				</div>
				<div class="row" style="height: 500px;">
					<textarea class="form-control" placeholder="내용을 입력하세요​"
						style="resize: none;"></textarea>
				</div>
				<div class="row">
					<div class="col-10 text-end">
						<p>공개 여부</p>
					</div>
					<div class="col-2 text-end">

						<div class="form-check">
							<input class="form-check-input" name="flexRadioDefault"
								type="radio"> <label>공개</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" name="flexRadioDefault"
								type="radio"> <label>비공개</label>
						</div>
					</div>
				</div>
				<div class="text-end">
					<button class="btn btn-primary px-4">취 소</button>
					<button class="btn btn-primary px-4" onclick="location.href='serviceCenter.jsp'">게 시</button>
				</div>
			</div>
		</div>
	</section>
	<!--페이지 내용 종료-->
	<!--푸터 인클루드-->
	<%@ include file="footer.jsp"%>
</body>
</html>