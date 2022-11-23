<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <!-- meta태그, CSS, JS, 타이틀 인클루드  -->
  <%@ include file ="meta4.jsp" %>
</head>

<body>
   <!--헤더 인클루드-->
   <%@ include file ="header.jsp" %>
   
   <!--페이지 내용 시작-->
   <section>
     <h1 class="visually-hidden">HOME</h1>
   	 <div class="contentsWrap col-10 mx-auto">
      <!--컨텐츠 영역-->
      <div class="row justify-content-md-center">
	      <nav class="row justify-content-start" style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
				  <ol class="breadcrumb fs-6 mt-4">
				    <li class="breadcrumb-item"><a href="/purplaying/mypage">마이페이지 </a></li>
				    <li class="breadcrumb-item active" aria-current="page">프로젝트 기획 ${mode=="new" ? "작성하기" : "수정하기" }</li>
				  	<li class="breadcrumb-item text-muted">${mode=="new" ? "" : "작성중인 펀딩번호 prdt_id : "}${projectDto.prdt_id}</li>
				  </ol>
		  </nav>
		  <div class="row justify-content-end">
		  	<div class="btn-group col-4" role="group" aria-label="register-controll-btn"><!-- 컨트롤 버튼그룹 start-->  
			  <button class="btn btn-outline-primary btn-sm" type="button" id="previewBtn">미리보기</button>
			  <button class="btn btn-outline-primary btn-sm" type="button" id="modifyAllBtn">저장</button>
			  <button class="btn btn-outline-danger btn-sm" type="button" data-bs-toggle="modal" data-bs-target="#prjDelModal">삭제</button>
			  <button class="btn btn-primary btn-sm" type="button" onclick="modifyFinish()">등록</button>
		  	</div><!-- 컨트롤 버튼그룹 end -->  
		  	<!-- 삭제 모달창 start -->
				<div class="modal fade" id="prjDelModal" tabindex="-1" aria-labelledby="delModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="delModalLabel">프로젝트 삭제</h5>
							</div>
							<div class="modal-body text-center">
								<label class="form-label">프로젝트를 삭제하시겠습니까?</label>
								<div class="invalid-feedback">[확인]버튼 클릭시 작성중인 글은 저장되지 않고 삭제됩니다.(복구불가)</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" aria-label="Close">닫기</button>
								<button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="delBtn">확인</button>
							</div>
						</div>
					</div>
				</div><!-- 삭제 모달창 end -->  
		  </div>
	      <h2 class="col-auto mb-5">프로젝트 기획</h2>
      </div>
      <div class="mb-4"> <!-- 탭 메뉴 -->
        <div class="nav nav-tabs nav-justified" id="v-pills-tab" role="tablist">
          <button class="nav-link active" id="v-pills-01-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab01" type="button" role="tab" aria-controls="v-pills-tab01" aria-selected="true">기본정보</button>
          <button class="nav-link" id="v-pills-02-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab02" type="button" role="tab" aria-controls="v-pills-tab02" aria-selected="false">펀딩계획</button>
          <button class="nav-link" id="v-pills-03-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab03" type="button" role="tab" aria-controls="v-pills-tab03" aria-selected="false">리워드 구성</button>
          <button class="nav-link" id="v-pills-04-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab04" type="button" role="tab" aria-controls="v-pills-tab04" aria-selected="false">프로젝트 계획</button>
          <button class="nav-link" id="v-pills-05-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab05" type="button" role="tab" aria-controls="v-pills-tab05" aria-selected="false">창작자 정보</button>
          <button class="nav-link" id="v-pills-06-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab06" type="button" role="tab" aria-controls="v-pills-tab06" aria-selected="false">신뢰와 안전</button>
        </div>
      </div>
      <div class="tab-content px-5" id="v-pills-tabContent"><!-- 탭 컨텐츠 start -->
      	<input type="hidden" name="prdt_id" id="prdt_id" value="${projectDto.prdt_id}">
      	<input type="hidden" name="prdt_genre_db" id="prdt_genre_db" value="${projectDto.prdt_genre}">
        <!-- tab 1 contents -->
        <div class="tab-pane fade show active" id="v-pills-tab01" role="tabpanel" aria-labelledby="v-pills-tab01-tab" action="/projectregister/modify" method="post">
          <div class="row pb-3 border-bottom mt-4">
            <div class="col-6">
              <h5>프로젝트 카테고리</h5>
              <p>프로젝트 성격과 가장 일치하는 카테고리를 선택해주세요. 적합하지 않을 경우 운영자에 의해 조정될 수 있습니다.</p>
            </div>
            <div class="col-6 px-3">
              <select class="form-select" aria-label="Default select example" rows="1" style="resize: none;" id="prdt_genre" name="prdt_genre" value="${projectDto.prdt_genre}">
                <option value="0" selected="selected">장르를 선택해주세요</option>
                <option value="1">문학</option>
                <option value="2">시/에세이</option>
                <option value="3">웹툰</option>
              </select>
            </div>
          </div>
          <div class="row pb-3 border-bottom mt-4">
            <div class="col-6">
              <h5>프로젝트 제목</h5>
              <p>프로젝트의 주제, 책의 특징이 드러나는 멋진 제목을 붙여주세요.</p>
            </div>
            <div class="col-6 px-3 text-end">
              <input class="form-control" rows="1" style="resize: none;" id="prdt_name" value="${projectDto.prdt_name}" />
              <span class="text-danger text-small">0/20</span>
            </div>
          </div>
          <div class="row pb-3 border-bottom mt-4">
            <div class="col-6">
              <h5>프로젝트 대표 이미지</h5>
              <p>후원자들이 프로젝트의 내용을 쉽게 파악하고 좋은 인상을 받을 수 있도록 이미지 가이드라인을 따라 주세요.</p>
            </div>
            <div class="col-6 px-3">
              <div id="project_img_div" class="input-group mb-3">
                <input type="file" class="form-control" name="projectImg" id="projectImg" multiple />
                <button class="btn btn-outline-primary" id="fileAddBtn">Upload</button>
              </div>
              <div class="bg-light p-2" id="projectImg_preview" style="height:300px;"></div>
            </div>
          </div>
          <div class="row pb-3 mt-4">
            <div class="col-6">
              <h5>프로젝트 설명</h5>
              <p>후원자 분들이 프로젝트를 빠르게 이해할 수 있도록 명확하고 간략하게 소개해주세요</p>
            </div>
            <div class="col-6 px-3 text-end">
              <textarea class="form-control" rows="5" style="resize: none;" id="prdt_desc"> ${projectDto.prdt_desc}</textarea>
              <span class="text-danger text-small">0/50</span>
            </div>
          </div>
<!--           <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4 border-top border-2 py-4">
            <button class="btn btn-primary me-md-2" type="button" id="modifyBtn">저장하기</button>
            <button class="btn btn-primary nextBtn" type="button" id="nextBtn0">다음단계</button>
          </div> -->
        </div>

        <!-- tab 2 contents -->
        <div class="tab-pane fade" id="v-pills-tab02" role="tabpanel" aria-labelledby="v-pills-tab02-tab">
          <div class="row pb-3 border-bottom">
            <div class="col-6">
              <h5>목표 금액</h5>
              <p>프로젝트를 완수하기 위해 필요한 금액을 설정해주세요.​</p>
              <ul class="bg-light rounded p-3">
                <li class="text-danger">목표 금액 설정 시 꼭 알아두세요!</li>
                <li class="text-muted text-small">종료일까지 목표금액을 달성하지 못하면 후원자​ 결제가 진행되지 않습니다.​</li>
                <li class="text-muted text-small">종료 전 후원 취소를 대비해 10% 이상 초과 달성을​ 목표로 해주세요.​</li>
                <li class="text-muted text-small">제작비, 리워드 배송비, 인건비, 예비 비용 등을 함께​ 고려해주세요.​</li>
              </ul>
            </div>
            <div class="col-6 px-3">
              <input class="form-control mb-4" placeholder="50만원 이상의 금액을 입력해주세요."  id="prdt_goal" onchange="calculate()" value="${projectDto.prdt_goal }"/>
              <h6 class="px-2">목표 금액 달성시 예상 수령액</h6>
              <h5 class="text-primary text-end" id="goal_price">720,000원</h5>
              <hr class="px-3">
              <div class="row text-muted">
                <p class="col-8 text-start">총 수수료</p>
                <p class="col-4 text-end" id="total_commission">000,000원</p>
              </div>
              <div class="row text-muted">
                <p class="col-8 text-start">결제 대행 수수료<span class="text-small">(총 결제액의 3% + VAT)</span></p>
                <p class="col-4 text-end" id="agencies_commission">000,000원</p>
              </div>
              <div class="row text-muted">
                <p class="col-8 text-start">플랫폼 수수료<span class="text-small">(총 모금액의 5% + VAT)</span></p>
                <p class="col-4 text-end" id="platform_commission">000,000원</p>
              </div>
            </div>
          </div>
          <div class="row pb-3 mt-4">
            <div class="col-6">
              <h5>펀딩 일정</h5>
              <p>설정한 일시가 되면 펀딩이 자동 시작됩니다. 펀딩 시작 전까지​ 날짜를 변경할 수 있고, 즉시 펀딩을 시작할 수도 있습니다.</p>
            </div>
            <div class="col-6 px-3">
              <div class="row mb-2">
                <h6 class="col-4 text-start py-3">시작일</h6>
                <div class="col-8"><input class="form-control" type="date" id="prdt_opendate"  value="${projectDto.prdt_opendate}"/></div>
              </div>
              <div class="row mb-2">
                <h6 class="col-4 text-start py-3">종료일</h6>
                <div class="col-8"><input class="form-control" type="date" id="prdt_enddate" onchange="calDate()" value="${projectDto.prdt_enddate}"/></div>
              </div>
              <p class="text-end text-info" id="punding_date_range">펀딩 기간 XX일</p>
              <h6>후원자 결제 종료</h6>
              <p class="text-small bg-light rounded p-3 text-muted">프로젝트 성공 시 펀딩 종료 다음 날 후원금이 결제됩니다.​ 단, 후원자의 사정으로 결제가 이루어지지 않은 경우는 제외합니다.​</p>
              <h6>정산일</h6>
              <p class="text-info" id="adjust_date">예상 정산일은 YYYY년 MM월 DD일입니다.</p>
            </div>
          </div>
<!--      //저장하기, 다음단계 영역    
		  <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4 border-top border-2 py-4">
		     <button class="btn btn-primary me-md-2" type="button" id="modifyBtn">저장하기</button>
            <button class="btn btn-primary nextBtn" type="button" id="nextBtn1">다음단계</button>
          </div> -->
        </div>
        <!-- tab 3 contents -->
        <div class="tab-pane fade" id="v-pills-tab03" role="tabpanel" aria-labelledby="v-pills-tab03-tab">
         <%@ include file ="reward.jsp" %>
        </div>
        <!-- tab 4 contents -->
        <div class="tab-pane fade" id="v-pills-tab04" role="tabpanel" aria-labelledby="v-pills-tab04-tab">
          <div class="row mb-4">
            <div class="col-4">
              <h5>프로젝트 소개</h5>
              <p>무엇을 만들기 위한 프로젝트인지 분명히 알려주세요.</p>
              <ul class="bg-light rounded p-3 text-muted text-small">
                <li>
                  <p>Q.무엇을 만들기 위한 프로젝트인가요?</p>
                <li>
                  <p>Q.프로젝트를 간단히 소개한다면?</p>
                </li>
                <li>
                  <p>Q.이 프로젝트가 왜 의미있나요?</p>
                </li>
                <li>
                  <p>Q.이 프로젝트를 시작하게 된 배경이 무엇인가요?</p>
                </li>
              </ul>
            </div>
            <div class="col-8">
              <!-- 글작성 영역 summernote -->
				<div>
					<textarea class="summernote" placeholder="내용을 입력하세요​" id="prdt_desc_detail">${projectDto.prdt_desc_detail}</textarea>
				</div>
            </div>
 <!--            <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4 border-top border-2 py-4">
		     <button class="btn btn-primary me-md-2" type="button" id="modifyBtn">저장하기</button>
            <button class="btn btn-primary nextBtn" type="button" id="nextBtn3">다음단계</button>
		    </div> -->
          </div>
        </div>
        <!-- tab 5 contents -->
        <div class="tab-pane fade" id="v-pills-tab05" role="tabpanel" aria-labelledby="v-pills-tab05-tab">
          <div class="row pb-3 border-bottom mt-4">
            <div class="col-6">
              <h5>본인 인증</h5>
              <p>창작자 본인 이메일로 인증해주세요</p>
            </div>
            <div class="col-6 px-3 text-end">
              <div class="input-group">
                <input type="email" class="form-control" placeholder="user@email.com" aria-describedby="button-addon2">
                <button class="btn btn-outline-secondary" type="button" id="button-addon2">인증하기</button>
              </div>
            </div>
          </div>
          <div class="row pb-3 mt-4">
            <div class="col-6">
              <h5>입금 계좌</h5>
              <p>후원금을 전달받을 계좌를 등록해주세요.</p>
            </div>
            <div class="col-6 px-3">
              <div class="row row-cols-1 row-cols-md-2 mb-4">
                <div class="col-md-4">
                  <p>계좌종류</p>
                  <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                    <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
                    <label class="btn btn-outline-primary" for="btnradio1">개인</label>
                    <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
                    <label class="btn btn-outline-primary" for="btnradio2">사업자</label>
                  </div>
                </div>
                <div class="col-md-8">
                  <p>예금주 생년월일 / 사업자번호</p>
                  <input type="number" class="form-control" placeholder="예금주 생년월일 / 사업자번호">
                </div>
              </div>
              <div class="row row-cols-1 row-cols-md-2 mb-4">
                <div class="col-md-4">
                  <p>거래은행</p>
                  <input type="text" class="form-control" placeholder="은행명">
                </div>
                <div class="col-md-8">
                  <p>예금주 명</p>
                  <input type="text" class="form-control" placeholder="예금주 명">
                </div>
              </div>
              <div class="row px-2 mb-4">
                <p>계좌번호</p>
                <input type="number" class="form-control" placeholder="계좌번호 - 빼고 숫자만 입력">
              </div>
              <div class="row mb-4">
                <p>통장사본 첨부</p>
                <div class="input-group">
                  <input type="file" class="form-control" id="inputGroupFile02">
                  <label class="input-group-text" for="inputGroupFile02">Upload</label>
                </div>
              </div>

            </div>
          </div>
<!--           <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4 border-top border-2 py-4">
		     <button class="btn btn-primary me-md-2" type="button" id="modifyBtn">저장하기</button>
            <button class="btn btn-primary nextBtn" type="button" id="nextBtn4">다음단계</button>
		  </div> -->
        </div>
        <!-- tab 6 contents -->
        <div class="tab-pane fade" id="v-pills-tab06" role="tabpanel" aria-labelledby="v-pills-tab06-tab">
          <div class="row mb-4">
            <div class="col-4">
              <h5>프로젝트 정책</h5>
              <p>아래와 같은 사항을 고려해서 작성해주세요. 진행하는 프로젝트에 해당되지 않는 항목은 삭제해주세요.</p>
              <ul class="bg-light rounded p-3 text-muted text-small">
                <li>
                  <p>펀딩 마감 이후에는 후원금액이 창작자에게 전달되기에 퍼플레잉을 통해 환불이 불가합니다. 환불은 창작자가 환불계좌를 받아 반환하는 방식으로만 가능하며, 어떤 경우에 환불이 가능한지를 기재해주세요.</p>
                <li>
                  <p>펀딩 성사 후 지연 또는 선물 전달에 문제가 발생했을 때에 어떤 식으로 대응하시겠어요? 이 프로젝트 특성상 발생할 수 있는 문제에 대한 추가적인 정책이나 약속이 있다면 기재해주세요. (후원금 환불, 대체 보상 등)</p>
                </li>
                <li>
                  <p>배송이 필요한 선물에 문제가 발생한 경우 교환, A/S는 어떻게 진행되나요?</p>
                </li>
              </ul>
            </div>
            <div class="col-8">
              <!-- 글작성 영역 summernote -->
			  <textarea class="summernote" placeholder="내용을 입력하세요​" id="prdt_desc_policy">${projectDto.prdt_desc_policy}</textarea>
            </div>
          </div>
        </div><!-- tab 6 contents end -->
      </div><!-- 탭 컨텐츠 end -->
    </div><!-- contentsWrap end -->
   </section>
   <!--페이지 내용 종료-->
    <script>
		$(document).ready(function() {
			$('#prdt_genre').val($('#prdt_genre_db').val());
			//여기 아래 부분
			$('.summernote').summernote({
				  //height: 445,                 // 에디터 높이
				  minHeight: 500,             // 최소 높이
				  //maxHeight: 445,             // 최대 높이
				  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
				  lang: "ko-KR",					// 한글 설정
				  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
			})
		})
	</script>
	<script type="text/javascript">
		function dateFormat(date) {
	        let month = date.getMonth() + 1;
	        let day = date.getDate();
	
	        month = month >= 10 ? month : '0' + month;
	        day = day >= 10 ? day : '0' + day;
	     
	
	        return date.getFullYear() + '-' + month + '-' + day;
		}
		
		function calDate(){
			let openDate = $('#prdt_opendate').val()
			let endDate = $('#prdt_enddate').val()
			let finishDate = new Date(endDate);
			let tomorrow_end_Date = new Date(finishDate.setDate(finishDate.getDate()+1));
			
			$.ajax({
				type: 'GET',	
				url: '/purplaying/project/calDate/'+openDate+"/"+endDate,//year+month+day,	
				success: function(result) {
					alert(result)
					$('#punding_date_range').html("펀딩 기간 "+result+"일");
					$('#adjust_date').html("예상 정산일은 "+dateFormat(tomorrow_end_Date)+"입니다.");
				},
				error : function() { alert("error") }
			})
		}
		function calculate(){
			$.ajax({
				type: 'GET',	
				url: '/purplaying/project/calculate/'+$('#prdt_goal').val(),	
				success: function(result) {
					alert(result)
					//$('#goal_price').val(result);
					$('#goal_price').html(result[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원");
					$('#agencies_commission').html(result[1].replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원");
					$('#platform_commission').html(result[2].replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원");
					$('#total_commission').html(result[3].replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원");
				},
				error : function() { alert("error") }
			})
		}
		

		var link = '/purplaying/mypage'
		function cancel(){
			location.href = link
		}
		function modifyFinish() {
				document.getElementById('modifyAllBtn').click()
				location.href = link
		}
		
		/* 파일 확장자, 크기 처리 */
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$")
		var maxSize = 5242880 //5MB
		function checkExtension(fileName, fileSize) {
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과")
				return false
			}
			if(regex.test(fileName)){
				alert("해당 확장자의 파일은 업로드할 수 없습니다. ")
				return false
			}
			return true
		}
		
		let prdt_id = ${projectDto.prdt_id}
		
		/* let toHtml = function(img_thumb) {
			let tmp = '<div class="w-100">'
			img_thumb.forEach(function() {
				tmp += '<img src="' + uploadFolder
				tmp += '/' + uploadFileName
				tmp += '">'
			})
			return tmp += '</div>'
		} */
		
		$(document).ready(function() {	
			$("#fileAddBtn").on("click", function() {
				var formData = new FormData()
				var inputFile = $("#projectImg")
				var files = inputFile[0].files
				console.log(files)

				for (var i=0; i<files.length; i++){
					if(!checkExtension(files[i].name, files[i].size)){
						return false
					}
					formData.append("uploadFile", files[i]);
					formData.append("prdt_id", prdt_id);
				}
				
				$.ajax({
					type: 'POST',	
					url: '/purplaying/file/upload',
					enctype: "multpart/form-data",
					data : formData,
					processData: false,
				    contentType: false,
				    dataType:'json',
					success: function(result) {
						console.log(result)
						/* $("#projectImg_preview").html(toHtml(result)) */
						},
					error : function() { alert("error") }
				}) 
			})
			
			$("#previewBtn").on("click", function() {
				document.getElementById('modifyAllBtn').click() // 저장 후 페이지 이동
				
				let prdt_id = ${projectDto.prdt_id}
				$.ajax({
					type: 'GET',	
					url: '/purplaying/project/view/'+prdt_id,	
					success: function() {
						alert("작성중인 내용 저장완료. 미리보기페이지로 이동합니다.")
						location.href = '/purplaying/project/view/'+prdt_id
						},
					error : function() { alert("error") }
				})
			})
			
			$("#delBtn").on("click", function() {
				let prdt_id = ${projectDto.prdt_id}
				$.ajax({
					type: 'DELETE',	
					url: '/purplaying/project/remove/'+prdt_id,	
					success: function() {
						console.log("프로젝트가 삭제되었습니다. 마이페이지로 이동합니다.")
						location.href = link
						},
					error : function() { alert("error") }
				})
			})
	
			$("#modifyAllBtn").on("click", function() {
				let prdt_id = ${projectDto.prdt_id}
				let prdt_genre = $("#prdt_genre").val()
				let prdt_name = $("#prdt_name").val()
				let prdt_desc = $('#prdt_desc').val()
				let prdt_desc_detail = $('#prdt_desc_detail').val()
				let prdt_opendate = $('#prdt_opendate').val()
				let prdt_enddate = $('#prdt_enddate').val()
				let prdt_goal = $('#prdt_goal').val()
				let prdt_desc_policy = $('#prdt_desc_policy').val()
				
				const prdtData = { // Body에 첨부할 json 데이터
						prdt_id:prdt_id,
		                prdt_genre:prdt_genre,
		                prdt_name:prdt_name,
		                prdt_desc:prdt_desc,
		                prdt_desc_detail:prdt_desc_detail,
		                prdt_opendate:prdt_opendate,
		                prdt_enddate:prdt_enddate,
		                prdt_goal:prdt_goal,
		                prdt_desc_policy:prdt_desc_policy,
		            }
				alert("prdtData:"+JSON.stringify(prdtData))
				$.ajax({
					type: 'PATCH',
					url: '/purplaying/project/modify/'+prdt_id,
					headers : { "content-type" : "application/json-patch+json; charset=utf-8" }, 		//요청 헤더
	                data: JSON.stringify(prdtData),
					success : function() { 
						console.log("modifyAll success")
					},
					error : function() { alert("error") }
				})
			})
		})
		
		let formCheck = function() {
			let form = document.getElementById("form")
			if(form.notice_title.value=="") {
				alert("제목을 입력해 주세요.")
				form.title.focus()
				return false
			}
			if(form.notice_context.value=="") {
				alert("내용을 입력해 주세요.")
				form.notice_context.focus()
				return false
			}
			if(form.notice_category.value == 0) {
				alert("카테고리를 선택해주세요")
				form.notice_category.focus()
				return false
			}	
			return true;
		}
	</script>
	<!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
</body>
</html>