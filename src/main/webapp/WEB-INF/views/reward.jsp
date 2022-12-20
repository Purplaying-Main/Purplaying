<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<div class="row pb-3 mt-4">
            <%-- <div class="<c:if test='${empty reward_list }'>col-4</c:if>"> --%>
       	<div class="col-4" >
       		<div id="BtnGroup" >
       		<div id="rewardCard">
       			<!-- 추가하기전 수정시 아이템확인후 출력 -->
       			<div id="rewardCardBefore" >
	       			<c:forEach var="rewardDto" items="${dto}">
	       				<div id="${rewardDto.reward_id}">
		       			<div class="card mb-3"><!--reward start-->
			                <div class="card-header">
				               <%-- <div style="display:none;">${rewardDto.reward_id}</div> --%>
				               
				               <div class="d-md-flex text-end">
				               		<button class="btn btn-outline-primary btn-sm me-md-2 modBtn" data-reward-id="${rewardDto.reward_id}" type="button" >M</button>
				               		<button class="btn btn-outline-danger btn-sm delBtn" data-reward-id="${rewardDto.reward_id}" type="button" >D</button>
				               </div>
	                    	</div>
			                <div class="card-body">
			                  <span class="my-0 fw-normal bg-info">${rewardDto.reward_category == 1 ? "슈퍼얼리버드" : "얼리버드"}</span>
			                  <span>리워드 #${rewardDto.row_number}</span><br/>
			                  <h5 class="card-title mt-1">${rewardDto.reward_name}</h5>
			                  <h5 class="card-title text-primary">${rewardDto.reward_price}원</h5>
			                  <p class="card-text">${rewardDto.reward_desc}</p>
			                </div>
			                <div class="card-footer text-muted">
			                  수량 ${rewardDto.reward_stock}개
			                </div>
		            	</div>
		            	</div>
		            </c:forEach>
       			</div>
       			</div>
       		</div>

              <!-- 리워드 수정 modal start -->
              <div class="modal fade" id="rewardModiModal" tabindex="-1" aria-labelledby="rewardModiModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header p-5 pb-4 border-bottom-0">
                      <h5 class="fw-bold mb-0">리워드 수정</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-5 pt-0">
                      <h5>리워드 카테고리</h5>
		              <p>리워드 카테고리를 정해주세요.</p>
		              <select class="search-option" id="reward_modi_category">
						<option value="0" selected>카테고리를 선택해주세요</option>
						<option value="1" >슈퍼 얼리버드</option>
						<option value="2" >얼리버드</option>
					  </select>
		              <hr class="mb-4">
                   	  <h5>리워드 이름</h5>
		              <p>리워드 이름을 정해주세요.</p>
		              <textarea class="form-control mt-2" id="reward_modi_name" placeholder="리워드의 이름을 입력하세요" rows="1" style="resize: none;"></textarea>
		              <hr class="mb-4">
                      <h5>리워드 금액</h5>
		              <p>배송이 필요한 선물을 배송비를 포함해주세요.</p>
		              <textarea  class="form-control mt-2" id="reward_modi_price" placeholder="1000원 이상의 금액을 입력하세요" rows="1" style="resize: none;"></textarea>
		              <hr class="mb-4">
		              <h5>리워드 설명</h5>
		              <textarea class="form-control mt-2" id="reward_modi_desc" placeholder="리워드 상품 구성을 적어주세요" rows="5" style="resize: vertical;"></textarea>
		              <hr class="mb-4">
		              <h5>수량 제한(추가옵션)</h5><span class="text-muted">수량 제한이 없을 경우 -1을 입력</span>
		              <textarea  class="form-control mt-2" id="reward_modi_stock" placeholder="수량을 입력해 주세요." rows="1" style="resize: none;"></textarea>
		              <hr class="mb-4">
                      <input class="w-100 my-3 btn btn-lg rounded-3 btn-primary" id="saveRewardModi" type="button" value="리워드 저장"/>
                    </div><!-- modal body -->
                  </div>
                </div>
              </div> <!-- Modal end-->
               <!-- 리워드 삭제 modal start -->
              <div class="modal fade" id="rewardDelModal" tabindex="-1" aria-labelledby="rewardDelModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header p-5 pb-4 border-bottom-0">
                      <h5 class="fw-bold mb-0">리워드 삭제</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-5 pt-0">
                      <form class="">
                        <div class="form-floating mb-3">
                          <h4>리워드를 삭제 하시겠습니까?</h4>
                          <p>삭제된 리워드는 복구되지 않습니다.</p>
                        </div>
                        <button class="w-100 my-3 btn btn-lg rounded-3 btn-primary" type="button" id="deleteRewardModi">리워드 삭제</button>
                      </form>
                    </div><!-- modal body -->
                  </div>
                </div>
              </div> <!-- Modal end-->
              
            </div>
            <div class="col-8 px-3">
              <h5>리워드 만들기</h5>
              <p>리워드는 후원자에게 프로젝트의 가치를 전달하는 수단입니다. 다양한 금액대로 여러 개의 리워드를 만들어주세요. 펀딩 성공률이 높아지고, 더 많은 후원 금액을 모금할 수 있어요.</p>
              <hr class="mb-4">
              <h5>리워드 카테고리</h5>
              <p>리워드 카테고리를 정해주세요.</p>
              <select class="form-select" id="reward_category">
				<option value="0" selected>카테고리를 선택해주세요</option>
				<option value="1" >슈퍼 얼리버드</option>
				<option value="2" >얼리버드</option>
			  </select>
              <hr class="mb-4">
              <h5>리워드 이름</h5>
              <p>리워드 이름을 정해주세요.</p>
              <textarea id="reward_name" class="form-control mt-2" placeholder="리워드 이름을 입력하세요" rows="1" style="resize: none;"></textarea>
              <hr class="mb-4">
              <h5>리워드 금액</h5>
              <p>배송이 필요한 선물을 배송비를 포함해주세요.</p>
              <textarea id="reward_price" class="form-control mt-2" placeholder="1000원 이상의 금액을 입력하세요" rows="1" style="resize: none;"></textarea>
              <hr class="mb-4">
              <h5>리워드 설명</h5>
              <textarea id="reward_desc" class="form-control mt-2" placeholder="리워드 상품 구성을 적어주세요" rows="5" style="resize: vertical;"></textarea>
              <hr class="mb-4">
              <h5>수량 제한(추가옵션)</h5><span class="text-muted">수량 제한이 없을 경우 -1을 입력</span>
              <textarea id="reward_stock" class="form-control mt-2" placeholder="수량을 입력해 주세요." rows="1" style="resize: none;"></textarea>
          	  <hr class="mb-4">
          	  
            </div>
            <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
              <button class="btn btn-outline-primary me-md-2" type="button" id="add_reward">추가하기</button>
              <button class="btn btn-outline-secondary" type="button">초기화</button>
            </div>
          </div>
	
	<script type="text/javascript">
		
		$(document).ready(function(){
			$('#BtnGroup').on("click",".delBtn",function(){
				let reward_id = $(this).attr("data-reward-id")	//클릭한 버튼의 reward_id가져오기
				//alert(reward_id)
				$('#rewardDelModal').modal("show");
				$('#deleteRewardModi').click(function(){
					$.ajax({
						type:'post',	//통신방식 (get,post)
						url: '/purplaying/pr/deletereward/'+prdt_id,                                                                                
						headers:{"content-type" : "application/json"},
						dataType : 'text',
						data : JSON.stringify({reward_id:reward_id}),
						success:function(result){
							//alert(result);
							$('#rewardDelModal').modal("hide");
							$("#BtnGroup").html(toHtml(JSON.parse(result)));
						},
						error : function(){
							alert("print error");
						}					
					});
				});
			});
			//$('#BtnGroup').on("click","#rewardModBtn",function(){
			$('#BtnGroup').on("click",".modBtn",function(){
				let reward_id = $(this).attr("data-reward-id")	//클릭한 버튼의 reward_id가져오기
				//alert(reward_id)
				$.ajax({
					type:'post',	//통신방식 (get,post)
					url: '/purplaying/pr/findmodireward',                                                                                
					headers:{"content-type" : "application/json"},
					dataType : 'text',
					data : JSON.stringify({reward_id:reward_id}),
					success:function(result){
						reward2 = JSON.parse(result);
						$("#reward_modi_name").val(reward2.reward_name);
						$("#reward_modi_price").val(reward2.reward_price);
						$("#reward_modi_desc").val(reward2.reward_desc);
						$("#reward_modi_stock").val(reward2.reward_stock);
						$("#reward_modi_category").val(reward2.reward_category);
						$('#rewardModiModal').modal("show");
						$("#prdt_id").val();
					},
					error : function(){
						alert("error");
					}					
				});
				
				$('#saveRewardModi').click(function(){
					let reward_modi_name = $("#reward_modi_name").val();
					let reward_modi_price = $("#reward_modi_price").val();
					let reward_modi_desc = $("#reward_modi_desc").val();
					let reward_modi_stock = $("#reward_modi_stock").val();
					let reward_modi_category = $("#reward_modi_category").val();
					let prdt_id = $("#prdt_id").val();
					//alert(reward_id)
					let modi_reward = {
							reward_id:reward_id,
							reward_name:reward_modi_name,
							reward_price:reward_modi_price,
							reward_desc:reward_modi_desc,
							reward_stock:reward_modi_stock,
							reward_category:reward_modi_category,
							prdt_id:prdt_id,
							};
					$.ajax({
						type:'post',	//통신방식 (get,post)
						url: '/purplaying/pr/modireward',                                                                                
						headers:{"content-type" : "application/json"},
						dataType : 'text',
						data : JSON.stringify(modi_reward),
						success:function(result){
							$('#rewardModiModal').modal("hide");
							$("#BtnGroup").html(toHtml(JSON.parse(result)));
						},
						error : function(){
							alert("error");
						}					
					});
				});
			});
			
			$('#add_reward').click(function(){
				let reward_name = $("#reward_name").val();
				let reward_price = $("#reward_price").val();
				let reward_desc = $("#reward_desc").val();
				let reward_stock = $("#reward_stock").val();
				let reward_category = $("#reward_category").val();
				let prdt_id = $("#prdt_id").val();
				let reward = {reward_name:reward_name,reward_price:reward_price,reward_desc:reward_desc,reward_stock:reward_stock,reward_category:reward_category, prdt_id:prdt_id};
				$.ajax({
					type:'post',	//통신방식 (get,post)
					url: '/purplaying/pr/reward',                                                                                
					headers:{"content-type" : "application/json"},
					dataType : 'text',
					data : JSON.stringify(reward),
					success:function(result){
						//alert(result);
						$('#reward_category option[value=0]').prop('selected', 'selected').change();
						let select_item = $("#reward_category option:selected").val();
						$("#reward_category").val(select_item);
						$("#rewardCardBefore").html(style="display:none;");
						$("#BtnGroup").html(toHtml(JSON.parse(result)));
						$("#reward_name").val("");
						$("#reward_price").val("");
						$("#reward_desc").val("");
						$("#reward_stock").val("");
						//$("#reward_category").val("");			
					},
					error : function(){
						alert("error");
					}					
				});
			});
		});
			
		let toHtml = function(rewards){
			let tmp = "";
			let catergory_name="";
			rewards.forEach(function(reward){
				if(reward.reward_category == 1) {
					catergory_name = '슈퍼얼리버드';
				} else{
					catergory_name = '얼리버드';
				}
				tmp += '<div id="'+reward.reward_id+'">';
				tmp += '<div class="card mb-3"><div class="card-header">';
				tmp += '<div class="d-md-flex text-end">';
				tmp += '<button class="btn btn-outline-primary btn-sm me-md-2 modBtn" data-reward-id="'+reward.reward_id+'" type="button">M</button>';
				tmp += '<button class="btn btn-outline-danger btn-sm delBtn" data-reward-id="' + reward.reward_id + '" type="button">D</button>';
				tmp += '</div></div>';
				tmp += '<div class="card-body"><span class="my-0 fw-normal bg-info">'+ catergory_name+'</span>';	
				tmp += '<span>리워드 #'+reward.row_number+'</span><br/>';
				tmp += '<h5 class="card-title mt-1">'+reward.reward_name+'</h5>';
				tmp += '<h5 class="card-title text-primary">'+reward.reward_price+'원</h5>';
				tmp += '<p class="card-text">'+reward.reward_desc+'</p>';
				tmp += '</div><div class="card-footer text-muted">수량'+reward.reward_stock+'개</div></div>';
				tmp += '</div>';
			});
			return tmp;
		}
	</script>