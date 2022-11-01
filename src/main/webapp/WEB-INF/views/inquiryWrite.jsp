<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- meta태그, CSS, JS, 타이틀 인클루드  -->
<%@ include file="meta4.jsp"%>
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
					<textarea id="summernote" placeholder="내용을 입력하세요​"
						></textarea>
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
					<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#inquiryWriteCancelModal">취 소</button>
					<div class="modal fade" id="inquiryWriteCancelModal" tabindex="-1"
						aria-labelledby="inquiryWriteCancelModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="inquiryWriteCancelModalLabel">작성 취소</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body text-center">
									<label class="form-label">1대1 문의 작성을 취소하시겠습니까?</label>
									<div class="invalid-feedback">Please enter your shipping address.</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close" onclick="location.href='oneonone'">확인</button>
								</div>
							</div>
						</div>
					</div>
					<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#inquiryWriteFinishModal">게 시</button>
					<div class="modal fade" id="inquiryWriteFinishModal" tabindex="-1"
						aria-labelledby="inquiryWriteFinishModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="inquiryWriteFinishLabel">작성 완료</h5>
								</div>
								<div class="modal-body text-center">
									<label class="form-label">1대1 문의 등록완료</label>
									<div class="invalid-feedback">Please enter your shipping address.</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close" onclick="location.href='oneonone'">확인</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--페이지 내용 종료-->
	<script>
		$(document).ready(function() {
			//여기 아래 부분
			$('#summernote').summernote({
				  height: 445,                 // 에디터 높이
				  minHeight: 445,             // 최소 높이
				  maxHeight: 445,             // 최대 높이
				  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
				  lang: "ko-KR",					// 한글 설정
				  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
		          
			});
		});
	</script>
	<!--푸터 인클루드-->
	<%@ include file="footer.jsp"%>
</body>
</html>