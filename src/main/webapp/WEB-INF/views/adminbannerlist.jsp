<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <!DOCTYPE html>
<html>
<head>
  <!-- meta태그, CSS, JS, 타이틀 인클루드  -->
  <%@ include file ="meta.jsp" %>
</head>
<body>
  <!--헤더 인클루드-->
   <%@ include file ="adminheader.jsp" %>
   
  <!--메인 컨테이너 -->
  <section>
  <div class="container">
    <div class="my-4"> <!-- 탭 메뉴 -->
         <div class="col-12">
              <h5 class="mb-2 text-center">배너 적용중인 이미지</h5>
              <div id="Banner_img_list" class="row mx-auto col-10">
			        <table class="table table-hover">
			        	<tr>
							<th class="bannerfile_id" scope="col">번호</th>
							<th class="bannerfile_name" scope="col">이미지 이름</th>
							<th class="bannerfile_regdate" scope="col">등록 날짜</th>
							<th class="bannerfile_save" scope="col"></th>
						</tr>
			        	<c:forEach var="bannerfileDto" items="${bannerfileList}">
							<tr>
								<th id="bannerfile_id" scope="row">${bannerfileDto.bannerfile_id}</th>
								<td id="bannerfile_name" class="text-truncate" style="max-width: 512px">${bannerfileDto.bannerfile_file}</td>
								<td id="bannerfile_regdate"><fmt:formatDate value="${bannerfileDto.bannerfile_regdate}" pattern="yyyy-MM-dd" type="date" /></td>
								<td id="bannerfile_save-${bannerfileDto.bannerfile_id}">
									<input type="hidden" value="${bannerfileDto.bannerfile_prdt_id}">
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
              <hr class="my-4">
              <h5 class="text-center">프로젝트 썸네일 이미지</h5>
        	<div id="Banner_list" class="row mx-auto col-12">
		        <table class="table table-hover">
		        	<tr>
						<th class="Project_id" scope="col">번호</th>
						<th class="Project_name" scope="col">프로젝트 이름</th>
						<th class="Project_img" scope="col">이미지</th>
						<th class="Project_regdate" scope="col">등록 날짜</th>
						<th class="file_save" scope="col"></th>
					</tr>
		        	<c:forEach var="ProjectDto" items="${ProjectDtoList}">
						<tr>
							<th class="align-middle" id="Project_id" scope="row">${ProjectDto.prdt_id}</th>
							<td class="align-middle" id="Project_name"><a href="${pageContext.request.contextPath}/project/${ProjectDto.prdt_id}">${ProjectDto.prdt_name}</a></td>
							<td class="align-middle text-truncate" id="Project_img" style="max-width: 512px">${ProjectDto.prdt_img}</td>
							<td class="align-middle" id="Project_regdate"><fmt:formatDate value="${ProjectDto.prdt_regdate}" pattern="yyyy-MM-dd" type="date" /></td>
							<td id="file_save-${ProjectDto.prdt_id}">
								<input type="hidden" value="${ProjectDto.prdt_id}">
								<button class="btn btn-primary" type="button" onclick="ShowBannerModal()">설정/미리보기</button>
							</td>
						</tr>
					</c:forEach>
				</table>
				<div class="modal fade" id="banner_Modal" role="dialog" tabindex="-1" aria-labelledby="bannerModalLabel" aria-hidden="true" >
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
				            <div class="modal-header p-5 pb-4 border-bottom-0">
				                <h5 class="fw-bold mb-0" id="banner-header">이미지 미리보기</h5>
				                <button type="button" class="btn-close" onclick="CloseBannerModal()"></button>
				            </div>
			                <div class="modal-body p-5 pt-0" id="banner-body">
			                	<img id="preview_img" src="" style="width:100%"/>
							</div>
							<div class="container text-center" id="banner-position" style="display:none;">
							  <input type="hidden" id="prdt_banner_no">
							  <div class="row">
							    <button class="col btn btn-primary" id="1" style="border:1px solid; width: 50%; padding-bottom:12.5%; padding-top:12.5%" onclick="setBanner()">1번</button>
							  	<button class="col btn btn-primary" id="2" style="border:1px solid; width: 50%; padding-bottom:12.5%; padding-top:12.5%" onclick="setBanner()">2번</button>
							    <button class="col btn btn-primary" id="3" style="border:1px solid; width: 50%; padding-bottom:12.5%; padding-top:12.5%" onclick="setBanner()">3번</button>
							  </div>
							</div>
			                <div class="modal-footer" id="banner-footer">
			                    <button id="gotochangeBtn" class="btn btn-primary" onclick="setBannerNext()">변경하기</button> 
			                </div>
			          <!-- modal body -->
					    </div>
					</div>
				</div>
			</div>
			<div class="paging-container">
				<div class="justify-content-center d-flex" id="paging_user">
				 <ul class="pagination mb-0 col-10 justify-content-center">
					<c:if test="${totalCnt == null}">
						<div> 게시물이 없습니다.</div>
					</c:if>
					<c:if test="${totalCnt != null || totalCnt != 0 }">
						<c:if test="${pr.showPrev }">
							<li class="page-item">
								<a class="page-link" href="<c:url value="/admin/bannerlist${pr.sc.getQueryString(pr.beginPage-1) }" />">Previous</a>
							</li>
						</c:if>
						<c:forEach var="i" begin="${pr.beginPage }" end="${pr.endPage }">
							<li class="page-item">
								<a class="page-link <c:if test="${pr.sc.page==i}">active</c:if>" href="<c:url value="/admin/bannerlist${pr.sc.getQueryString(i)}" />">${i }</a>
							</li>
						</c:forEach>
						<c:if test="${pr.showNext }">
							<li class="page-item">
								<a class="page-link" href="<c:url value="/admin/bannerlist${pr.sc.getQueryString(pr.endPage+1) }" />">Next</a>
							</li>
						</c:if>						
					</c:if>
				  </ul>
				</div>
			</div>
        </div>
	</div>
  </section>
  
  <script type="text/javascript">
  
  //배너 설정시 위치선택 요청 function
  function setBannerNext(){
	  $('#banner-header').html("배너위치 선택");
	  $('#gotochangeBtn').css('display', 'none');
	  $('#banner-body').css('display', 'none');
	  $('#banner-position').css('display', 'block');
  }
  //배너설정 모달 호출 function
  function ShowBannerModal(){
	  eventTarget = event.target;		//이벤트 발생시킨 html태그 저장
	  let prdt_id = eventTarget.previousElementSibling.value	//이벤트 발생 요소기준 부모,자식관계 이용 펀딩번호 저장
	  prdtImg = eventTarget.parentNode.previousElementSibling.previousElementSibling.innerHTML	//이벤트 발생 요소기준 부모,자식관계 이용 펀딩이미지(썸네일) 저장
	  $('#preview_img').attr("src",prdtImg)
	  $('#prdt_banner_no').val(prdt_id)
	  $('#banner_Modal').modal({backdrop: 'static', keyboard: false});
	  $('#banner_Modal').modal("show");		//배너설정 모달 출력
  }
  //배너설정 모달 종료 function
  function CloseBannerModal(){
		$('#banner_Modal').modal("hide");
		$('#banner-header').html("이미지 미리보기");
		$('#gotochangeBtn').css('display', 'block');
		$('#banner-body').css('display', 'block');
		$('#banner-position').css('display', 'none');
  }
  
  	//배너 설정 요청 function
  	function setBanner(){
  		let prdt_id = $('#prdt_banner_no').val()	//펀딩번호 저장
  		let position = event.target.getAttribute("id")	//이벤트 발생 요소 id속성 저장
  		let prdt_data = {prdt_id:prdt_id};		//배너 설정 요청시 필요한 data Json형태로 저장
  		$.ajax({		//배너 설정 ajax로 요청
			type:'post',
			url: '/purplaying/admin/bannerimg/'+position,                                                                                
			headers:{"content-type" : "application/json"},
			dataType : 'text',
			data : JSON.stringify(prdt_data),
			beforeSend: function(xhr){
		        xhr.setRequestHeader(header, token);
		    },
			success:function(result){		//배너설정 성공시 호출
				window.location.reload();		//페이지 새로고침
				CloseBannerModal()		//배너 설정 모달 종료 function호출
			},
			error : function(){		//배너설정 실패시 호출
				alert("error");
			}					
		});
 	}
  </script>
	
  <!--푸터 인클루드-->
</body>
</html>