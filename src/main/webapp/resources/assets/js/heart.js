function clickBtntest() {
		   let _buttonI = event.target;
		   let prdt_id = "";
		   const childElement = _buttonI.firstChild;

		   if (_buttonI.classList.contains("likeBtn")) {
			   if (childElement.classList.contains("far")) {
			       prdt_id = _buttonI.nextElementSibling.onclick.toString()
				   prdt_id = prdt_id.substring(prdt_id.lastIndexOf('/')+1).split("'");
				   prdt_id = prdt_id[0]
				   //alert(prdt_id)
				   $.ajax({
						type : 'post',				//요청 메서드
						url : '/purplaying/like/addlike',				//요청 URI
						headers :	{ "content-type" : "application/json"},				//요청 헤더
						data : JSON.stringify({prdt_id:Number(prdt_id)}),				// 서버로 전송할 데이터. stringify()로 직렬화 필요.
						beforeSend: function(xhr){
  			        		xhr.setRequestHeader(header, token);
  			   			},
						success : function(result) {				// 서버로부터 응답이 도착하면 호출될 함수
							childElement.classList.add("fas");
						    childElement.classList.add("active");
						    childElement.classList.remove("far");
						   	location.reload();
				     	},
				    	error : function() { alert("error") }			//에러가 발생했을 때, 호출될 함수
					})
			      //addlikecnt();
			   } else {
			      
			      prdt_id = _buttonI.nextElementSibling.onclick.toString()
				  prdt_id = prdt_id.substring(prdt_id.lastIndexOf('/')+1).split("'");
				  prdt_id = prdt_id[0]
				  //alert(prdt_id)
			      $.ajax({
						type : 'post',				//요청 메서드
						url : '/purplaying/like/removelike',				//요청 URI
						headers :	{ "content-type" : "application/json"},				//요청 헤더
						data : JSON.stringify({prdt_id:Number(prdt_id)}),				// 서버로 전송할 데이터. stringify()로 직렬화 필요.
						beforeSend: function(xhr){
  			        		xhr.setRequestHeader(header, token);
  			    		},
						success : function(result) {				// 서버로부터 응답이 도착하면 호출될 함수
							childElement.classList.remove("fas");
						    childElement.classList.remove("active");
						    childElement.classList.add("far");
						    alert(_buttonI.nextSibling.innerHTML)
					      	location.reload();
				     	},
				    	error : function() { alert("error") }			//에러가 발생했을 때, 호출될 함수
					})
			   }
		   } else {
			   if (_buttonI.classList.contains("far")) {
				   prdt_id = _buttonI.parentElement.nextElementSibling.onclick.toString()
				   prdt_id = prdt_id.substring(prdt_id.lastIndexOf('/')+1).split("'");
				   prdt_id = prdt_id[0]
				   //alert(prdt_id)
				   $.ajax({
						type : 'post',				//요청 메서드
						url : '/purplaying/like/addlike',				//요청 URI
						headers :	{ "content-type" : "application/json"},				//요청 헤더
						data : JSON.stringify({prdt_id:Number(prdt_id)}),				// 서버로 전송할 데이터. stringify()로 직렬화 필요.
						beforeSend: function(xhr){
  			        		xhr.setRequestHeader(header, token);
  			    		},
						success : function(result) {				// 서버로부터 응답이 도착하면 호출될 함수
					 		_buttonI.classList.add("fas");
					   		_buttonI.classList.add("active");
						   	_buttonI.classList.remove("far");
						   	location.reload();
				     	},
				    	error : function() { alert("error") }			//에러가 발생했을 때, 호출될 함수
					})
				  // addlikecnt();
			   } else {
			      prdt_id = _buttonI.parentElement.nextElementSibling.onclick.toString()
				  prdt_id = prdt_id.substring(prdt_id.lastIndexOf('/')+1).split("'");
				  prdt_id = prdt_id[0]
				  //alert(prdt_id)
			      $.ajax({
						type : 'post',				//요청 메서드
						url : '/purplaying/like/removelike',				//요청 URI
						headers :	{ "content-type" : "application/json"},				//요청 헤더
						data : JSON.stringify({prdt_id:Number(prdt_id)}),				// 서버로 전송할 데이터. stringify()로 직렬화 필요.
						beforeSend: function(xhr){
  			        		xhr.setRequestHeader(header, token);
  			    		},
						success : function(result) {				// 서버로부터 응답이 도착하면 호출될 함수
						  	_buttonI.classList.remove("fas");
					      	_buttonI.classList.remove("active");
					      	_buttonI.classList.add("far");
					      	location.reload();
				     	},
				    	error : function() { alert("error") }			//에러가 발생했을 때, 호출될 함수
					})
			      //removelikecnt();
			   }
		   }
		}