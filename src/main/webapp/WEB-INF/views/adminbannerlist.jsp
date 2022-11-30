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
              <h5 class="mb-2">배너 적용중인 이미지</h5>
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
								<input type="hidden" value="${bannerfileDto.banner_prdt_id}">
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
              <hr class="my-4">
              <h5>프로젝트 썸네일 이미지</h5>
        	<div id="Banner_list" class="row mx-auto col-10">
		        <table class="table table-hover">
		        	<tr>
						<th class="file_id" scope="col">번호</th>
						<th class="file_name" scope="col">이미지 이름</th>
						<th class="file_location" scope="col">이미지 경로</th>
						<th class="file_regdate" scope="col">등록 날짜</th>
						<th class="file_save" scope="col"></th>
					</tr>
		        	<c:forEach var="fileDto" items="${bannerList}">
						<tr>
							<th name="file_id" scope="row">${fileDto.file_id}</th>
							<td name="file_name"><a href="${pageContext.request.contextPath}/project/${fileDto.prdt_id}">${fileDto.file_name}</a></td>
							<td name="file_location">${fileDto.file_location}</td>
							<td name="file_regdate"><fmt:formatDate value="${fileDto.file_regdate}" pattern="yyyy-MM-dd" type="date" /></td>
							<td name="fileDto_save-${fileDto.file_id}">
								<input type="hidden" value="${fileDto.prdt_id}">
								<button type="button" onclick="setBanner()">설정하기</button>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="paging-container">
				<div class="justify-content-center d-flex" id="paging_user">
					<c:if test="${totalCnt == null}">
						<div> 게시물이 없습니다.</div>
					</c:if>
					<c:if test="${totalCnt != null || totalCnt != 0 }">
						<c:if test="${pr.showPrev }">
							<a class="page" href="<c:url value="/admin/bannerlist${pr.sc.getQueryString(pr.beginPage-1) }" />"> &lt; </a>
						</c:if>
						<c:forEach var="i" begin="${pr.beginPage}" end="${pr.endPage }">
							<a class="page <c:if test="${pr.sc.page==i}">active</c:if>" href="<c:url value="/admin/bannerlist${pr.sc.getQueryString(i)}" />">${i }</a>
						</c:forEach>
						<c:if test="${pr.showNext }">
							<a class="page" href="<c:url value="/admin/bannerlist${pr.sc.getQueryString(pr.endPage+1) }" />"> &gt; </a>
						</c:if>						
					</c:if>
				</div>
			</div>
        </div>
	</div>
  </section>
  
  <script type="text/javascript">
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
				alert(result)
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