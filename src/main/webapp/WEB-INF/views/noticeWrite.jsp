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
		<div class="container my-3 col-8">
			<div class="border rounded">
				<div class="bg-light border-bottom d-flex">
					<span class="col-auto px-1 border-right mx-2">10</span> <span
						class="col-8 border-right">공지 사항 있어요</span>
					<div class="col-3 text-end">

						<span class="col-3 text-end">admin</span> <span
							class="col-4 text-end">공개</span> <span class="col-5 text-end">2022.9.30</span>

					</div>
				</div>
				<div class="mb-2 border-bottom">
					<div class="mb-5 mx-2">공지 사항 제목</div>
				</div>
				<div class="py-2 mx-2">
					<textarea class="form-control" placeholder="내용을 입력하세요​" rows="20px"
						style="resize: none;"></textarea>
				</div>

				<div class="text-end">
					<div class="py-3 px-2">
						<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#AnswerCancelModal">취 소</button>
					<div class="modal fade" id="AnswerCancelModal" tabindex="-1"
						aria-labelledby="AnswerCancelModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="AnswerCancelModalLabel">작성 취소</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body text-center">
									<label class="form-label">공지사항 작성을 취소하시겠습니까?</label>
									<div class="invalid-feedback">Please enter your shipping address.</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close" onclick="location.href='servicecenter'">확인</button>
								</div>
							</div>
						</div>
					</div>
					<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#AnswerFinishModal">게 시</button>
					<div class="modal fade" id="AnswerFinishModal" tabindex="-1"
						aria-labelledby="AnswerFinishModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="AnswerFinishModalLabel">작성 완료</h5>
								</div>
								<div class="modal-body text-center">
									<label class="form-label">공지사항 등록 등록완료</label>
									<div class="invalid-feedback">Please enter your shipping address.</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close" onclick="location.href='servicecenter'">확인</button>
								</div>
							</div>
						</div>
					</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--페이지 내용 종료-->

	<!--푸터 인클루드-->
	<%@ include file="footer.jsp"%>
</body>