<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
  <!-- meta태그, CSS, JS, 타이틀 인클루드  -->
  <%@ include file="meta.jsp"%>
  
</head>

<body>
  <!--헤더 인클루드-->
   <%@ include file ="header.jsp" %>
   
   <!--페이지 내용 시작-->
   <section>
      <h1 class="visually-hidden">펀딩 상세페이지</h1>
      <div class="contentsWrap">
          <div class="py-3 text-center">
            <h4><a href="genreliterature">문학</a></h4>
            <h1>진행중인 펀딩명</h1>
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
            <ul class="col-md-4">
              <li id="remaining-day"><small class="text-muted">남은 기간</small><h4 class="text-primary">45일</h4></li>
              <li id="achievement-rate"><small class="text-muted">달성률</small><h4 class="text-primary">75%</h4></li>
              <li id="total-amount"><small class="text-muted">모인 금액</small><h4 class="text-primary">1,805,000원</h4></li>
              <li id="total-supporter"><small class="text-muted">후원자</small><h4 class="text-primary">170명</h4></li>
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
				  <input type="number" class="form-control" id="rewardSelectNum" placeholder="1">
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
              	<input type="button" class="col mx-1 btn btn-outline-info fa-1x fa-heart far" onclick="pickBtn()" value="&#xf004 찜하기">
                <button type="button" class="col mx-1 btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#agree4Modal">공유하기</button>
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
                <button type="button" class="col mx-1 btn btn-outline-info" onclick="location.href='servicecenter'">문의하기</button>
              </div>
              <hr class="my-4">
              <li class="row d-flex border rounded p-3 m-1">
                <div class="col-4"><img src="https://picsum.photos/90" class="img-thumbnail rounded-circle" alt="유저 프로필"></div>
                <div class="col">
                  <h5 class="row text-primary mt-2">창작자 이름</h5>
                  <h6 class="row text-muted">창작자 이메일</h6>
                  <h6 class="row text-muted" onclick="location.href='creatorSearch?=id'">올린 프로젝트 더보기</h6>
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
                      <strong class="my-0 fw-normal bg-info">[슈퍼 얼리버드]</strong>
                      <strong class="fw-normal">01 선물없이 후원하기 +1000원</strong>
                    </div>
                    <div class="card-body">
                      <h5 class="card-title pricing-card-title">1000원</h5>
                      <button type="button" class="w-100 btn btn-outline-primary mt-2" onclick="rewardSelect(1);">이 리워드 펀딩하기</button>
                    </div>
                  </div>
                </div><!-- 리워드 1 end-->
                <div class="col mt-2"><!-- 리워드 2 start-->
                  <div class="card mb-4 rounded-3 shadow-sm">
                    <div class="card-header py-3">
                      <strong class="my-0 fw-normal bg-info">[슈퍼 얼리버드]</strong>
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
                      <strong class="my-0 fw-normal bg-info">[슈퍼 얼리버드]</strong>
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
                      <strong class="my-0 fw-normal bg-info">[슈퍼 얼리버드]</strong>
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
              </div>
            </div>
            <div class="row container mb-4 px-5"><!-- 탭 컨텐츠 start -->
              <div class="tab-content row mx-auto" id="v-pills-tabContent">
                <!-- tab 1 contents -->
                <div class="tab-pane fade show active" id="v-pills-tab01" role="tabpanel" aria-labelledby="v-pills-tab01-tab">
                  <dl class="row">
                    <dt class="col-sm-3"><strong class="text-muted">목표금액</strong></dt>
                    <dd class="col-sm-9"><h6 class="text-info">3,000,000원</h6></dd>
                    <dt class="col-sm-3"><strong class="text-muted">펀딩기간</strong></dt>
                    <dd class="col-sm-9"><h6 class="text-info">2022.11.04 ~ 2022.01.11</h6></dd>
                    <dt class="col-sm-3"><strong class="text-muted">결제예정일</strong></dt>
                    <dd class="col-sm-9"><h6 class="text-info">목표금액 달성시 2022.01.12에 결제 진행</h6></dd>
                  </dl>
                  	<hr class="my-4">
		            <div class="py2"><!-- 프로젝트 상세소개 start -->
		              <h4 class="mt-2">프로젝트 소개</h4>
		              <div class="mt-2" id="projectDetailimg">
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
                </div>
                <!-- tab 3 contents -->
                <div class="tab-pane fade" id="v-pills-tab03" role="tabpanel" aria-labelledby="v-pills-tab03-tab">
                  <div class="text-start">
                    <p>작성자 닉네임 ></p>
                    <div class="row align-items-end">
                      <div class="col-10">
                        <textarea class="form-control" placeholder="내용 작성​" rows="5" style="resize: none;"></textarea>
                      </div>
                      <div class=" col-2 text-start">
                        <button class="btn btn-primary">작 성</button>
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
                        <h6 class="my-0">후원자 닉네임</h6>
                        <p class="my-0 text-small">작성일 ></p>
                      </div>
                      <p class="mb-5">내용 ></p>
                      <!--답글 시작-->
                      <div class="row rounded bg-light p-3 mb-3">
                        <div class="col-1">
                          <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle mt-2" id="ownerimg">
                        </div>
                        <div class="col-11">
                          <div class="border-bottom">
                            <h6 class="my-0">제작자 닉네임 ></h6>
                            <p class="my-0 text-small">작성일 ></p>
                          </div>
                          <p class="mb-5">내용 ></p>
                        </div>
                      </div>
                      <!--답글 종료-->
                    </div>
                  </div>
                  <!--댓글 종료-->
                </div>
              </div>
            </div><!-- 탭 컨텐츠 end -->
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
 <!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
</body>
</html>