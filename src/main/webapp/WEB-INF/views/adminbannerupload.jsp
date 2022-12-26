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
  	
	//배너 설정시 위치선택 요청 function
	function setBannerNext(){
		$('#banner-header').html("배너위치 선택");
		$('#gotochangeBtn').css('display', 'none');
		$('#banner-body').css('display', 'none');
		$('#banner-position').css('display', 'block');
		$('#gotosaveBtn').css('display','none');
	}
	//배너 설정 요청 function
	function setBanner(){
  		let position = event.target.getAttribute("id")	//이벤트 발생 요소 id속성 저장
  		let imgsrc = $('#preview_img').attr('src')	//미리보기 이미지 주소 저장
  		
  		$.ajax({		//배너 설정 ajax로 요청
			type:'post',	
			url: '/purplaying/admin/bannerByUpload/'+position,                                                                                
			headers:{"content-type" : "application/json"},
			dataType : 'text',
			data : imgsrc,
			success:function(result){	//배너설정 모달 요청 성공시 호출
		        window.location.reload();	//페이지 새로고침
				CloseBannerModal()		//배너설정 모달 종료 function 호출
			},
			error : function(){
				alert("error");		//배너설정 모달 요청 실패시 호출
			}					
		});
 	}
	
	//파일업로드 모달 호출 function
  	function showUploadModal(){
  		$('#ImageUploadModal').modal({backdrop: 'static', keyboard: false});
  		$('#ImageUploadModal').modal("show");		//파일업로드 모달 출력
  	}
  	//파일업로드 모달 종료 function
  	function Close_upload_modal(){
  		$('#ImageUploadModal').modal("hide");		//배너설정 모달 종료
  		$('#file_id').val("")
  	}
  	//배너 설정 모달 종료 function
  	function CloseBannerModal(){
  		$('#banner_Modal').modal('hide');		//배너설정 모달 종료
  		$('#preview_img').attr('src','');
  		$('#banner-header').html("이미지 미리보기");
		$('#banner-body').css('display', 'block');
		$('#banner-position').css('display', 'none');
		$('#gotosaveBtn').css('display','block');
  	}
  	
  	//파일업로드 저장 요청 function
  	function save_uploadImg(){
  		let fileuuid = $('#prdt_uuid').val()	//파일uuid 저장
  		let filename = $('#prdt_image').val()	//파일명 저장
  		let uploadPath = $('#prdt_uploadpath').val().split('purplaying_file\\')[1]	//파일 저장 경로 저장
  		console.log(prdt_uploadpath)
  		$.post('/purplaying/admin/bannersavedb',
				{fileName : filename, fileuuid : fileuuid , uploadPath:uploadPath}, //파일 저장 요청시 필요한 data Json형태로 저장
				function(result){	//파일저장 성공시 호출
			        window.location.reload();	//페이지 새로고침
  				})
  	}
  	
    //배너설정 모달 요청 function
  	function ShowBannerModal(){
  		eventTarget = event.target		//이벤트 발생시킨 html태그 저장
  		let file_id = eventTarget.previousElementSibling.value		//이벤트 발생 요소기준 부모,자식관계 이용 파일번호 저장
  		$.ajax({
			type:'post',
			url: '/purplaying/admin/ShowBanner/'+file_id,                                                                                
			headers:{"content-type" : "application/json"},
			dataType : 'text',
			success:function(result){		//배너설정 모달 요청 성공시 호출
				$('#preview_img').attr('src','/purplaying/admin/display?file_name='+encodeURIComponent(result))
				$('#banner_Modal').modal({backdrop: 'static', keyboard: false});
				$('#banner_Modal').modal('show');		//배너설정 모달 출력
			},
			error : function(){
				alert("error");	//배너설정 모달 요청 실패시 호출
			}					
		});
  	}
  	
  	/*파일 업로드*/
  	function previewimg(){
  		if($('#prdt_thumbnail').attr('src') == ''){		//펀딩이미지가 있을 경우 호출
	  		var formData = new FormData()
			var inputFile = $("#file_id")
			var files = inputFile[0].files
	
			for (var i=0; i<files.length; i++){
				if(!checkExtension(files[i].name, files[i].size)){
					return false
				}
				formData.append("uploadFile", files[i]);
			}
			
			$.ajax({	//파일업로드 ajax 요청
				type: 'POST',	
				url: '/purplaying/admin/bannerupload',
				enctype: "multpart/form-data",
				data : formData,
				processData: false,
			    contentType: false,
			    dataType:'json',
				success: function(result) { 	//파일업로드 성공시 호출
					$('#gotodeleteBtn').attr('disabled',false)
					showUploadedFile(result)	//파일 미리보기 function요청
				},
				error : function() { //파일업로드 실패시 호출
					alert("error") 
				}
			}) 
  		}else{		//펀딩이미지가 없을 경우 호출
  			alert('취소후 시도해주세요')
  		}
	}
  	
  	//업로드한 이미지 삭제 요청 function
  	function delete_uploadImg(){
  		let filename = $("#prdt_image").val();
  		let fileuuid = $("#prdt_uuid").val();
  		filename = fileuuid+filename
  		let uploadPath = $("#prdt_uploadpath").val();
	  	$.post('/purplaying/admin/removeFile',{fileName : filename, uploadPath:uploadPath}, //파일삭제 요청시 필요한 data Json형태로 저장
	  		function(result){
	        if(result === true){ //ajax처리후 반환받은 갑이 true면 요청
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
  	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$")	//파일 확장자 확인
	var maxSize = 5242880 //5MB
	
	//파일유형,사이즈 확인 function
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
  	
  	//파일 미리보기 function
  	function showUploadedFile(uploadResultArr) {
		var str= "";
		var fileCallPath = "";
		var none="";
		
		$(uploadResultArr).each(function (i, obj) {
			if(!obj.image){
				str = "";
			}else{
				// 이미지일때 썸네일 출력
				str = "/purplaying/admin/display?file_name="+encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid+"_"+obj.file_name);
				// 원본 파일 경로 저장
				fileCallPath = "/purplaying/admin/display?file_name="+encodeURIComponent( obj.uploadPath+"/"+obj.uuid+"_"+obj.file_name);
				$('#prdt_image').val(obj.file_name);	//파일 이름 저장
				$('#prdt_uuid').val(obj.uuid+"_")		//파일 uuid저장
				$("#prdt_uploadpath").val('C:\\purplaying_file\\Banner\\'+obj.uploadPath);	//파일 저장경로 저장
			}
		})
		$("#prdt_thumbnail").attr("style", none);
		$("#prdt_thumbnail").attr("src", str);
		
	}
  	
  </script>
	
  <!--푸터 인클루드-->
</body>
</html>