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
        		<form id="searchproductform" action="<c:url value="/admin/projectlist"></c:url>" method="get" class="justify-content-end d-flex">
        			<input class="form-control w-25 mb-4" id="searchproduct" name ="keyword" type="text" value="${param.keyword}"/>
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
								<th scope="row" name="prdt_id-${projectDto.prdt_id}">${projectDto.prdt_id}</th>
								<td name="prdt_name-${projectDto.prdt_id}"><a href="${pageContext.request.contextPath}/project/${projectDto.prdt_id}">${projectDto.prdt_name}</a></td>
								<td name="prdt_writer-${projectDto.prdt_id}">${projectDto.writer}</td>
								<td name="prdt_opendate-${projectDto.prdt_id}"><fmt:formatDate value="${projectDto.prdt_opendate}" pattern="yyyy-MM-dd" type="date" /></td>
								<td name="prdt_enddate-${projectDto.prdt_id}"><fmt:formatDate value="${projectDto.prdt_enddate}" pattern="yyyy-MM-dd" type="date" /></td>
								<td name="prdt_goal-${projectDto.prdt_id}">${projectDto.prdt_goal}</td>
								<td name="prdt_currenttotal-${projectDto.prdt_id}">${projectDto.prdt_currenttotal}</td>
								<td name="prdt_delete-${projectDto.prdt_id}">
									<button type="button" onclick="delete_project()">삭제하기</button>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="paging-container">
				<div class="justify-content-center d-flex" id="paging_project">
				 <!-- 페이지 네비게이션 -->
				 <div class="col-1"></div>
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
  /* 파일 업로드 */
  	function delete_project(){
  		eventTarget = event.target;
  		let prdt_id = eventTarget.parentNode.parentNode.firstElementChild.innerHTML;
  		let prdt_data = {prdt_id:prdt_id};
  		$.ajax({
			type:'post',	//통신방식 (get,post)
			url: '/purplaying/admin/listProject',                                                                                
			headers:{"content-type" : "application/json"},
			dataType : 'text',
			data : JSON.stringify(prdt_data),
			success:function(result){
				$('#product_list').html(toHtmlProduct(JSON.parse(result)))
			},
			error : function(){
				alert("error");
			}					
		});
  	}
  	let toHtmlProduct = function(table){
  		let tmp = "<table><tr><th class='prdt_id'>번호</th><th class='prdt_name'>제목</th><th class='prdt_writer'>작성자</th>";
  	 	tmp += "<th class='prdt_opendate'>오픈일</th><th class='prdt_enddate'>종료일</th><th class='prdt_goal'>목표금액</th>";
  		tmp += "<th class='prdt_currenttotal'>현재금액</th><th class='prdt_save'></th></tr>";
  		
		table.forEach(function(table_item){
			tmp += '<tr>'
			tmp += '<td name="prdt_id-'+table_item.prdt_id+'">'+table_item.prdt_id+'</td>';
			tmp += '<td name="prdt_name-'+table_item.prdt_id+'"><a href="${pageContext.request.contextPath}/project/'+table_item.prdt_id+'">'+table_item.prdt_name+'</a></td>';
			tmp += '<td name="prdt_writer-'+table_item.prdt_id+'">'+table_item.prdt_writer+'</td>';
			tmp += '<td name="prdt_opendate-'+table_item.prdt_id+'">'+toStringByFormatting(table_item.prdt_opendate)+'</td>';
			tmp += '<td name="prdt_enddate-'+table_item.prdt_id+'">'+toStringByFormatting(table_item.prdt_enddate)+'</td>';
			tmp += '<td name="prdt_goal-'+table_item.prdt_id+'">'+table_item.prdt_goal+'</td>';
			tmp += '<td name="prdt_currenttotal-'+table_item.prdt_id+'">'+table_item.currenttotal+'</td>'
			tmp += '<td name="prdt_delete-'+table_item.prdt_id+'">';
			tmp += '<button type="button" onclick="delete_project()">삭제하기</button>';
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