window.onload = function(){
	document.getElementById("address").addEventListener("click", function(){ //주소입력칸을 클릭하면
          //카카오 지도 발생
		new daum.Postcode({
			oncomplete: function(data) { //선택시 입력값 세팅
				var addr = '';
			    var extraAddr = '';
			
			    if (data.userSelectedType === 'R') { 
			    	addr = data.roadAddress;
			    } else { 
			    	addr = data.jibunAddress;
			    }
			
			    document.getElementById('address_num').value = data.zonecode;		//우편번호
			    document.getElementById("address").value = addr;				//주소
			    document.getElementById("address_detail").focus();				//상세주소
			}
		}).open();
	});

	document.getElementById("address_num").addEventListener("click", function(){ //주소입력칸을 클릭하면
		//카카오 지도 발생
		new daum.Postcode({
			oncomplete: function(data) { //선택시 입력값 세팅
				var addr = '';
				var extraAddr = '';
			
				if (data.userSelectedType === 'R') { 
					addr = data.roadAddress;
				} else { 
					addr = data.jibunAddress;
				}
			
				document.getElementById('address_num').value = data.zonecode;		//우편번호
				document.getElementById("address").value = addr;				//주소
				document.getElementById("address_detail").focus();				//상세주소
			}
		}).open();
	});
}
  
//주소 찾기 (버튼으로 호출)
    function execDaumPostcode() { 
         new daum.Postcode({
              oncomplete: function(data) {
                  var addr = '';
                 var extraAddr = '';
  
                 if (data.userSelectedType === 'R') { 
                      addr = data.roadAddress;
                 } else { 
                 }
  
                  document.getElementById('address_num').value = data.zonecode;
                  document.getElementById('address').value = addr;
                  document.getElementById('address_detail').focus();
              }
          }).open();
          
    document.getElementById("Modaddress").ModaddEventListener("click", function(){ //주소입력칸을 클릭하면
          //카카오 지도 발생
		new daum.Postcode({
			oncomplete: function(data) { //선택시 입력값 세팅
				var addr = '';
			    var extraAddr = '';
			
			    if (data.userSelectedType === 'R') { 
			    	addr = data.roadAddress;
			    } else { 
			    	addr = data.jibunAddress;
			    }
			
			    document.getElementById('Modaddress_num').value = data.zonecode;		//우편번호
			    document.getElementById("Modaddress").value = addr;				//주소
			    document.getElementById("Modaddress_detail").focus();				//상세주소
			}
		}).open();
	});

	document.getElementById("Modaddress_num").ModaddEventListener("click", function(){ //주소입력칸을 클릭하면
		//카카오 지도 발생
		new daum.Postcode({
			oncomplete: function(data) { //선택시 입력값 세팅
				var addr = '';
				var extraAddr = '';
			
				if (data.userSelectedType === 'R') { 
					addr = data.roadAddress;
				} else { 
					addr = data.jibunAddress;
				}
			
				document.getElementById('Modaddress_num').value = data.zonecode;		//우편번호
				document.getElementById("Modaddress").value = addr;				//주소
				document.getElementById("Modaddress_detail").focus();				//상세주소
			}
		}).open();
	});
}
  
//주소 찾기 (버튼으로 호출)
    function ModexecDaumPostcode() { 
         new daum.Postcode({
              oncomplete: function(data) {
                  var addr = '';
                 var extraAddr = '';
  
                 if (data.userSelectedType === 'R') { 
                      addr = data.roadAddress;
                 } else { 
                 }
  
                  document.getElementById('Modaddress_num').value = data.zonecode;
                  document.getElementById('Modaddress').value = addr;
                  document.getElementById('Modaddress_detail').focus();
              }
          }).open();
      } //API reference  http://postcode.map.daum.net/guide