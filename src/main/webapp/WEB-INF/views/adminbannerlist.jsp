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
        <div class="input-group mb-3 w-50 mx-auto">
                <input type="file" class="form-control" name="file_id" id="file_id" value="${attachFileDto.file_id}"/>
                <button class="btn btn-outline-primary" id="fileAddBtn">Upload</button>
              </div>
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
							<th name="bannerfile_id" scope="row">${bannerfileDto.bannerfile_id}</th>
							<td name="bannerfile_name">${bannerfileDto.bannerfile_file}</td>
							<td name="bannerfile_regdate"><fmt:formatDate value="${bannerfileDto.bannerfile_regdate}" pattern="yyyy-MM-dd" type="date" /></td>
							<td name="bannerfile_save-${bannerfileDto.bannerfile_id}">
								<input type="hidden" value="${bannerfileDto.bannerfile_prdt_id}">
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
              <hr class="my-4">
              <h5 class="text-center">프로젝트 썸네일 이미지</h5>
        	<div id="Banner_list" class="row mx-auto col-10">
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
							<th id="Project_id" scope="row">${ProjectDto.prdt_id}</th>
							<td id="Project_name"><a href="${pageContext.request.contextPath}/project/${ProjectDto.prdt_id}">${ProjectDto.prdt_name}</a></td>
							<td id="Project_img">${ProjectDto.prdt_img}</td>
							<td id="Project_regdate"><fmt:formatDate value="${ProjectDto.prdt_regdate}" pattern="yyyy-MM-dd" type="date" /></td>
							<td id="file_save-${ProjectDto.prdt_id}">
								<input type="hidden" value="${ProjectDto.prdt_id}">
								<button type="button" onclick="ShowBannerModal()" > <!-- onclick="setBanner()" -->설정/미리보기</button>
							</td>
						</tr>
					</c:forEach>
				</table>
				<div class="modal fade" data-keyboard="false" data-backdrop="static" id="banner_Modal" role="dialog" tabindex="-1" aria-labelledby="bannerModalLabel" aria-hidden="true" >
					<div class="modal-dialog" role="document">
						<div class="modal-content">
				            <div class="modal-header p-5 pb-4 border-bottom-0">
				                <h5 class="fw-bold mb-0">이미지 미리보기</h5>
				                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				            </div>
			                <div class="modal-body p-5 pt-0">
			                	<img id="preview_img" src="" style="width:100%"/>
							</div>
			                <div class="modal-footer">
			                    <button id="gotochangeBtn" class="btn btn-primary" onclick="save_change()">변경하기</button> 
			                </div>
			          <!-- modal body -->
					    </div>
					</div>
				</div>
			</div>
			<div class="paging-container">
				<div class="justify-content-center d-flex" id="paging_user">
				 <div class="col-1"></div>
				 <ul class="pagination mb-0 col-10 justify-content-center">
					<c:if test="${totalCnt == null}">
						<div> 게시물이 없습니다.</div>
					</c:if>
					<c:if test="${totalCnt != null || totalCnt != 0 }">
						<c:if test="${pr.showPrev }">
							<li class="page-item">
								<a class="page-link" href="<c:url value="/admin/bannerlist${pr.sc.getQueryString(pr.beginPage-1) }" />"> &lt; </a>
							</li>
						</c:if>
						<c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage }">
							<li class="page-item">
								<a class="page-link <c:if test="${pr.sc.page==i}">active</c:if>" href="<c:url value="/admin/bannerlist${pr.sc.getQueryString(i)}" />">${i }</a>
							</li>
						</c:forEach>
						<c:if test="${pr.showNext }">
							<li class="page-item">
								<a class="page-link" href="<c:url value="/admin/bannerlist${pr.sc.getQueryString(pr.endPage+1) }" />"> &gt; </a>
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
  function ShowBannerModal(){
	  eventTarget = event.target;
	  $('#banner_Modal').modal("show");
	  prdtImg = eventTarget.parentNode.previousElementSibling.previousElementSibling.innerHTML
	  $('#preview_img').attr("src",prdtImg)
  }
  /* 파일 업로드 */
  	function setBanner(){
  		eventTarget = event.target;
  		let prdt_id = eventTarget.previousElementSibling.value;
  		let prdt_data = {prdt_id:prdt_id};
  		$.ajax({
			type:'post',	//통신방식 (get,post)
			url: '/purplaying/admin/bannerimg',                                                                                
			headers:{"content-type" : "application/json"},
			dataType : 'text',
			data : JSON.stringify(prdt_data),
			success:function(result){
				$('#Banner_img_list').html(toHtmlBannerList(JSON.parse(result)))
			},
			error : function(){
				alert("error");
			}					
		});
 	}
  	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$")
	var maxSize = 5242880 //5MB
	function checkExtension(file_name, fileSize) {
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과")
			return false
		}
		if(regex.test(file_name)){
			alert("해당 확장자의 파일은 업로드할 수 없습니다. ")
			return false
		}
		return true
	}	
  	let toHtmlBannerList = function(list){
  		let tmp = "<table><tr><th class='bannerfile_id'>번호</th><th class='bannerfile_name'>이미지 이름</th>";
  	 	tmp += "<th class='bannerfile_regdate'>등록 날짜</th>";
  		tmp += "<th class='bannerfile_save'></th></tr>";
  		  		
		list.forEach(function(list_item){
			tmp += '<tr>'
			tmp += '<td name="bannerfile_id">'+list_item.bannerfile_id+'</td>';
			tmp += '<td name="bannerfile_name">'+list_item.bannerfile_file+'</td>';
			tmp += '<td name="bannerfile_regdate">'+toStringByFormatting(list_item.bannerfile_regdate)+'</td>';
			tmp += '<td name="bannerfile_save-'+list_item.bannerfile_id+'">';
			tmp += '<input type="hidden" value="'+list_item.banner_prdt_id+'">';
			tmp += '<button type="button" onclick="setBanner()">설정하기</button>';
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