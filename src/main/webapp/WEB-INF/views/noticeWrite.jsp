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
		<h1 class="visually-hidden">고객센터</h1>
		<!--컨텐츠 영역-->
		<div class="w-75 mx-auto justify-contents-center">
			<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
			  <ol class="breadcrumb fs-6 mt-4">
			    <li class="breadcrumb-item"><a href="/purplaying/servicecenter">고객센터</a></li>
			    <li class="breadcrumb-item"><a href="/purplaying/notice">공지사항</a></li>
			    <li class="breadcrumb-item active" aria-current="page">공지사항 작성하기</li>
			  </ol>
			</nav>
        	<h2 class="mx-auto text-center py-3">공지사항 작성하기</h2>
      	</div>
		<div class="w-75 mx-auto">
			<!-- 상단영역(제목,작성자,공개여부) -->
			<table class="table project-table table-centered bg-light border-top border-2">
				<tbody>
				  <tr>
				    <th scope="col">제목</th>
				    <td scope="col" class="col-2">
	              		<select class="form-select fs-6" id="noticeCate" name="noticeCate">
						  	<option selected>카테고리</option>
						 	<option value="1">공지사항</option>
						  	<option value="2">이벤트</option>
						  	<option value="3">기타</option>
						</select>
				    </td>
				    <td>
  						<input type="text" class="form-control" placeholder="제목을 입력하세요">
				    </td>
				  </tr>
				  <tr>
				    <th scope="col">작성자</th>
				    <td colspan="2">
  						<input type="text" class="form-control" placeholder="관리자" readonly>
				    </td>
				  </tr>
				  <tr>
				    <th scope="col">공개여부</th>
				    <td colspan="2">
  						<input class="form-check-input" name="flexRadioDefault" type="radio"> <label>공개</label>
  						<input class="form-check-input" name="flexRadioDefault" type="radio"> <label>비공개</label>
				    </td>
				  </tr>
				</tbody>
			</table>
			<!-- 글작성 영역 summernote -->
			<div style="height: 500px;">
				<textarea id="summernote" placeholder="내용을 입력하세요​"></textarea>
			</div>

				<div class="text-end my-5">
					<button class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#noticeWriteCancelModal">작성취소</button>
					<!-- 작성취소 모달창 start -->
					<div class="modal fade" id="noticeWriteCancelModal" tabindex="-1"
						aria-labelledby="noticeWriteCancelModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="noticeWriteCancelModalLabel">작성 취소</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body text-center">
									<h6 class="form-label">공지사항 작성을 취소하시겠습니까?</h6>
									<p>[확인]버튼 클릭시 작성중인 글은 저장되지 않습니다.</p>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal" aria-label="Close" onclick="location.href='servicecenter'">확인</button>
								</div>
							</div>
						</div>
					</div>
					<!-- 작성취소 모달창 end -->
					<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#noticeWriteFinishModal">게 시</button>
					<div class="modal fade" id="noticeWriteFinishModal" aria-labelledby="noticeWriteFinishModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="noticeWriteFinishLabel">작성 완료</h5>
								</div>
								<div class="modal-body text-center">
									<label class="form-label">공지사항 등록완료</label>
									<div class="invalid-feedback">공지사항 등록이 완료되었습니다.</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close" onclick="location.href='servicecenter'">확인</button>
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
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
			  disableResizeEditor: true,	// 크기 조절 기능 삭제
			  toolbar: [
				    // [groupName, [list of button]]
				    ['fontname', ['fontname']],
				    ['fontsize', ['fontsize']],
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    ['color', ['forecolor','color']],
				    ['table', ['table']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['height', ['height']],
				    ['insert',['picture','link','video']],
				    ['view',['help']]
				  ]
				
		});
	});
	</script>
	<!--푸터 인클루드-->
	<%@ include file="footer.jsp"%>
</body>
</html>