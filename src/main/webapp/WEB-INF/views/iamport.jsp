<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

   	<div class="modal fade" data-keyboard="false" data-backdrop="static" id="pointpayModal" role="dialog" tabindex="-1" aria-labelledby="pointpayModalLabel" aria-hidden="true" >
		<div class="modal-dialog" role="document">
			<div class="modal-content">
	            <div class="modal-header p-5 pb-4 border-bottom-0">
	                <h5 class="fw-bold mb-0">포인트 충전하기</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="delpointPay()"></button>
	            </div>
                <div class="modal-body p-5 pt-0">
                	<input type="hidden" id="payaddress_num" />
                	<input type="hidden" id="payaddress" />
                	<input type="hidden" id="payuser_no" value="${UserDto.user_no}" />
                	<input type="hidden" id="payuser_id" value="${UserDto.user_id}" />
                	<input type="hidden" id="payuser_name" value="${UserDto.user_name}" />
                	<input type="hidden" id="payuser_phone" value="${UserDto.user_phone}" />
                    <select id="point_price" class="form-select fs-6" onchange="pointSelect()">
						<option value="0"selected disabled>금액을 선택해주세요</option>
						<option value="10">10원</option>
						<option value="1000">1,000원</option>
						<option value="5000">5,000원</option>
						<option value="10000">10,000원</option>
						<option value="50000">50,000원</option>
						<option value="100000">100,000원</option>
						<option value="500000">500,000원</option>
					</select>
				</div>
                <div class="modal-footer">
                    <button id="gotopayBtn" class="btn btn-primary" disabled="disabled" onclick="gotopay()">충전하기</button> 
                </div>
          <!-- modal body -->
		    </div>
		</div>
	</div>
   
  <script>
  function gotopay(){
		data = {
 	          merchant_uid: createOrderNum(),
 	          name: "퍼플레잉",
 	          amount: $('#point_price').val(),
 	          buyer_email: $('#payuser_id').val(),
 	          buyer_name: $('#payuser_name').val(),
 	          buyer_tel: $('#payuser_phone').val().substr(0,3)+"-"+$('#payuser_phone').val().substr(3,7)+"-"+$('#payuser_phone').val().substr(7,11),
 	          buyer_addr: $('#payaddress').val(),
 	          buyer_postcode: $('#payaddress_num').val()
  	}
		requestPay(data)
	}
	
	 function requestPay(data) {
	  		  var IMP = window.IMP;
	  	  	  IMP.init("imp78380323"); 
	      // IMP.request_pay(param, callback) 결제창 호출
	      IMP.request_pay({ // param
	          pg: "html5_inicis",
	          pay_method: "card",
	          merchant_uid: data.merchant_uid,
	          name: data.name,
	          amount: data.amount,
	          buyer_email: data.buyer_email,
	          buyer_name: data.buyer_name,
	          buyer_tel: data.buyer_tel,
	          buyer_addr: data.buyer_addr,
	          buyer_postcode: data.buyer_postcode
	      }, function (rsp) { // callback
    	    	console.log(rsp);
    	    	$.ajax({
  	        	type : "POST",
  	        	url : "/purplaying/iamport/verifyIamport/" + rsp.imp_uid 
  	        }).done(function(data) {
  	        	console.log(data);
  	        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
  	        	if(rsp.paid_amount == data.response.amount){
  		        	alert("결제 및 결제검증완료");
  		        	$.ajax({
  						type:'post',	
  						url: '/purplaying/iamport/insertpoint/'+rsp.paid_amount,                                                                                
  						headers:{"content-type" : "application/json"},
  						dataType : 'text',
  						success:function(result){
  							$('#user_point').html("현재 보유 포인트 : "+result)
  							$('#pointpayModal').modal("hide");
  						},
  						error : function(){
  							alert("포인트 충전 오류");
  						}					
  					});
  	        	} else {
  	        		alert("결제 실패");
  	        	}
  	        });
  		});
		}
	 
	  	function createOrderNum(){
	  		const date = new Date();
	  		const year = date.getFullYear();
	  		const month = String(date.getMonth() + 1).padStart(2, "0");
	  		const day = String(date.getDate()).padStart(2, "0");
	  		
	  		let orderNum = year + month + day;
	  		for(let i=0;i<10;i++) {
	  			orderNum += Math.floor(Math.random() * 8);	
	  		}
	  		return orderNum;
	  	}
	  	
  	function pointSelect(){
  		let user_no = $("#payuser_no").val()
  		$('#gotopayBtn').attr('disabled',false)
			$.ajax({
      		type: 'POST',			//요청 메서드
				url: '/purplaying/setting/addresslist/'+user_no,		// 요청 URI
				success : function(result) {			// 서버로부터 응답이 도착하면 호출될 함수 
					console.log(result[0].address)
					$("#payaddress").val(result[0].address)		// result는 서버가 전송한 데이터
					$("#payaddress_num").val(result[0].address_num)	
				},
				error : function() { alert("error") }	// 에러가 발생할 때, 호출될 함수 
      	})
  		
  	}
  	function delpointPay(){
  		$('#point_price').val(0)
  		$('#gotopayBtn').attr('disabled',true)
  	}
 
  </script>

</html>