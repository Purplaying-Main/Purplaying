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
    		<div class="my-4" > <!-- 탭 메뉴 -->
        		<form id="searchproductform" action="<c:url value="/admin/projectlist"></c:url>" method="get" class="col-10 row mx-auto justify-content-end">
        			<input class="form-control w-25 mb-4" id="searchproduct" name ="keyword" type="text" placeholder="제목을 입력하세요" value="${param.keyword}"/>
        		</form>
        		<div id="product_list" class="row mx-auto col-10">
	        		<table class="table table-hover">
			        	<tr>
							<th class="prdt_id" scope="col">번호</th>
							<th class="prdt_name" scope="col">제목</th>
							<th class="prdt_writer" scope="col">작성자</th>
							<th class="prdt_opendate" scope="col">오픈일</th>
							<th class="prdt_enddate" scope="col">종료일</th>
							<th class="prdt_goal" scope="col">목표금액</th>
							<th class="prdt_currenttotal" scope="col">현재금액</th>
							<th class="prdt_save" scope="col"></th>
						</tr>
			        	<c:forEach var="projectDto" items="${projectList}">
							<tr>
								<th class="align-middle" scope="row" id="prdt_id-${projectDto.prdt_id}">${projectDto.prdt_id}</th>
								<td class="align-middle" id="prdt_name-${projectDto.prdt_id}"><a href="${pageContext.request.contextPath}/project/${projectDto.prdt_id}">${projectDto.prdt_name}</a></td>
								<td class="align-middle" id="prdt_writer-${projectDto.prdt_id}">${projectDto.writer}</td>
								<td class="align-middle" id="prdt_opendate-${projectDto.prdt_id}"><fmt:formatDate value="${projectDto.prdt_opendate}" pattern="yyyy-MM-dd" type="date" /></td>
								<td class="align-middle" id="prdt_enddate-${projectDto.prdt_id}"><fmt:formatDate value="${projectDto.prdt_enddate}" pattern="yyyy-MM-dd" type="date" /></td>
								<td class="align-middle" id="prdt_goal-${projectDto.prdt_id}">${projectDto.prdt_goal}</td>
								<td class="align-middle" id="prdt_currenttotal-${projectDto.prdt_id}">${projectDto.prdt_currenttotal}</td>
								<td name="prdt_delete-${projectDto.prdt_id}">
									<input type="hidden" value="${projectDto.prdt_id}"/>
									<button type="button" class="btn btn-primary" onclick="goto_project_modal()">삭제하기</button>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="modal fade" id="ProjectModal" tabindex="-1" aria-labelledby="projectmodalLabel" aria-hidden="true" >
					<div class="modal-dialog modal-xl" role="document">
						<div class="modal-content">
				            <div class="modal-header p-5 pb-4 border-bottom-0">
				                <h5 class="fw-bold mb-0">프로젝트 삭제하기</h5>
				                <button type="button" class="btn-close" onclick="Close_project_modal()"></button>
				            </div>
			                <div class="modal-body p-5 pt-0" >
			                	<input type="hidden" id="project_no_modal"/>
			                	<div id="project_preview">
			                		<iframe id="project_preview_page" src="" width="100%" height="700px"></iframe>
			                	</div>
							</div>
			                <div class="modal-footer">
			                	<input type="hidden" id="prdt_id_modal" value="${projectDto.prdt_id}"/>
			                    <button id="gotochangeBtn" class="btn btn-primary" onclick="delete_project()">삭제하기</button> 
			                </div>
			          <!-- modal body -->
					    </div>
					</div>
				</div>
				<div class="paging-container">
				<div class="justify-content-center d-flex" id="paging_project">
				 <!-- 페이지 네비게이션 -->
				 <ul class="pagination mb-0 col-10 justify-content-center">
					<c:if test="${totalCnt == null}">
						<div> 게시물이 없습니다.</div>
					</c:if>
					<c:if test="${totalCnt != null || totalCnt != 0 }">
						<c:if test="${pr.showPrev }">
							<li class="page-item">
								<a class="page-link" href="<c:url value="/admin/projectlist${pr.sc.getQueryString(pr.beginPage-1) }" />">Previous</a>
							</li>
						</c:if>
						<c:forEach var="i" begin="${pr.beginPage }" end="${pr.endPage }">
							<li class="page-item">
								<a class="page-link <c:if test="${pr.sc.page==i}">active</c:if>" href="<c:url value="/admin/projectlist${pr.sc.getQueryString(i)}" />">${i }</a>
							</li>
						</c:forEach>
						<c:if test="${pr.showNext }">
							<li class="page-item">
								<a class="page-link" href="<c:url value="/admin/projectlist${pr.sc.getQueryString(pr.endPage+1) }" />">Next</a>
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
  
  	  //프로젝트 삭제 모달 호출 function
	  function goto_project_modal(){
		  eventTarget = event.target		//이벤트 발생시킨 html태그 저장
		  prdt_id = eventTarget.previousElementSibling.value	//이벤트 발생 요소기준 부모,자식관계 이용 펀딩번호 저장
		  $('#prdt_id_modal').val(prdt_id)
		  $('#project_preview_page').attr('src','');		//펀딩 미리보기 src 초기화
		  $('#project_preview_page').attr('src','http://localhost:8080/purplaying/project/'+prdt_id);	//펀딩 미리보기 호출
		  $('#ProjectModal').modal({backdrop: 'static', keyboard: false});
		  $('#ProjectModal').modal("show");		//펀딩 삭제 모달 호출
	  }
	  
  	  //펀딩 삭제 모달 종료 function
	  function Close_project_modal(){
		  $('#ProjectModal').modal("hide");		//펀딩 삭제 모달 종료
		  $('#project_preview_page').attr('src','');	//펀딩 미리보기 src 초기화
	  }
  
  	//펀딩 삭제 요청 function
  	function delete_project(){
  		let prdt_id = $('#prdt_id_modal').val()		//펀딩번호 저장
  		let prdt_data = {prdt_id:prdt_id};		//펀딩 삭제 요청시 필요한 data Json형태로 저장
  		$.ajax({		//펀딩 삭제 ajax로 요청
			type:'post',
			url: '/purplaying/admin/listProject',                                                                                
			headers:{"content-type" : "application/json"},
			dataType : 'text',
			data : JSON.stringify(prdt_data),
			success:function(result){		//펀딩삭제 성공시 호출
				window.location.reload();		//페이지 새로고침
				Close_project_modal()		//펀딩 삭제 모달 종료 function호출
			},
			error : function(){		//펀딩삭제 실패시 호출
				alert("error");
			}					
		});
  	}
  	
  </script>
	
  <!--푸터 인클루드-->
</body>
</html>