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
			    <div class="nav nav-tabs nav-justified"> <!-- 탭 menu start-->
			      <button class="nav-link" aria-selected="false" onclick="location.href='/purplaying/notice/list'">공지사항</button>
			      <button class="nav-link active" aria-selected="true">자주 묻는 질문</button>
			      <button class="nav-link" aria-selected="false" onclick="location.href='/purplaying/oneonone/list'">1:1 문의</button>
			    </div><!-- 탭 menu end-->
				<div class="row col-10 justify-content-center mx-auto"><!-- 탭 컨텐츠 start -->
				        <div>
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
				</div><!-- 탭 end-->
			</div>
		</div><!-- 컨텐츠영역 end-->
	</section>
	<!--페이지 내용 종료-->

	<!--푸터 인클루드-->
	<%@ include file="footer.jsp"%>
</body>
</html>