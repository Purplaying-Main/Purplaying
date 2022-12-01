function alretBtn() {
	   let _buttonI = event.target;

	   if (_buttonI.classList.contains("far")) {
		  
		    $.ajax({
						type : 'post',				//요청 메서드
						url : '/purplaying/like/addlike',				//요청 URI
						headers :	{ "content-type" : "application/json"},				//요청 헤더
						data : JSON.stringify({prdt_id:Number(prdt_id)}),				// 서버로 전송할 데이터. stringify()로 직렬화 필요.
						success : function(result) {				// 서버로부터 응답이 도착하면 호출될 함수
					 		 _buttonI.classList.add("fas");
						   _buttonI.classList.add("active");
						   _buttonI.classList.remove("far");
						   _buttonI.innerText="알림 ON";
						   _buttonI.classList.remove("text-muted");
						   _buttonI.classList.add("text-info");
						   	location.reload();
				     	},
				    	error : function() { alert("error") }			//에러가 발생했을 때, 호출될 함수
					})
		   
	   } else {
	   $.ajax({
						type : 'post',				//요청 메서드
						url : '/purplaying/like/removelike',				//요청 URI
						headers :	{ "content-type" : "application/json"},				//요청 헤더
						data : JSON.stringify({prdt_id:Number(prdt_id)}),				// 서버로 전송할 데이터. stringify()로 직렬화 필요.
						success : function(result) {				// 서버로부터 응답이 도착하면 호출될 함수
						  	_buttonI.classList.remove("fas");
							   _buttonI.classList.remove("active");
							   _buttonI.classList.add("far");
							   _buttonI.innerText="알림 OFF";
							   _buttonI.classList.remove("text-info");
							   _buttonI.classList.add("text-muted");
					      	location.reload();
				     	},
				    	error : function() { alert("error") }			//에러가 발생했을 때, 호출될 함수
					})
		   
	   }
	}