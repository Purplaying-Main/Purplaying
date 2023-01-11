<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<meta name="_csrf_header" content="${_csrf.headerName}">
  	<meta name="_csrf" content="${_csrf.token}">

  <div class="wrapper">
  	<input type="hidden" id="user_profile" value="${prc.user_profile }">
  	<div class="input-group mb-3">
   		<input type="file" class="form-control" name="file_id" id="file_id" value="${attachFileDto.file_id}"/>
    	<button class="btn btn-outline-primary" id="fileAddBtn">Upload</button>
   	</div>
   	<div class="bg-light p-2" id="uploadResult" style="height:260px;">
    	<img width="100%" height="240px" id="user_profile_preview" name="user_profile_preview" src="${prc.user_profile }">
  	</div>
  </div>
   
   <!-- <script src="resources/assets/js/profileUpload.js"></script> -->
   
   <script type="text/javascript">
		var header = $("meta[name='_csrf_header']").attr('content');
		var token = $("meta[name='_csrf']").attr('content');
		/* 이미지 미리보기(섬네일 출력) */
		var uploadResult = $("#uploadResult");
		/* 첨부파일 파일명 인코딩 처리 */
		function showUploadedFile(uploadResultArr) {
			var str= "";
			var fileCallPath = "";
			var none="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg";
			let user_no = $("#user_no").val()
			
			$(uploadResultArr).each(function (i, obj) {
				// 이미지가 아닌 파일일때, 파일아이콘 출력
				if(!obj.image){
					/* <i class='fa-light fa-file'>"+obj.file_name+"</li> */
					str = "/purplaying/file/profile/display?file_name=/"+encodeURIComponent( obj.uploadPath+"/"+obj.uuid+"_"+obj.file_name);
				}else{
					// 이미지일때 썸네일 출력
					str = "/purplaying/file/profile/display?file_name=/"+encodeURIComponent( obj.uploadPath+"/"+obj.uuid+"_"+obj.file_name);
					// 원본 파일 경로 저장
					fileCallPath = "/purplaying/file/profile/display?file_name=/"+encodeURIComponent( obj.uploadPath+"/"+obj.uuid+"_"+obj.file_name);
					console.log("fileCallPath",fileCallPath)
				}
			})
			/* uploadResult.append(str); */
			$("#user_profile_preview").attr("src", str);
			$("#user_profile").attr("value", fileCallPath);
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
	
	$(document).ready(function() {	
		/* 파일 업로드 */
		$("#fileAddBtn").on("click", function() {
			var formData = new FormData()
			var inputFile = $("#file_id")
			var files = inputFile[0].files
			console.log(files)
			let user_no = $("#user_no").val()

			for (var i=0; i<files.length; i++){
				if(!checkExtension(files[i].name, files[i].size)){
					return false
				}
				formData.append("uploadFile", files[i]);
				formData.append("user_no", user_no);
			}
			
			$.ajax({
				type: 'POST',	
				url: '/purplaying/file/profile/upload',
				enctype: "multpart/form-data",
				data : formData,
				processData: false,
			    contentType: false,
			    dataType:'json',
			    beforeSend: function(xhr){
			        xhr.setRequestHeader(header, token);
			    },
				success: function(result) {
					console.log(result)
					showUploadedFile(result)				
					},
				error : function() { alert("error") }
			}) 
		})
		
		$("#modifyUserBtn").on("click", function() {
			let user_profile = $("#user_profile_preview").attr("src");
			console.log(user_profile)
			
			let user_no = $("#user_no").val()
			console.log(user_no)
			
			const userData = { // Body에 첨부할 json 데이터
					user_profile:user_profile,
	            }
	            
			//alert("userData:"+JSON.stringify(userData))
			
			$.ajax({
				type: 'PATCH',
				url: '/purplaying/setting/profile/'+user_no,
				headers : { "content-type" : "application/json-patch+json; charset=utf-8" }, 		//요청 헤더
                data: JSON.stringify(userData),
                beforeSend: function(xhr){
			        xhr.setRequestHeader(header, token);
			    },
				success : function() { 
					console.log("modify Profile success")
					location.reload(); // 페이지 전체 새로고침
				},
				error : function() { alert("error") }
			})
		})
		
	})

   </script>