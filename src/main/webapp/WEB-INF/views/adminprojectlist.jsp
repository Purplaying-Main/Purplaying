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
	  function goto_project_modal(){
		  eventTarget = event.target
		  prdt_id = eventTarget.previousElementSibling.value
		  $('#prdt_id_modal').val(prdt_id)
		  $('#project_preview_page').attr('src','');
		  $('#project_preview_page').attr('src','http://localhost:8080/purplaying/project/'+prdt_id);
		  $('#ProjectModal').modal({backdrop: 'static', keyboard: false});
		  $('#ProjectModal').modal("show");
	  }
	  
	  function Close_project_modal(){
		  $('#ProjectModal').modal("hide");
		  $('#project_preview_page').attr('src','');
	  }
  /* 파일 업로드 */
  
  	function delete_project(){
  		let prdt_id = $('#prdt_id_modal').val()
  		let prdt_data = {prdt_id:prdt_id};
  		$.ajax({
			type:'post',	//통신방식 (get,post)
			url: '/purplaying/admin/listProject',                                                                                
			headers:{"content-type" : "application/json"},
			dataType : 'text',
			data : JSON.stringify(prdt_data),
			success:function(result){
				alert("삭제되었습니다")
				$('#product_list').html(toHtmlProduct(JSON.parse(result)))
				Close_project_modal()
			},
			error : function(){
				alert("error");
			}					
		});
  	}
  	let toHtmlProduct = function(table){
  		let tmp = "<table class='table table-hover'><tr class='table-Secondary'><th class='prdt_id'>번호</th><th class='prdt_name' scope='col'>제목</th><th class='prdt_writer' scope='col'>작성자</th>";
  	 	tmp += "<th class='prdt_opendate' scope='col'>오픈일</th><th class='prdt_enddate'>종료일</th><th class='prdt_goal' scope='col'>목표금액</th>";
  		tmp += "<th class='prdt_currenttotal' scope='col'>현재금액</th><th class='prdt_save' scope='col'></th></tr>";
  		
		table.forEach(function(table_item){
			tmp += '<tr>'
			tmp += '<th class="align-middle" scope="row" id="prdt_id-'+table_item.prdt_id+'">'+table_item.prdt_id+'</td>';
			tmp += '<td class="align-middle" id="prdt_name-'+table_item.prdt_id+'"><a href="${pageContext.request.contextPath}/project/'+table_item.prdt_id+'">'+table_item.prdt_name+'</a></td>';
			tmp += '<td class="align-middle" id="prdt_writer-'+table_item.prdt_id+'">'+table_item.writer+'</td>';
			tmp += '<td class="align-middle" id="prdt_opendate-'+table_item.prdt_id+'">'+toStringByFormatting(table_item.prdt_opendate)+'</td>';
			tmp += '<td class="align-middle" id="prdt_enddate-'+table_item.prdt_id+'">'+toStringByFormatting(table_item.prdt_enddate)+'</td>';
			tmp += '<td class="align-middle" id="prdt_goal-'+table_item.prdt_id+'">'+table_item.prdt_goal+'</td>';
			tmp += '<td class="align-middle" id="prdt_currenttotal-'+table_item.prdt_id+'">'+table_item.prdt_currenttotal+'</td>'
			tmp += '<td class="align-middle" id="prdt_delete-'+table_item.prdt_id+'">';
			tmp += '<input type="hidden" value="'+table_item.prdt_id+'"/>';
			tmp += '<button type="button" class="btn btn-primary" onclick="goto_project_modal()">삭제하기</button>';
			tmp	+='</td>';
			tmp += '</tr>';
		});
		tmp += "</table>";
		return tmp;
	}	
 	function toStringByFormatting(source,delimiter = '-'){
 		let date_source = new Date(source);
	    let month = date_source.getMonth() + 1;
        let day = date_source.getDate();
       
        month = month >= 10 ? month : '0' + month;
        day = day >= 10 ? day : '0' + day;
      
        return date_source.getFullYear() + '-' + month + '-' + day;
 	} 
  </script>
	
  <!--푸터 인클루드-->
</body>
</html>