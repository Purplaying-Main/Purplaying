<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<h1 class="visually-hidden">고객센터</h1>
		<!--컨텐츠 영역-->
		<div class="w-75 mx-auto justify-contents-center">
			<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
			  <ol class="breadcrumb fs-6 mt-4">
			    <li class="breadcrumb-item"><a href="/purplaying/servicecenter">고객센터</a></li>
			    <li class="breadcrumb-item"><a href="/purplaying/oneonone/list">1:1문의</a></li>
			    <li class="breadcrumb-item active" aria-current="page">1:1 문의하기 ${mode=="new" ? "작성하기" : "수정하기" }</li></li>
			  </ol>
			</nav>
        	<h2 class="mx-auto text-center py-3">1:1 문의하기 ${mode=="new" ? "작성하기" : "수정하기" }</h2>
      	</div>
      		<form class="w-75 mx-auto" id="form" action="" method="post">
      		<input type="hidden" name="inquiry_no" value="${oneononeDto.inquiry_no }">
			<!-- 상단영역(제목,작성자,공개여부) -->
			<table class="table project-table table-centered bg-light border-top border-2">
				<tbody>
				  <tr>
				    <th scope="col">제목</th>
				    <td>
  						<input type="text" class="form-control" placeholder="제목을 입력하세요" name="inquiry_title" value="${oneononeDto.inquiry_title}">
				    </td>
				  </tr>
				  <tr>
				    <th scope="col">작성자</th>
				    <td>
  						<input type="text" class="form-control" placeholder="${oneononeDto.user_id }" readonly>
				    </td>
				  </tr>
				  <tr>
				    <th scope="col">공개여부</th>
				    <td>
  						<input class="form-check-input" name="inquiry_private" type="radio" value="${oneononeDto.inquiry_private = true}" checked> <label>공개</label>
  						<input class="form-check-input" name="inquiry_private" type="radio" value="${oneononeDto.inquiry_private = false}"> <label>비공개</label>
				    </td>
				  </tr>
				</tbody>
			</table>
			<!-- 글작성 영역 summernote -->
			<div style="height: 500px;">
				<textarea class="summernote" placeholder="내용을 입력하세요​" name="inquiry_context">${oneononeDto.inquiry_context}></textarea>
			</div>

				<div class="text-end my-5">
					<button class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#inquiryWriteCancelModal">작성취소</button>
					<!-- 작성취소 모달창 start -->
					<div class="modal fade" id="inquiryWriteCancelModal" tabindex="-1"
						aria-labelledby="inquiryWriteCancelModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="inquiryWriteCancelModalLabel">작성 취소</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body text-center">
									<h6 class="form-label">1대1 문의 작성을 취소하시겠습니까?</h6>
									<p>[확인]버튼 클릭시 작성중인 글은 저장되지 않습니다.</p>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal" aria-label="Close" onclick="location.href='oneonone'">확인</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 작성취소 모달창 end -->
					<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#inquiryWriteFinishModal">게 시</button>
					<div class="modal fade" id="inquiryWriteFinishModal" aria-labelledby="inquiryWriteFinishModalLabel" aria-hidden="true">
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
		</form>
	</section>
	<!--페이지 내용 종료-->
	
	<!--푸터 인클루드-->
	<%@ include file="footer.jsp"%>
	
		<script type="text/javascript">
		$("#writeBtn").on("click", function() {
			let form = $("#form");
			form.attr("action", "<c:url value='/oneonone/write/reg' />")
			form.attr("method", "post")
			
			if(formCheck())
				form.submit()					
		})
		
		let formCheck = function() {
			let form = document.getElementById("form")
			if(form.inquiry_title.value=="") {
				alert("제목을 입력해 주세요.")
				form.title.focus()
				return false
			}
			if(form.inquiry_context.value=="") {
				alert("내용을 입력해 주세요.")
				form.notice_context.focus()
				return false
			}
			return true;
		}
	</script>
</body>
</html>