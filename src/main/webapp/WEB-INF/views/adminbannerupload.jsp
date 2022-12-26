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
              <div class="row align-item-center">
	              <div class="col-1"></div>
	              <h5 class="text-center col-10">업로드한 배너 이미지</h5>
	              <button id="ImageUploadModalBtn" class="btn btn-primary col-1" onclick="showUploadModal()">업로드</button>
              </div>
              <div class="modal fade" id="ImageUploadModal" tabindex="-1" aria-labelledby="projectmodalLabel" aria-hidden="true" >
					<div class="modal-dialog modal-xl" role="document">
						<div class="modal-content">
				            <div class="modal-header p-5 pb-4 border-bottom-0">
				                <h5 class="fw-bold mb-0">배너 이미지 업로드</h5>
				                <button type="button" class="btn-close" onclick="Close_upload_modal()"></button>
				            </div>
			                <div class="modal-body p-5 pt-0" >
		                		<div class="input-group mb-3 mx-auto">
						        	<input type="file" class="form-control" name="file_id" id="file_id" value="${attachFileDto.file_id}"/>
						        	<button class="btn btn-outline-primary" id="fileAddBtn" onclick="previewimg()">Upload</button>
						    	</div>
						    	<div class="bg-light p-2" id="uploadResult" style="height:260px;">
				              		<img width="100%" height="240px" id="prdt_thumbnail" name="prdt_thumbnail" src="" style=" ${projectDto.prdt_thumbnail == null ? 'display:none' : '' }">
				              	</div>
							</div>
			                <div class="modal-footer">
			                	<input type="hidden" id="prdt_id_modal" value="${projectDto.prdt_id}"/>
			                	<input type="hidden" id="prdt_image" value=""/>	
			                	<input type="hidden" id="prdt_uuid" value=""/>	
			                	<input type="hidden" id="prdt_uploadpath" value=""/>			                	
			                    <button id="gotochangeBtn" class="btn btn-primary" onclick="save_uploadImg()">저장하기</button> 
			                    <button id="gotodeleteBtn" class="btn btn-primary"  disabled='disabled' onclick="delete_uploadImg()">취소하기</button> 
			                </div>
			          <!-- modal body -->
					    </div>
					</div>
				</div>
        	<div id="Banner_list" class="row mx-auto col-12">
		        <table class="table table-hover">
		        	<tr>
						<th class="banner_filelist_id" scope="col">번호</th>
						<th class="banner_filelist_name" scope="col">이미지</th>
						<th class="banner_filelist_regdate" scope="col">등록 날짜</th>
						<th class="file_save" scope="col"></th>
					</tr>
		        	<c:forEach var="banner_filelist" items="${banner_filelist}">
						<tr>
							<th class="align-middle" id="banner_filelist_id" scope="row">${banner_filelist.file_id}</th>
							<td class="align-middle text-truncate" id="banner_filelist_name" style="max-width: 512px">${banner_filelist.file_name}</td>
							<td class="align-middle" id="banner_filelist_regdate"><fmt:formatDate value="${banner_filelist.file_regdate}" pattern="yyyy-MM-dd" type="date" /></td>
							<td class="text-end" id="file_save-${banner_filelist.file_id}">
								<input type="hidden" id="banner_filelist_id_hidden" value="${banner_filelist.file_id}">
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
			                    <button id="gotosaveBtn" class="btn btn-primary" onclick="setBannerNext()">변경하기</button> 
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
	function setBannerNext(){
		$('#banner-header').html("배너위치 선택");
		$('#gotochangeBtn').css('display', 'none');
		$('#banner-body').css('display', 'none');
		$('#banner-position').css('display', 'block');
		$('#gotosaveBtn').css('display','none');
	}
	function setBanner(){
  		let position = event.target.getAttribute("id")
  		let imgsrc = $('#preview_img').attr('src')
  		
  		$.ajax({
			type:'post',	//통신방식 (get,post)
			url: '/purplaying/admin/bannerByUpload/'+position,                                                                                
			headers:{"content-type" : "application/json"},
			dataType : 'text',
			data : imgsrc,
			success:function(result){
				$('#Banner_img_list').html(toHtmlBannerList(JSON.parse(result)))
				CloseBannerModal()
			},
			error : function(){
				alert("error");
			}					
		});
 	}
  	function showUploadModal(){
  		$('#ImageUploadModal').modal({backdrop: 'static', keyboard: false});
  		$('#ImageUploadModal').modal("show");
  	}
  	function Close_upload_modal(){
  		$('#ImageUploadModal').modal("hide");
  		$('#file_id').val("")
  	}
  	function CloseBannerModal(){
  		$('#banner_Modal').modal('hide');
  		$('#preview_img').attr('src','');
  		$('#banner-header').html("이미지 미리보기");
		$('#banner-body').css('display', 'block');
		$('#banner-position').css('display', 'none');
		$('#gotosaveBtn').css('display','block');
  	}
  	function save_uploadImg(){
  		let fileuuid = $('#prdt_uuid').val()
  		let filename = $('#prdt_image').val()
  		let uploadPath = $('#prdt_uploadpath').val().split('purplaying_file\\')[1]
  		console.log(prdt_uploadpath)
  		$.post('/purplaying/admin/bannersavedb',
				{fileName : filename, fileuuid : fileuuid , uploadPath:uploadPath}, 
				function(result){
			        console.log(result);
			        window.location.reload();
  				})
  	}
  	
  	let toHtmlBannerList = function(list){
  		let tmp = "<table class='table table-hover'><tr class='table-Secondary'><th class='bannerfile_id' scope='col'>번호</th><th class='bannerfile_name' scope='col'>이미지 이름</th>";
  	 	tmp += "<th class='bannerfile_regdate' scope='col'>등록 날짜</th>";
  		tmp += "<th class='bannerfile_save' scope='col'></th></tr>";
  		  		
		list.forEach(function(list_item){
			tmp += '<tr>'
			tmp += '<th id="bannerfile_id">'+list_item.bannerfile_id+'</td>';
			tmp += '<td id="bannerfile_name" class="text-truncate" style="max-width: 512px">'+list_item.bannerfile_file+'</td>';
			tmp += '<td id="bannerfile_regdate">'+toStringByFormatting(list_item.bannerfile_regdate)+'</td>';
			tmp += '<td id="bannerfile_save-'+list_item.bannerfile_id+'">';
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
  	
  	function ShowBannerModal(){
  		eventTarget = event.target
  		let file_id = eventTarget.previousElementSibling.value
  		//alert(file_id)
  		$.ajax({
			type:'post',	//통신방식 (get,post)
			url: '/purplaying/admin/ShowBanner/'+file_id,                                                                                
			headers:{"content-type" : "application/json"},
			dataType : 'text',
			success:function(result){
				//alert('/purplaying/admin/display?file_name='+result)
				$('#preview_img').attr('src','/purplaying/admin/display?file_name='+encodeURIComponent(result))
				$('#banner_Modal').modal({backdrop: 'static', keyboard: false});
				$('#banner_Modal').modal('show');
			},
			error : function(){
				alert("error");
			}					
		});
  	}
  	
  	/*파일 업로드*/
  	function previewimg(){
  		if($('#prdt_thumbnail').attr('src') == ''){
	  		var formData = new FormData()
			var inputFile = $("#file_id")
			var files = inputFile[0].files
			console.log(files)
	
			for (var i=0; i<files.length; i++){
				if(!checkExtension(files[i].name, files[i].size)){
					return false
				}
				formData.append("uploadFile", files[i]);
			}
			
			$.ajax({
				type: 'POST',	
				url: '/purplaying/admin/bannerupload',
				enctype: "multpart/form-data",
				data : formData,
				processData: false,
			    contentType: false,
			    dataType:'json',
				success: function(result) {
					console.log(result)
					$('#gotodeleteBtn').attr('disabled',false)
					showUploadedFile(result)
				},
				error : function() { 
					alert("error") 
				}
			}) 
  		}else{
  			alert('취소후 시도해주세요')
  		}
	}
  	function delete_uploadImg(){
  		let filename = $("#prdt_image").val();
  		let fileuuid = $("#prdt_uuid").val();
  		console.log(filename)
  		console.log(fileuuid)
  		filename = fileuuid+filename
  		let uploadPath = $("#prdt_uploadpath").val();
  		console.log(uploadPath)
	  	$.post('/purplaying/admin/removeFile',{fileName : filename, uploadPath:uploadPath}, function(result){
	        console.log(result);
	        if(result === true){
	        	$("#prdt_thumbnail").attr("style", 'display:none;');
	    		$("#prdt_thumbnail").attr("src", "");
	    		$("#file_id").val('')
	    		$('#prdt_name').val('')
	    		$('#prdt_uuid').val('')
	    		$('#gotodeleteBtn').attr('disabled',true)
	        }
	    })
  	}
  	
  	/* 파일 확장자, 크기 처리 */
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
  	
  	function showUploadedFile(uploadResultArr) {
		var str= "";
		var fileCallPath = "";
		var none="";
		
		$(uploadResultArr).each(function (i, obj) {
			
			// 이미지가 아닌 파일일때, 파일아이콘 출력
			if(!obj.image){
				/* <i class='fa-light fa-file'>"+obj.file_name+"</li> */
				str = "";
			}else{
				// 이미지일때 썸네일 출력
				str = "/purplaying/admin/display?file_name="+encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid+"_"+obj.file_name);
				// 원본 파일 경로 저장
				fileCallPath = "/purplaying/admin/display?file_name="+encodeURIComponent( obj.uploadPath+"/"+obj.uuid+"_"+obj.file_name);
				//$("#prdt_image").val(obj.uuid+"_"+obj.file_name);
				$('#prdt_image').val(obj.file_name);
				$('#prdt_uuid').val(obj.uuid+"_")
				$("#prdt_uploadpath").val('C:\\purplaying_file\\Banner\\'+obj.uploadPath);
			}
		})
		/* uploadResult.append(str); */
		$("#prdt_thumbnail").attr("style", none);
		$("#prdt_thumbnail").attr("src", str);
		
	}
  	
  </script>
	
  <!--푸터 인클루드-->
</body>
</html>