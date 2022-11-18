<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <!-- meta태그, CSS, JS, 타이틀 인클루드  -->
  <%@ include file="meta.jsp"%>
  	<link rel="stylesheet" href="resources/assets/css/heart.css">
	<link rel="stylesheet" href="resources/assets/css/indexHover.css">
	<script src="resources/assets/js/heart.js"></script>
	<script src="http://code.jquery.com/jquery-1.11.3.js"></script>
  <style>
  .fa-heart{
  border-radius: 0.375rem; 
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
      <div class="contentsWrap">
      	<form id="form" class="frm" action="" method="post">
      		<input type="hidden" name="prdt_id" value="${productDetailDto.prdt_id}"><br>
      	  <div class="py-3 text-center">
      	  
            <h4>
            	<c:choose>
                	<c:when test="${productDetailDto.prdt_genre eq 1 }"><a class="card-cate" onclick="location.href='genre/literature'">문학</a></c:when>
                 	<c:when test="${productDetailDto.prdt_genre eq 2 }"><a class="card-cate" onclick="location.href='genre/poemessay'">시/에세이</a></c:when>
                 	<c:when test="${productDetailDto.prdt_genre eq 3 }"><a class="card-cate" onclick="location.href='genre/webtoon'">웹툰</a></c:when>
            	</c:choose>
            </h4>

            <h1>${productDetailDto.prdt_name}</h1>
          </div>
          <div class="row mb-2"> <!-- 상세페이지 상단 start-->
            <!--thumbnail start-->
            <div id="projectCarousel" class="carousel slide col-md-8" data-bs-ride="carousel">
              <div class="carousel-inner">
                <div class="carousel-project active" id="projectCarousel01">
                  <div class="container"></div>
                </div>
              </div>
            </div>
            <!--thumbnail end-->
            <ul class="col-md-4" id="move">
              <li id="remaining-day"><small class="text-muted">남은 기간</small><h4 class="text-primary">${productDetailDto.prdt_dday}일</h4></li>
              <li id="achievement-rate"><small class="text-muted">달성률</small><h4 class="text-primary">${productDetailDto.prdt_percent}%</h4></li>
              <li id="total-amount"><small class="text-muted">모인 금액</small><h4 class="text-primary">${productDetailDto.prdt_currenttotal}</h4></li>
              <li id="total-supporter"><small class="text-muted">후원자</small><h4 class="text-primary">n명</h4></li>
              <li><hr class="mb-2"></li>
              <li class="row justify-content-end pb-3"><!-- 리워드 셀렉트 영역  -->
              	<div class="col-8">
              		<label for="rewardSelectLabel" class="form-label">리워드 선택</label>
	              	<select class="form-select fs-6" id="rewardSelect" name="rewardSelect">
					  <option selected>리워드를 선택해주세요</option>
					  <option value="1">01 선물없이 후원하기 +1000원</option>
					  <option value="2">02 프리미엄 메탈 케이스_싱글set</option>
					  <option value="3">03 프리미엄 메탈 케이스_싱글set</option>
					  <option value="4">04 프리미엄 메탈 케이스_싱글set</option>
					</select>
				</div>
				<div class="col">
              	  <label for="rewardSelectNumLabel" class="form-label">수량</label>
				  <input type="number" class="form-control" id="rewardSelectNum" placeholder="1" min="1">
				</div>
              </li>
              <li>
              	<div class="input-group mb-3">
              	  <span for="rewardSelectPrice" class="input-group-text">금액</span>
				  <input type="number" class="form-control" id="rewardSelectPrice" placeholder="1000" readonly>
				</div>
              </li>
              <li><button type="button" class="btn btn-primary container btn-lg mb-3" onclick="location.href='payment'">펀딩하기</button></li>
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
                <input type="button" class="col mx-1 btn fa-1x fa-question-circle far" style="color: rgb(156, 102, 255);" onclick="location.href='servicecenter'" value="&#xf059 문의하기">
              </div>
              <hr class="my-4">
              <li class="row d-flex border rounded p-3 m-1">
                <div class="col-4"><img src="https://picsum.photos/90" class="img-thumbnail rounded-circle" alt="유저 프로필"></div>
                <div class="col">
                  <h5 class="row text-primary mt-2">${productDetailDto.user_name}</h5>
                  <h6 class="row text-muted">${productDetailDto.user_id}</h6>
                  <h6 class="row" onclick="location.href='creatorSearch?=id'" style="color: #9E62FA; cursor:pointer;">올린 프로젝트 더보기</h6>
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
                <div class="col mt-2"><!-- 리워드 1 start-->
                  <div class="card mb-4 rounded-3 shadow-sm">
                    <div class="card-header py-3">
                      <strong class="my-0 fw-normal bg-info">[슈퍼 얼리버드]</strong><br>
                      <strong class="fw-normal">01 선물없이 후원하기 +1000원</strong>
                    </div>
                    <div class="card-body">
                      <h5 class="card-title pricing-card-title">1000원</h5>
                      <div class="mt-3 row px-3"><br></div>
                      <div class="row px-3"><br></div>
                      <button type="button" class="w-100 btn btn-outline-primary mt-2" onclick="rewardSelect(1);">이 리워드 펀딩하기</button>
                    </div>
                  </div>
                </div><!-- 리워드 1 end-->
                <div class="col mt-2"><!-- 리워드 2 start-->
                  <div class="card mb-4 rounded-3 shadow-sm">
                    <div class="card-header py-3">
                      <strong class="my-0 fw-normal bg-info">[슈퍼 얼리버드]</strong><br>
                      <strong class="fw-normal">02 프리미엄 메탈 케이스_싱글set</strong>
                    </div>
                    <div class="card-body">
                      <h5 class="card-title pricing-card-title">10000원</h5>
                      <span class="mt-3 row px-3">(선택)4가지 색상 중 택 1</span>
                      <small class="text-info fs-6 row px-3">남은 수량 : 3개</small>
                      <button type="button" class="w-100 btn btn-outline-primary mt-2" onclick="rewardSelect(2);">이 리워드 펀딩하기</button>
                    </div>
                  </div>
                </div><!-- 리워드 2 end-->
                <div class="col mt-2"><!-- 리워드 3 start-->
                  <div class="card mb-4 rounded-3 shadow-sm">
                    <div class="card-header py-3">
                      <strong class="my-0 fw-normal bg-info">[슈퍼 얼리버드]</strong><br>
                      <strong class="fw-normal">03 프리미엄 메탈 케이스_싱글set</strong>
                    </div>
                    <div class="card-body">
                      <h5 class="card-title pricing-card-title">10000원</h5>
                      <span class="mt-3 row px-3">(선택)4가지 색상 중 택 1</span>
                      <small class="text-info fs-6 row px-3">남은 수량 : 3개</small>
                      <button type="button" class="w-100 btn btn-outline-primary mt-2" onclick="rewardSelect(3);">이 리워드 펀딩하기</button>
                    </div>
                  </div>
                </div><!-- 리워드 3 end-->
                <div class="col mt-2"><!-- 리워드 4 start-->
                  <div class="card mb-4 rounded-3 shadow-sm">
                    <div class="card-header py-3">
                      <strong class="my-0 fw-normal bg-info">[슈퍼 얼리버드]</strong><br>
                      <strong class="fw-normal">04 프리미엄 메탈 케이스_싱글set</strong>
                    </div>
                    <div class="card-body">
                      <h5 class="card-title pricing-card-title">10000원</h5>
                      <span class="mt-3 row px-3">(선택)4가지 색상 중 택 1</span>
                      <small class="text-info fs-6 row px-3">남은 수량 : 3개</small>
                      <button type="button" class="w-100 btn btn-outline-primary mt-2" onclick="rewardSelect(4);">이 리워드 펀딩하기</button>
                    </div>
                  </div>
                </div><!-- 리워드 4 end-->
              </div>
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
                    <dd class="col-sm-9"><h6 class="text-info"><fmt:formatNumber value="${productDetailDto.prdt_goal }" pattern="#,###" /> 원</h6></dd>
                    <dt class="col-sm-3"><strong class="text-muted">펀딩기간</strong></dt>
                    <dd class="col-sm-9">
                    	<h6 class="text-info">
                    		<fmt:formatDate pattern ="yyyy/MM/dd" value="${productDetailDto.prdt_opendate}"/> ~ <fmt:formatDate pattern ="yyyy/MM/dd" value="${productDetailDto.prdt_enddate}"/>
						</h6>
					</dd>
                    <dt class="col-sm-3"><strong class="text-muted">결제예정일</strong></dt>
                    <dd class="col-sm-9"><h6 class="text-info">목표금액 달성시 <fmt:formatDate pattern ="yyyy/MM/dd" value="${productDetailDto.prdt_purchaseday}"/>에 결제 진행</h6></dd>
                  </dl>
                  	<hr class="my-4">
		            <div class="py2"><!-- 프로젝트 상세소개 start -->
		              <h4 class="mt-2">프로젝트 소개</h4>
		              <div class="mt-2" id="projectDetailimg">
		              		${productDetailDto.prdt_desc_detail}
		                  <img src="resources/assets/img/Book1_reward.jpg">
		              </div>
		            </div><!-- 프로젝트 상세소개 end -->
                </div>
                <!-- tab 2 contents -->
                <div class="tab-pane fade" id="v-pills-tab02" role="tabpanel" aria-labelledby="v-pills-tab02-tab">
                  <div class="accordion accordion-flush" id="accordionFlushExample"><!--아코디언 시작-->
                    <div class="accordion-item"><!--아코디언 아이템1 시작-->
                      
                      <h5 class="accordion-header" id="flush-heading1">
                        <button class="accordion-button collapsed link-primary" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse1" aria-expanded="ture" aria-controls="flush-collapseOne">
                          2022-10-12
                        </button>
                      </h5>
                      
                      <div id="flush-collapse1" class="accordion-collapse collapse text-start" aria-labelledby="flush-heading1" data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">
                          <ul class="row container">
                            <li id=""><h5>[2차 사은품 추가 지급 및 D세트 추가 안내]</h5></li>
                            <li id=""><p>안녕하세요! 매일매일 새로운 재미 네이버웹툰입니다! 눈 깜짝할 사이에 달성해버린 5,000%에 다시 한 번 감사의 인사를 드립니다.</p></li>
                          </ul>
                          <div class="pt-3"><!-- 업데이트 내용 입력 / 수정 영역 -->
                          <div class="pt-3 text-end" id="ModiBtn1" style="display: block;">
                	        <button type="button" class="btn btn-primary" onclick="showHide('ModiArea1'); showHide('ModiBtn1');">업데이트 내역 추가하기</button>
                          </div>
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
                    <div class="accordion-item"><!--아코디언 아이템2 시작-->
                      
                      <h5 class="accordion-header" id="flush-heading2">
                        <button class="accordion-button collapsed link-primary" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse2" aria-expanded="false" aria-controls="flush-collapseOne">
                          2022-10-11
                        </button>
                      </h5>
                      
                      <div id="flush-collapse2" class="accordion-collapse collapse text-start" aria-labelledby="flush-heading2" data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">
                          <ul class="row container">
                            <li id=""><h5>[2차 사은품 추가 지급 및 D세트 추가 안내]</h5></li>
                            <li id=""><p>안녕하세요! 매일매일 새로운 재미 네이버웹툰입니다! 눈 깜짝할 사이에 달성해버린 5,000%에 다시 한 번 감사의 인사를 드립니다.</p></li>
                          </ul>
                        </div>
                      </div>
                    </div><!--아코디언 아이템2 종료-->
                  </div>
               	  <div class="pt-3"><!-- 업데이트 내용 입력 / 수정 영역 -->
                    <div class="pt-3 text-end" id="writeBtn2" style="display: block;">
                	  <button type="button" class="btn btn-primary" onclick="showHide('writeArea2'); showHide('writeBtn2');">업데이트 내역 추가하기</button>
                    </div>
                    <div class="align-items-end" id="writeArea2" style="display: none;">
                      <div class="col-10">
                        <input type="text" class="form-control" placeholder="업데이트 제목 작성​" rows="5">
                        <textarea class="form-control mt-1" placeholder="업데이트 내용 작성​" rows="5" style="resize: none;"></textarea>
                        <div class="text-end">
                          <button type="button" class="mt-1 btn btn-primary" onclick="showHide('writeArea2'); showHide('writeBtn2');">작성</button>
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
                        <textarea id="form" class="form-control" placeholder="내용 작성​" rows="5" style="resize: none;" name="content" >${communityDto.content }</textarea>
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
                <!-- tab 4 contents -->
                <div class="tab-pane fade" id="v-pills-tab04" role="tabpanel" aria-labelledby="v-pills-tab04-tab">
                  <div>
                    <div>
                      <h4 style="font-weight: bold;">이 프로젝트의 정보 및 정책을<br />반드시 확인하세요.</h4>
                      <br/>
                      <h5 style="font-weight: bold;">펀딩 취소 및 리워드 옵션 변경, 배송지 변경 안내</h5>
                      <p class="text-muted">펀딩 결제는 예약 상태로 유지되다가, 펀딩 마감일 다음 영업일 <strong><fmt:formatDate pattern ="yyyy/MM/dd" value="${productDetailDto.prdt_purchaseday}"/> 17시</strong>에 모두
                      함께 진행됩니다. 결제 정보 변경은 결제가 진행되기 전까지 언제나 가능합니다. 참여한 펀딩 정보 변경은 펀딩 내역에서 진행해주세요. 마감일 이후에는 
                      펀딩에 대한 리워드 제작 및 배송이 시작되어, 취소와 더불어 배송지 및 리워드 옵션 변경은 <strong><fmt:formatDate pattern ="yyyy/MM/dd" value="${productDetailDto.prdt_limitday}"/></strong> 이후로는 
                      불가합니다.</p>
                      <br/>
                    </div>
                    <hr></hr>
                    <div>
                      <br/>
                      <p class="text-muted">만일 수령한 리워드에 하자가 존재하거나 창작자가 약속한 발송시작일에 발송이 이루어지지 않은 경우 펀딩금 반환 신청이 
                      가능합니다.<br/>
                      <strong>퍼플레잉 프리오더 프로젝트는 전자상거래법의 적용을 받아,</strong> 리워드가 마음에 들지 않는 경우에도 펀딩금 반환 신청이
                      가능합니다.<br/></p>
					  <br/>
					  <h5 style="font-weight: bold;">펀딩금 반환 안내</h5>
					  <p class="text-muted">펀딩 종료 후, 아래 정책에 따라 펀딩금 반환 신청을 할 수 있습니다. 펀딩금 반환은 투자자가 펀딩한 결제 건을 
					  취소하는 방식으로 이뤄집니다.<br/>
					  펀딩금 반환은 <a href="/purplaying/mypage" style="text-decoration: underline; color: #9E62FA; font-weight: 
					  bold;"> 마이페이지 > 펀딩현황</a>에서 신청하실 수 있습니다.<br/></p>
					  <br/>
					  <h6 style="font-weight: bold;">1) 리워드가 지연될 경우</h6>
					  <p class="text-muted"><strong>창작자가 리워드 발송 시작 예정일까지 리워드를 발송하지 않을 경우,</strong> 투자자는 펀딩금 반환 
					  신청을 할 수 있습니다.<br/>
					  리워드 별 발송 시작 예정일은 다를 수 있으니, <a href="/purplaying/mypage" style="text-decoration: underline; color: #AAAAAA;">
					  마이페이지 > 펀딩현황</a>에서 펀딩한 리워드의 발송 시작 예정일을 확인하세요.<br/></p>
					  <h6 style="font-weight: bold;">2) 리워드에 하자가 있거나 단순변심인 경우</h6>
					  	<ul class="text-muted">
					  	  <li>- 투자자 단순변심에 의한 교환/펀딩금 반환은 리워드 배송 완료일로부터 7일 이내에 신청할 수 있습니다. (반품 배송비 투자자 부담)</li>
						  <li>- 다음의 경우에는 단순변심에 의한 펀딩금 반환을 신청할 수 없습니다.</li>
						    <ul>
						  	  <li>- 투자자의 귀책사유로 인하여 리워드가 멸실 또는 훼손된 경우</li>
						  	  <li>- 투자자의 리워드 사용 또는 일부 소비로 인해 리워드의 가치 등이 현저히 감소한 경우</li>
					  	  	  <li>- 시간이 지나 다시 판매하기가 곤란할 정도로 리워드의 가치가 현저히 감소한 경우</li>
						      <li>- 복제가 가능한 리워드의 포장이 훼손된 경우</li>
						      <li>- 투자자의 주문에 따라 개별적으로 생산되는 리워드로서 펀딩 시 반품이나 교환의 제한을 명시적으로 고지하고 투자자의 동의를 받은 
						      경우</li>
						      <li>- 기타 법령 및 규정에 의해 리워드의 반품이 제한되는 경우</li>
						    </ul>
						  <li>- 투자자는 표시 또는 광고와 상이한 리워드가 배송된 경우, 리워드의 배송완료일로부터 90일 이내 또는 해당 사실을 인지하거나 인지할 수 
						  있었던 날로부터 30일 이내에 펀딩금 반환을 요청할 수 있습니다. (반품 배송비 창작자 부담)</li>
					  	</ul>
					  <br/>
					  <h6 style="font-weight: bold;"> 기타 주의 사항</h6>
					  <p class="text-muted" style="font-size: small;">회사는 창작자와 상호 협의 하에 프로젝트를 취소할 수 있으며, 펀딩 종료 후 
					  프로젝트가 취소될 경우에는 펀딩금이 반환됩니다.<br/>
					  ※ 더 자세한 사항은 <a href="/purplaying/fundingguide" style="text-decoration: underline; color: #AAAAAA;"> 펀딩금 반환 정책</a>
					  에서 확인하세요.</p>
                    </div>
                  </div>
                </div>
              </div>
            </div><!-- 탭 컨텐츠 end -->
            </form>
          </div><!-- 상세페이지 하단 종료 -->
      	</div>
       
    </section>
   <!--페이지 내용 종료-->
   
   <!-- 찜하기 JS -->
   <script src="resources/assets/js/pickBtn.js"></script> 
   <!-- 리워드 선택 JS  -->
   <script src="resources/assets/js/rewardSelect.js"></script> 
   <!-- 페이지 URL copy JS -->
   <script src="resources/assets/js/copyURL.js"></script> 
   <!-- 페이지 URL 가져오는 JS  -->
   <script>document.getElementById("showURL").value = window.location.pathname;</script>
   <!-- show / hide JS -->
   <script src="resources/assets/js/showHide.js"></script> 
  <!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
</body>
</html>