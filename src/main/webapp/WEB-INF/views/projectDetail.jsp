<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <!-- meta태그, CSS, JS, 타이틀 인클루드  -->
  <%@ include file="meta.jsp"%>
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/heart.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/indexHover.css">
  <style>
  .fa-heart{
  border-radius: 0.375rem; 
  }
  #selectRewardBox {
  display: none;
  }
  </style>
</head>

<body>
	<script type="text/javascript">
	let chat_prdt_no = 1
	
	let showList = function(chat_prdt_no) {
		$.ajax({
			type : 'GET',		//요청 메서드
			url : '/heart/communitys?chat_prdt_no='+chat_prdt_no,		// 요청 URI
			success : function(result) {			// 서버로부터 응답이 도착하면 호출될 함수
				$("#communityList").html(result)		// result는 서버가 전송한 데이터
			},
			error : function() { alert("error") }	// 에러가 발생할 때, 호출될 함수
		})
	}
	
	$(document).ready(function() {
		$("v-pills-tab03").click(function() {
			showList(chat_prdt_no)
		})
	})
</script>
	
  <!--헤더 인클루드-->
   <%@ include file ="header.jsp" %>
   
   
  
			
   <!--페이지 내용 시작-->
   <section>
      <h1 class="visually-hidden">펀딩 상세페이지</h1>
      <div class="contentsWrap col-10 mx-auto">
      	<form id="form" class="frm" action="" method="post">
      		<input type="hidden" name="prdt_id" id="prdt_id" value="${projectDto.prdt_id}"><br>
      	  <div class="py-3 text-center"> 	  
            <h4>
            	<c:choose>
                	<c:when test="${projectDto.prdt_genre eq 1 }"><a class="card-cate" onclick="location.href='/purplaying/genre/literature'">문학</a></c:when>
                 	<c:when test="${projectDto.prdt_genre eq 2 }"><a class="card-cate" onclick="location.href='/purplaying/genre/poemessay'">시/에세이</a></c:when>
                 	<c:when test="${projectDto.prdt_genre eq 3 }"><a class="card-cate" onclick="location.href='/purplaying/genre/webtoon'">웹툰</a></c:when>
            	</c:choose>
            </h4>
            <h1>${projectDto.prdt_name}</h1>
          </div>
          <div class="row mb-2"> <!-- 상세페이지 상단 start-->
            <!--thumbnail start-->
            <div class="col" id="projectCarousel">
	            <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
				  <div class="carousel-inner">
				    <div class="carousel-item carousel-detail active">
				      <img style="${display_thumbnail}" src="${projectDto.prdt_img}" class="d-block w-100" id="prdt_img">
				    </div>
				  </div>
				</div>
            </div>
            <!--thumbnail end-->
            <ul class="col-md-4" id="move">
              <li id="remaining-day"><small class="text-muted">남은 기간</small><h4 class="text-primary">${projectDto.prdt_dday}일</h4></li>
              <li id="achievement-rate"><small class="text-muted">달성률</small><h4 class="text-primary">${projectDto.prdt_percent}%</h4></li>
              <li id="total-amount"><small class="text-muted">모인 금액</small><h4 class="text-primary">${projectDto.prdt_currenttotal}</h4></li>
              <li id="total-supporter"><small class="text-muted">후원자</small><h4 class="text-primary">${projectDto.prdt_buyercnt}명</h4></li>
              <li><hr class="mb-2"></li>
              <li class="row justify-content-end pb-3"><!-- 리워드 셀렉트 영역  -->
              	<div class="col">
              		<label for="rewardSelectLabel" class="form-label">리워드 선택</label>
	              	<select  id="addReward" class="form-select fs-6" name="rewardSelect">
	              	  <option selected disabled>리워드를 선택해주세요</option>
					  <c:forEach var="rewardDto" items="${dto}">
					  	<option value="${rewardDto.reward_id}">${rewardDto.row_number}. ${rewardDto.reward_name} +${rewardDto.reward_price}원</option>
					  </c:forEach>
					</select>
				</div>
				
<!-- 				<div class="col">
              	  <label for="rewardSelectNumLabel" class="form-label">수량</label>
				  <input type="number" class="form-control" id="rewardSelectNum" placeholder="1" min="1">
				</div> -->
              </li>
              <li>
              	<div class="form-floating mb-3">
              		<div id="selectRewardBox">
              			
              		</div>
<!-- 				  <textarea class="form-control" placeholder="선택한 리워드 출력 영역" id="floatingTextarea" style="resize: none;" row=5 readonly></textarea>
				  <label for="floatingTextarea">선택한 리워드 리스트</label> -->
				</div>
              </li>
              <li>
              	<div class="input-group mb-3">
              	  <span for="rewardSelectPrice" class="input-group-text">총 금액</span>
				  <input type="text" class="form-control text-end" id="rewardTotalPrice" value="0" placeholder="1000" readonly>
				</div>
              </li>
              <li><button type="button" class="btn btn-primary container btn-lg mb-3" onclick="location.href='${pageContext.request.contextPath}/payment/${prdt_id}'">펀딩하기</button></li>
              <div class="row px-2 justify-content-between">
              	<input type="button" class="col mx-1 btn fa-1x fa-heart far" style="color: rgb(156, 102, 255);" onclick="pickBtn()" value="&#xf004 찜하기">
                <input type="button" class="col mx-1 btn fa-1x fa-thin fa-share-from-square far" style="color: rgb(156, 102, 255);" data-bs-toggle="modal" data-bs-target="#agree4Modal" value="&#xf14d 공유하기">
                  <!-- 공유하기 Modal -->
                  <div class="modal fade" id="agree4Modal" tabindex="-1" aria-labelledby="agree4ModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title" id="agree4ModalLabel">펀딩 공유하기</h5>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-footer">
                          <input class="col-10" id="showURL" readonly>
                          <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="copyURL()">복사</button>
                        </div>
                      </div>
                    </div>
                  </div> <!-- Modal end-->
                <input type="button" class="col mx-1 btn fa-1x fa-question-circle far" style="color: rgb(156, 102, 255);" onclick="location.href='${pageContext.request.contextPath}/oneonone/list'" value="&#xf059 문의하기">
              </div>
              <hr class="my-2">
              <li class="row d-flex p-2 m-1">
                <div class="col-3"><img src="https://picsum.photos/46" class="img-thumbnail rounded-circle" alt="유저 프로필"></div>
                <div class="col">
                  <h6 class="row text-muted">${projectDto.writer}</h6>
                  <small class="row text-muted">${projectDto.user_id}</small>
                  <small class="row" onclick="location.href='${pageContext.request.contextPath}/creatorSearch?=id'" style="color: #9E62FA; cursor:pointer;">창작자의 다른 프로젝트 더보기</small>
                </div>
              </li>
            </ul>
          </div><!-- 상세페이지 상단 end -->
          <div class="row mb-2"><!-- 상세페이지 하단 start-->
          <hr class="mb-4">
            <!-- 리워드 -->
	              <h4 class="d-flex mt-2">리워드 선택하기
	              	<div class="dropdown px-2">
					  <button class="btn btn-secondary dropdown-toggle btn-sm" type="button" data-bs-toggle="dropdown" aria-expanded="false">
					    얼리버드 타입
					  </button>
					  <ul class="dropdown-menu">
					    <li><a class="dropdown-item" href="#">슈퍼얼리버드</a></li>
					    <li><a class="dropdown-item" href="#">얼리버드</a></li>
					  </ul>
				  	</div>
	              </h4>
	              
              <div class="row row-cols-1 row-cols-md-4 mb-3 text-center w-100">
              	<c:forEach var="rewardDto" items="${dto}">
	                <div class="col mt-2"><!-- 리워드 card start-->
	                  <div class="card mb-4 rounded-3 shadow-sm">
	                    <div class="card-header py-3">
	                      <strong class="my-0 fw-normal bg-info">${rewardDto.reward_category == 1 ? "슈퍼얼리버드" : "얼리버드"}</strong><br>
	                      <strong class="fw-normal">#${rewardDto.row_number} ${rewardDto.reward_name}</strong>
	                    </div>
	                    <div class="card-body">
	                      <h5 class="card-title pricing-card-title d-flex justify-content-between"><span>${rewardDto.reward_desc }</span><span>${rewardDto.reward_price}원</span></h5>
	                      <div class="mt-3 text-info text-end">남은 수량 ${rewardDto.reward_stock }</div>
	                      <div class="px-3"><br></div>
	                      <button type="button" class="w-100 btn btn-outline-primary mt-2" onclick="jumpUp()">이 리워드 선택하기</button>
	                    </div>
	                  </div>
	                </div><!-- 리워드 card end-->
	             </c:forEach>
            </div><!-- 리워드 end -->
            <!-- 프로젝트 작성 페이지 탭 -->
            <div class="mb-4"> <!-- 탭 메뉴 -->
              <div class="nav nav-tabs" id="v-pills-tab" role="tablist">
                <button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab01" type="button" role="tab" aria-controls="v-pills-tab01" aria-selected="true">프로젝트 기본정보</button>
                <button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab02" type="button" role="tab" aria-controls="v-pills-tab02" aria-selected="false">업데이트</button>
                <button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab03" type="button" role="tab" aria-controls="v-pills-tab03" aria-selected="false">커뮤니티</button>
                <button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab04" type="button" role="tab" aria-controls="v-pills-tab04" aria-selected="false">정책</button>
              </div>
            </div>
            <div class="row container mb-4 px-5"><!-- 탭 컨텐츠 start -->
              <div class="tab-content row mx-auto" id="v-pills-tabContent">
                <!-- tab 1 contents -->
                <div class="tab-pane fade show active" id="v-pills-tab01" role="tabpanel" aria-labelledby="v-pills-tab01-tab">
                  <dl class="row">
                    <dt class="col-sm-3"><strong class="text-muted">목표금액</strong></dt>
                    <dd class="col-sm-9"><h6 class="text-info"><fmt:formatNumber value="${projectDto.prdt_goal }" pattern="#,###" /> 원</h6></dd>
                    <dt class="col-sm-3"><strong class="text-muted">펀딩기간</strong></dt>
                    <dd class="col-sm-9">
                    	<h6 class="text-info">
                    		<fmt:formatDate pattern ="yyyy-MM-dd" value="${projectDto.prdt_opendate}"/> ~ <fmt:formatDate pattern ="yyyy-MM-dd" value="${projectDto.prdt_enddate}"/>
						</h6>
					</dd>
                    <dt class="col-sm-3"><strong class="text-muted">결제예정일</strong></dt>
                    <dd class="col-sm-9"><h6 class="text-info">목표금액 달성시 <fmt:formatDate pattern ="yyyy/MM/dd" value="${projectDto.prdt_purchaseday}"/>에 결제 진행</h6></dd>
                  </dl>
                  	<hr class="my-4">
		            <div class="py2"><!-- 프로젝트 상세소개 start -->
		              <h4 class="mt-2">프로젝트 소개</h4>
		              <div class="mt-2" id="projectDetailimg">
		              		${projectDto.prdt_desc_detail}
		              </div>
		            </div><!-- 프로젝트 상세소개 end -->
                </div>
                <!-- tab 2 contents -->
                <div class="tab-pane fade" id="v-pills-tab02" role="tabpanel" aria-labelledby="v-pills-tab02-tab">
                  <div class="accordion accordion-flush" id="accordionFlushExample"><!--아코디언 시작-->
                    <c:forEach var="updateDto" items="${list_update}">
                    <div class="accordion-item"><!--아코디언 아이템1 시작-->
                      
                      <h5 class="accordion-header" id="flush-heading-${updateDto.row_number}">
                        <button class="accordion-button collapsed link-primary" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-${updateDto.row_number}" aria-expanded="ture" aria-controls="flush-collapseOne">
                        	${updateDto.update_regdate_string}
                        </button>
                      </h5>
                      
                      <div id="flush-collapse-${updateDto.row_number}" class="accordion-collapse collapse text-start" aria-labelledby="flush-heading-${updateDto.row_number}" data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">
                          <ul class="row container">
                            <li id=""><h5>${updateDto.update_title}</h5></li>
                            <li id=""><p>${updateDto.update_desc}</p></li>
                          </ul>
                          <div class="pt-3"><!-- 업데이트 내용 입력 / 수정 영역 -->
                          <div class="align-items-end" id="ModiArea1" style="display: none;">
                            <div class="col-10">
                              <input type="text" class="form-control" placeholder="업데이트 제목 작성​" rows="5">
                              <textarea class="form-control mt-1" placeholder="업데이트 내용 작성​" rows="5" style="resize: none;"></textarea>
                              <div class="text-end">
                                <button type="button" class="mt-1 btn btn-primary" onclick="showHide('ModiArea1'); showHide('ModiBtn1');">작성</button>
                                <button type="button" class="mt-1 btn btn-primary" onclick="showHide('ModiArea1'); showHide('ModiBtn1');">취소</button>
                              </div>
                            </div>
                          </div>
                        </div>
                        </div>
                      </div>
                    </div><!--아코디언 아이템1 종료-->
                   </c:forEach>
                  </div>
               	  <div class="pt-3"><!-- 업데이트 내용 입력 / 수정 영역 -->
                    <div class="pt-3 text-end" id="writeBtn2" style="display: block;">
                	  <button type="button" class="btn btn-primary" <c:if test="${sessionScope.user_id ne projectDto.writer}">style="display:none;"</c:if> onclick="showHide('writeArea2'); showHide('writeBtn2');">업데이트 내역 추가하기</button>
                    </div>
                    <div class="align-items-end" id="writeArea2" style="display: none;">
                      <div class="col-10">
                        <input type="text" class="form-control" id="updateTitle" placeholder="업데이트 제목 작성​" rows="5">
                        <textarea class="form-control mt-1" id="updateDesc" placeholder="업데이트 내용 작성​" rows="5" style="resize: none;"></textarea>
                        <div class="text-end">
                          <button type="button" class="mt-1 btn btn-primary" onclick="writeUpdate()">작성</button>
                          <button type="button" class="mt-1 btn btn-primary" onclick="showHide('writeArea2'); showHide('writeBtn2');">취소</button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- tab 3 contents -->
                <div class="tab-pane fade" id="v-pills-tab03" role="tabpanel" aria-labelledby="v-pills-tab03-tab">
                  <div class="text-start">
                    <p> 작성자 닉네임 > ${communityDto.chat_writer }</p>
                    <div class="row align-items-end">
                      <div class="col-10">
                        <textarea class="form-control" placeholder="내용 작성​" rows="5" style="resize: none;" name="content" >${communityDto.content }</textarea>
                      </div>
                      <div class=" col-2 text-start">
                       	 <button type="button" id="creationBtn" class="btn btn-primary">작 성</button>
                      </div>
                      <hr class="mt-3">
                    </div>
                  </div>
                  <!--댓글 시작-->
                  <div class="row text-start">
                    <div class="col-1">
                      <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle mt-2" id="ownerimg">
                    </div>
                    <div class="col-11">
                      <div class="border-bottom">
                      	<h6 class="my-0">후원자 아이디 > ${communityDto.chat_writer }</h6>
                        <p class="my-0 text-small">작성일 > ${communityDto.chat_date }<fmt:formatDate value="${communityDto.chat_date }" pattern="yyyy년 MM월 DD일 EE요일 hh시 mm분 ss초" /></p>
                      </div>
                      <p class="mb-5" >내용 > ${communityDto.chat_context }</p>
                      <!--답글 시작-->
                      <div class="row rounded bg-light p-3 mb-3">
                        <div class="col-1">
                          <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle mt-2" id="ownerimg">
                        </div>
                        <div class="col-11">
                          <div class="border-bottom">
                            <h6 class="my-0">창작자 닉네임 > ${communityDto.chat_writer }</h6>
                            <p class="my-0 text-small">작성일 > ${communityDto.chat_date }<fmt:formatDate value="${communityDto.chat_date }" pattern="yyyy년 MM월 DD일 EE요일 hh시 mm분 ss초" /></p>
                          </div>
                          <p class="mb-5" >내용 > ${communityDto.chat_context }</p>
                        </div>
                      </div>
                      <!--답글 종료-->
                    </div>
                  </div>
                  <!--댓글 종료-->
                </div>
                <!-- tab 4 contents 프로젝트 정책-->
                <div class="tab-pane fade" id="v-pills-tab04" role="tabpanel" aria-labelledby="v-pills-tab04-tab">
	                 <div class="mt-2" id="prdt_desc_policy">
	                  	${projectDto.prdt_desc_policy}
			         </div>
                </div><!-- tab 4 contents end-->
              </div>
            </div><!-- 탭 컨텐츠 end -->
          </form>
        </div><!-- 상세페이지 하단 종료 -->
    </section>
   <!--페이지 내용 종료-->
   
   <!-- 찜하기 JS -->
   <script src="${pageContext.request.contextPath}/resources/assets/js/pickBtn.js"></script> 
   <!-- 리워드 선택 JS  -->
   <script>
	   function jumpUp(){
	   		//const rewardNum = ${rewardDto.row_number};
		   // document.getElementById("addReward").value = rewardNum;
			let ml = document.getElementById("move").offsetLeft;
			let mt = document.getElementById("move").offsetTop;
		    window.scrollTo({top:mt, left: ml, behavior: "smooth"});
		}
   </script>
   <!-- 페이지 URL copy JS -->
   <script src="${pageContext.request.contextPath}/resources/assets/js/copyURL.js"></script> 
   <!-- 페이지 URL 가져오는 JS  -->
   <script>document.getElementById("showURL").value = window.location.pathname+window.location.search;</script>
   <!-- show / hide JS -->
   <script src="${pageContext.request.contextPath}/resources/assets/js/showHide.js"></script> 
   <script>
	   function writeUpdate(){
		   let updateTitle = $('#updateTitle').val();
		   let updateDesc = $('#updateDesc').val();
		   let prdt_id = $('#prdt_id').val();
		   alert(updateTitle);
		   alert(updateDesc);
		   alert(prdt_id);
		   
		   let updateData = {update_title:updateTitle,update_desc:updateDesc,prdt_id:prdt_id};
		   $.ajax({
				type:'post',	
				url: '/purplaying/project/writeUpdate',                                                                                
				headers:{"content-type" : "application/json"},
				dataType : 'text',
				data : JSON.stringify(updateData),
				success:function(result){
					showHide('writeArea2'); 
					showHide('writeBtn2');
				},
				error : function(){
					alert("error");
				}					
			});
	   };
	$(document).ready(function(){
		
   	let selectedRewardName = document.getElementById("selectedRewardName");
   	let selectedRewardPrice = document.getElementById("selectedRewardPrice");
   	
		$("#addReward").change(function(){
			document.getElementById("selectRewardBox").style.display = 'block';
			let list = selectToHtml($('#selectRewardBox').html())
			$('#selectRewardBox').html(list)
			let price_won = $("#addReward option:checked").text().split('+')[1];
			price = price_won.split('원')[0];
			
			$("#rewardCnt").change(function(){
				let rewardTotalPrice = document.getElementById("rewardTotalPrice");
				let rewardCnt = document.getElementById("rewardCnt").value;
				rewardTotalPrice.value = price * rewardCnt;
			});
		});
	});
	function selectToHtml(tmp){
		let getOption =  $("#addReward option:checked").text();
		let name = getOption.split('+')[0];
		let num = name.split('.')[0];
		let price_won = getOption.split('+')[1];
		price = price_won.split('원')[0];
		
		let temp = tmp		
		temp += "<div>";
		temp += '<div class="d-flex justify-content-between">'
		temp += '<span id="selectedRewardName="'+num+'" ">'+name+'</span>'
		temp += '<span id="selectedRewardPrice= "'+num+'" ">'+price_won+'</span>'
		temp +='</div>'
		temp +=	'<div class="row text-end"><span>수량 <input type="number" class="col-1 text-end" id="rewardCnt" value="1" placeholder="1" min="1"/> </span></div>'
		temp += "</div>";
		return temp;
	}
   </script>
  <!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
</body>
</html>