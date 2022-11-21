$(document).ready(function() {			/* main() */
			$("#listBtn").on("click", function() {
				location.href ="<c:url value='/notice/list?page=${page}&pageSize=${pageSize}' />";
			})
			
			$("#removeBtn").on("click", function() {
				if(!confirm("정말로 삭제하시겠습니까?")) return;
				
				let form = $("#form")
				form.attr("action","<c:url value='/notice/remove?page=${page}&pageSize=${pageSize}' />")
				form.attr("method", "post")
				form.submit()
			})
			
			$("#writeBtn").on("click", function() {
				location.href ="<c:url value='/notice/write' />";	
			})
			
			let formCheck = function() {
				let form = document.getElementById("form")
				if(form.title.value=="") {
					alert("제목을 입력해 주세요.")
					form.title.focus()
					return false
				}
				if(form.content.value=="") {
					alert("내용을 입력해 주세요.")
					form.content.focus()
					return false
				}	
				return true;
			}
		})