<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authentication property="principal" var="prc"/>


<%-- <c:set var="writerOnly" value="${prc.user_id eq projectDto.writer ? '' : 'display:none' }"/> --%>

<!DOCTYPE html>
<html>
<head>
  <!-- meta태그, CSS, JS, 타이틀 인클루드  -->
  <%@ include file="meta.jsp"%>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/heart.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/indexHover.css">
  <style type="text/css">
  .fa-heart{
  	border-radius: 0.375rem; 
  }
  #selectRewardBox {
  	display: none;
  }
  </style>
</head>
<body>

  <!--헤더 인클루드-->
  <%@ include file ="header.jsp" %>
   
   <!--페이지 내용 시작-->
   <section>
    <sec:authorize access="isAuthenticated()">
		<input type="hidden" id="user_point" value="${prc.user_point }"/>
	</sec:authorize>
	<sec:authorize access="isAnonymous()">
		<input type="hidden" id="user_point" value="-1">
	</sec:authorize>
      <h1 class="visually-hidden">펀딩 상세페이지</h1>
      <div class="contentsWrap col-10 mx-auto">
      <input type="hidden" id="prdt_id" value="${projectDto.prdt_id}" />
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
          <div class="row mb-2">
            <div class="col" id="projectCarousel">
	            <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
				  <div class="carousel-inner">
				    <div class="carousel-item carousel-detail active">
				      <img style="${display_thumbnail}" src="${projectDto.prdt_img}" class="d-block w-100" id="prdt_img">
				    </div>
				  </div>
				</div>
            </div>
            <ul class="col-md-4" id="move">
              <li id="remaining-day"><small class="text-muted">남은 기간</small><h4 class="text-primary">
              <c:choose>
              	<c:when test="${projectDto.prdt_dday >= 0}">${projectDto.prdt_dday}일</c:when>
              	<c:when test="${projectDto.prdt_dday < 0}">펀딩 종료</c:when>
              	<c:otherwise>Dday</c:otherwise>
              </c:choose>
              </h4>
              </li>
              <li id="achievement-rate"><small class="text-muted">달성률</small><h4 class="text-primary">${projectDto.prdt_percent}%</h4></li>
              <li id="total-amount"><small class="text-muted">모인 금액</small><h4 class="text-primary"><fmt:formatNumber value="${projectDto.prdt_currenttotal }" pattern="#,###" />원</h4></li>
              <li id="total-supporter"><small class="text-muted">후원자</small><h4 class="text-primary">${projectDto.prdt_buyercnt}명</h4></li>
              <li><hr class="mb-2"></li>
              <li class="row justify-content-end pb-3">
              <!-- 리워드 셀렉트 영역  -->
              	<div class="col">
              		<label for="rewardSelectLabel" class="form-label">리워드 선택</label>
	              	<select  id="addReward" class="form-select fs-6" name="rewardSelect">
	              	  <option selected disabled>리워드를 선택해주세요</option>
					  <c:forEach var="rewardDto" items="${dto}">
					  	<option value="${rewardDto.reward_id}">${rewardDto.row_number}. ${rewardDto.reward_name} +${rewardDto.reward_price}원</option>
					  </c:forEach>
					</select>
				</div>
              </li>
              <li>
              	<!-- 파라미터로 전달될 리워드 -->
                <form class="selectedRewardForm" id="selectedRewardForm"> 
              	<div class="form-floating mb-3">
              		<div id="selectRewardBox">
              			
              		</div>
				</div>
              </li>
              <li>
              	<div class="input-group mb-3">
              	  <span for="rewardSelectPrice" class="input-group-text">총 금액</span>
				  <input type="text" class="form-control text-end" id="rewardTotalPrice" name="rewardTotalPrice" value="0" placeholder="1000" readonly>
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form>
              </li>
              <li>
              <sec:authorize access="isAnonymous()">              
              	<input type="button" id="doFundingBtn" class="btn btn-primary container btn-lg mb-3" value="${projectDto.prdt_dday < 0 ? '종료된 펀딩입니다' : '펀딩하기' }" ${projectDto.prdt_dday < 0 ? 'disabled' : '' }/>
              </sec:authorize>
              <sec:authorize access="isAuthenticated()">
              	<c:choose>
              		<c:when test="${prc.user_id eq projectDto.writer}"><input type="button" class="btn btn-primary container btn-lg mb-3" value="펀딩관리하기" onclick="location.href='/purplaying/mypage/fundingmanage/${projectDto.prdt_id}'"/></c:when>
              		<c:when test="${projectDto.prdt_dday < 0 and prc.user_id ne projectDto.writer}"><input type="button" class="btn btn-primary container btn-lg mb-3" value="종료된 펀딩입니다" disabled/></c:when>
              		<c:when test="${projectDto.prdt_dday > 0 and prc.user_id ne projectDto.writer}"><input type="button" class="btn btn-primary container btn-lg mb-3" id="doFundingBtn" value="펀딩하기"/></c:when>
              	</c:choose>
              </sec:authorize>
              </li>
              <div class="row px-2 justify-content-between">
              <sec:authorize access="isAuthenticated()">
              	<input type="button" class="col mx-1 btn fa-1x fa-heart ${fn:contains(Likelist, projectDto.prdt_id)? 'fas active' : 'far' }" style="${fn:contains(Likelist, projectDto.prdt_id)? 'color: red;' : 'color: rgb(156, 102, 255);' }" onclick="pickBtn()" value="&#xf004 찜하기">
              </sec:authorize>
              <sec:authorize access="isAnonymous()">
              	<input type="button" class="col mx-1 btn fa-1x fa-heart ${fn:contains(Likelist, projectDto.prdt_id)? 'fas active' : 'far' }" style="${fn:contains(Likelist, projectDto.prdt_id)? 'color: red;' : 'color: rgb(156, 102, 255);' }" onclick="alert('로그인 후 이용해주세요')" value="&#xf004 찜하기">
              </sec:authorize>
                <input type="button" class="col mx-1 btn fa-1x fa-thin fa-share-from-square far" style="color: rgb(156, 102, 255);" data-bs-toggle="modal" data-bs-target="#agree4Modal" value="&#xf14d 공유하기">
                  <!-- 공유하기 Modal -->
                  <div class="modal fade" id="agree4Modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="agree4ModalLabel" aria-hidden="true">
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
                <div class="col-3"><img src="${userDto.user_profile }" alt="${userDto.user_name }" width="32" height="32" class="rounded-circle"></div>
                <div class="col"> 
                  <h6 class="row text-muted">${userDto.user_nickname}</h6>
                  <small class="row text-muted">${userDto.user_id}</small>
                  <small class="row" onclick="location.href='${pageContext.request.contextPath}/creatorSearch/${projectDto.writer}/'" style="color: #9E62FA; cursor:pointer;">창작자의 다른 프로젝트 더보기</small>
                </div>
              </li>
            </ul>
          </div>
          
          <div class="row mb-2">
          <hr class="mb-4">
            <!-- 리워드 -->
	              <h4 class="d-flex mt-2">리워드 선택하기
	              	<div class="dropdown px-2">
					  <button class="btn btn-secondary dropdown-toggle btn-sm" id="rewardOption" type="button" data-bs-toggle="dropdown" aria-expanded="false">
					    리워드 타입
					  </button>
					  <ul class="dropdown-menu">
					    <li><button class="dropdown-item" id="dropDownOption1">슈퍼얼리버드</button></li>
					    <li><button class="dropdown-item" id="dropDownOption2">얼리버드</button></li>
					  </ul>
				  	</div>
	              </h4>	
              <div class="row row-cols-1 row-cols-md-4 mb-3 text-center w-100" id="rewardBox">
              	<c:forEach var="rewardDto" items="${dto}">
	                <div class="col mt-2">
	                <!-- 리워드 card start-->
	                  <div class="card mb-4 rounded-3 shadow-sm" id="reward_Card${rewardDto.reward_category }">
	                    <div class="card-header py-3">
	                      <strong class="my-0 fw-normal bg-info">${rewardDto.reward_category == 1 ? "슈퍼얼리버드" : "얼리버드"}</strong><br>
	                      <input type="hidden" id="reward_id" value="${rewardDto.reward_id }"/>
	                      <strong class="fw-normal">${rewardDto.row_number}. ${rewardDto.reward_name}</strong>
	                    </div>
	                    <div class="card-body">
	                      <h5 class="card-title pricing-card-title">
	                      	<span>${rewardDto.reward_desc }</span>
	                      </h5>
	                      	<div class="text-end"><span class="text-primary mt-3"><fmt:formatNumber value="${rewardDto.reward_price }" pattern="#,###" />원</span></div>
	                         <div class="text-info text-end">남은 수량
	                         	<span class="fw-bold" id="reward_stock${rewardDto.row_number }">
	                         	<c:choose>
									<c:when test="${rewardDto.reward_stock eq -1 }">제한 없음</c:when>
							        <c:when test="${rewardDto.reward_stock > 0 }">${rewardDto.reward_stock}개</c:when>     
							        <c:otherwise>0개</c:otherwise>           
	                         	</c:choose>
	                         	</span> 
	                         </div>
	                      <button type="button" class="w-100 btn btn-outline-primary mt-2" id="reward_btn${rewardDto.row_number }" onclick="jumpUp()">이 리워드 선택하기</button>
	                    </div>
	                  </div>
	                </div><!-- 리워드 card end-->
	             </c:forEach>
            </div><!-- 리워드 end -->
            
            <!-- 프로젝트 탭 -->
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
                   <%--  <dt class="col-sm-3"><strong class="text-muted">결제예정일</strong></dt>
                    <dd class="col-sm-9"><h6 class="text-info">목표금액 달성시 <fmt:formatDate pattern ="yyyy/MM/dd" value="${projectDto.prdt_purchaseday}"/>에 결제 진행</h6></dd> --%>
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
<<<<<<< HEAD
                    	<sec:authorize access="isAuthenticated()">
                	  		<button type="button" class="btn btn-primary" ${prc.user_id eq projectDto.writer ? '': prc.user_role eq 'USER_ADMIN' ? '': 'style="display:none;"' } onclick="showHide('writeArea2'); showHide('writeBtn2');">업데이트 내역 추가하기</button>
                    	</sec:authorize>
=======
                    <sec:authorize access="isAuthenticated()">
                	  <button type="button" class="btn btn-primary" ${prc.user_id eq projectDto.writer ? '': prc.user_role eq 'USER_ADMIN' ? '': 'style="display:none;"' } onclick="showHide('writeArea2'); showHide('writeBtn2');">업데이트 내역 추가하기</button>
                    </sec:authorize>
>>>>>>> branch 'Spring-Security' of https://github.com/Purplaying-Main/Purplaying.git
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
                
                <!-- 댓글 작성 창(회원에게만 노출) -->
                <sec:authorize access="isAuthenticated()">
                  <div class="text-start">
<<<<<<< HEAD
                  <sec:authorize access="isAnonymous()">
						<div id="needLogin" class="text-center">
							<h1>로그인이 필요한 서비스입니다</h1>
						</div>
					</sec:authorize>
                  <sec:authorize access="isAuthenticated()">
                    <p> 작성자 닉네임 > ${sessionScope.UserDto.user_nickname }</p>
=======
                    <p> 작성자 닉네임 > ${prc.user_nickname}</p>
>>>>>>> branch 'Spring-Security' of https://github.com/Purplaying-Main/Purplaying.git
                    <div id="commentStart">
                    	<div class="row align-items-end">
                      		<div class="col-10">
								<textarea class="form-control" id="comment" placeholder="내용 작성​" rows="5" style="resize: none;"></textarea>
                      		</div>
							<div class=" col-2 text-start">
								<button type="button" id="insertBtn" class="btn btn-primary">작 성</button>
							</div>
                   		<hr class="mt-3">
						</div>
                    </div>
                 </div>
                </sec:authorize>
                <div id="f5"></div>
                  <!--작성 댓글 노출-->
                 <input type="hidden" id="rno" value="${replyDto.rno }" />
                  <sec:authorize access="isAuthenticated()">
                	<input type="hidden" id="user_id_for_comment" value="${prc.user_no}" />			<!-- 세션값에 있는 유저번호를 담음 -->
                  </sec:authorize>                  
                  <div id="commentList">
                  	<div class="row text-start">
					</div>
	                      	<div id="replyBox" >
<!-- 								<div class="row rounded bg-light p-3 mb-3">
									<div class="col-1">
										<img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle mt-2" id="ownerimg">
			                        </div>
			                        <div class="col-11">
			                          <div class="border-bottom">
			                            <h6 class="my-0">창작자 닉네임 ></h6>
			                            <p class="my-0 text-small">작성일 ></p>
			                          </div>
										<p class="mb-5" >내용 ></p>
									</div>
		                      	</div>
		                     </div> -->
					</div>
<<<<<<< HEAD
					</sec:authorize>
				</div>
=======
                     <!--답글 종료-->
                     
>>>>>>> branch 'Spring-Security' of https://github.com/Purplaying-Main/Purplaying.git
			</div>
			
                 <!--댓글 종료-->
                 <!--(댓글 수정) 모달 -->
                 <div class="modal fade" id="mod_Modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="modify_chat">수정하기</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        <form>
				          <div class="mb-3">
				            <label for="recipient" class="col-form-label" id="comment_to_reply">현재 댓글</label>
				            <input class="form-control" id="modal_comment" readonly />
				          </div>
				          <div class="mb-3">
				            <label for="message-text" class="col-form-label" >수정 입력</label>
				            <textarea class="form-control" id="modify_text" placeholder="수정할 내용을 입력하세요"></textarea>
				          </div>
				        </form>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				        <button type="button" class="btn btn-primary" id="RmodifyBtn">수정</button>
				      </div>
				    </div>
				  </div>
				</div> 
				
                 <!--(댓글 답변) 모달 -->
                 <div class="modal fade" id="reply_Modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="comment_reply_chat">답변하기</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        <form>
				          <div class="mb-3">
				            <label for="recipient" class="col-form-label" id="comment_to_reply">현재 댓글</label>
				            <input class="form-control" id="modal_comment" readonly />
				          </div>
				          <div class="mb-3">
				            <label for="message-text" class="col-form-label" >답변 입력</label>
				            <textarea class="form-control" id="RtoR_text" placeholder="답변 내용을 입력하세요"></textarea>
				          </div>
				        </form>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				        <button type="button" class="btn btn-primary" id="RtoRBtn">답변</button>
				      </div>
				    </div>
				  </div>
				</div>

                <!-- tab 4 contents 프로젝트 정책-->
                <div class="tab-pane fade" id="v-pills-tab04" role="tabpanel" aria-labelledby="v-pills-tab04-tab">
	                 <div class="mt-2" id="prdt_desc_policy">
	                  	${projectDto.prdt_desc_policy}
			         </div>
                </div>
                <!-- tab 4 contents end-->
                
              </div>
            </div><!-- 탭 컨텐츠 end -->
          </form>
        </div><!-- 상세페이지 하단 종료 -->
    </section>
    <!--페이지 내용 종료-->

   <!-- 페이지 로딩시 실행 스크립트 -->
   <script type="text/javascript">
   $(document).ready(function(){
		let dday =  <c:out value="${projectDto.prdt_dday}"/>
		/*페이지가 로딩되었을 때 리워드 수량이 0인 리워드에 대하여 선택 비활성화*/
		for(var i = 1; i<document.getElementById("addReward").childElementCount;i++){
			if(parseInt(document.getElementById("reward_stock"+i).innerText.split("개")[0]) == 0){
				document.getElementById("reward_btn"+i).disabled = true;
				document.getElementById("addReward").children[i].disabled = true;
			}
			else {
				continue;
			}
		}   

		
		// 유저!=창작자 
	    $('#doFundingBtn').click(function(){
			console.log("펀딩하기 버튼 클릭");
			let form = $('#selectedRewardForm');
			form.attr("action","<c:url value='/payment/${prdt_id}' />");
			form.attr("method","post");
			if(formCheck())
				form.submit()	
		})
		
		
		
	});
		/*펀딩하기 버튼 클릭시 validation 체크*/
		formCheck = function() {
			let form = document.getElementById("selectRewardBox")
		
			//1. 선택된 리워드가 없는 경우
			if(form.childElementCount == 0) {
				alert("리워드를 선택해주세요.")
				return false
			}
			
			//2. 선택된 리워드 수량이 남은 수량 보다 적은지 확인
	 		for( i = 0; i <form.childElementCount; i++ ){
	 			//let input_RewardNo = form.children[i].firstChild.lastChild.value ///403
	 			let input_RewardNo = form.children[i].firstChild.firstChild.firstChild.value
	 			let stock_id = "reward_stock"+input_RewardNo 
	 			let inputReward_id = "selectedRewardCnt-"+input_RewardNo
	 			let stock = parseInt(document.getElementById(stock_id).innerText.split("개")[0])
	 			let inputReward = parseInt(document.getElementById(inputReward_id).value)
				if(stock < inputReward ){
					alert("남은 수량을 다시 확인해주세요")
					return false
				} 
				else {
					continue
				}
	 		}
			
			//3. 유저 포인트가 결제 총액 보다 많은지 확인 > 적으면 iamport.jsp 호출
			let user_point = parseInt(document.getElementById("user_point").value)
			let total_price = parseInt(document.getElementById("rewardTotalPrice").value)
			if(user_point == -1){
				alert("로그인 후 이용해주세요")
				return false
			}
			else if(user_point <total_price){
				alert("포인트가 부족합니다.")
				document.getElementById("iamport").click()
				return false
			}
			
			console.log("입력 성공");
			return true;
		  }
   </script>   
   
   <!-- 찜하기 스크립트 -->
   <script src="${pageContext.request.contextPath}/resources/assets/js/pickBtn.js"></script> 
	<script type="text/javascript">
	/*찜하기 버튼 스크립트*/
	function pickBtn() {
		   let _buttonI = event.target;
		   if (_buttonI.classList.contains("far")) {
		      $.ajax({
					type : 'post',				//요청 메서드
					url : '/purplaying/like/addlike',				//요청 URI
					headers :	{ "content-type" : "application/json"},				//요청 헤더
					data : JSON.stringify({prdt_id:$('#prdt_id').val()}),				// 서버로 전송할 데이터. stringify()로 직렬화 필요.
					beforeSend: function(xhr){
				        xhr.setRequestHeader(header, token);
				    },
					success : function(result) {				// 서버로부터 응답이 도착하면 호출될 함수
						_buttonI.classList.add("fas");
				      	_buttonI.classList.add("active");
				      	_buttonI.setAttribute("style","color: red;");	//활성시 색 변경
				     	_buttonI.classList.remove("far");
			     	},
			    	error : function() { alert("error") }			//에러가 발생했을 때, 호출될 함수
				})
		   } else {
		      $.ajax({
					type : 'post',				//요청 메서드
					url : '/purplaying/like/removelike',				//요청 URI
					headers :	{ "content-type" : "application/json"},				//요청 헤더
					data : JSON.stringify({prdt_id:$('#prdt_id').val()}),				// 서버로 전송할 데이터. stringify()로 직렬화 필요.
					beforeSend: function(xhr){
				        xhr.setRequestHeader(header, token);
				    },
					success : function(result) {				// 서버로부터 응답이 도착하면 호출될 함수
						  _buttonI.classList.remove("fas");
					      _buttonI.classList.remove("active");
					      _buttonI.setAttribute("style","color: rgb(156, 102, 255);"); //비활성시 원래 색으로
					      _buttonI.classList.add("far");
			     	},
			    	error : function() { alert("error") }			//에러가 발생했을 때, 호출될 함수
				})
		   }
		}		
	</script>
	
   <!-- 페이지 주소 가져오는 스크립트  -->
   <script>document.getElementById("showURL").value = window.location.href</script>
   <!-- 페이지 주소 복사 스크립트 -->
   <script src="${pageContext.request.contextPath}/resources/assets/js/copyURL.js"></script> 
   
   <!-- show / hide 스크립트 -->
   <script src="${pageContext.request.contextPath}/resources/assets/js/showHide.js"></script> 

	<!-- 리워드 추가 스크립트 -->
   <script type="text/javascript">
   	let arr = [];
   	let reward_amount=0; 	
	$("#addReward").change(function(){
		document.getElementById("selectRewardBox").style.display = 'block';
		let reward_num = $('#addReward option:selected').val();
		//alert(reward_num)
		if(!arr.includes(reward_num)){
			arr.push(reward_num);
			let list = selectToHtml($('#selectRewardBox').html())
			$('#selectRewardBox').html(list)
			calRewardPrice()
		}

	})
	</script>
	
	<!-- 리워드 계산 스크립트 -->
	<script type="text/javascript">
	function calRewardPrice(){
		eventTarget = event.target;		
		let rewardTotalPrice = document.getElementById("rewardTotalPrice").value;
		var reward_length = $("input[name='reward_cnt']").length;
		
		let result_price = 0;
		var arr_reward=  new Array(reward_length);
		for(var i=0; i<reward_length; i++){
            let price = $("input[name='reward_cnt']").eq(i).parent().parent().prev().children('span:eq(1)').text().split("원");
			let reward_cnt = $("input[name='reward_cnt']").eq(i).val();
			result_price = result_price + Number(price[0])*reward_cnt;
			reward_amount = reward_amount+1;
		}
		//
		$("#rewardTotalPrice").val(result_price);
		
	}	
	</script>
	
	<!-- 리워드 삭제 스크립트 -->
	<script type="text/javascript">
	function del_reward(){
		eventTarget = event.target;
		let num = eventTarget.nextElementSibling.value
		//alert(num)
		arr = arr.filter(function(item){
			return item != num;
		})
		let filtered = arr.filter((element) => element !== num);
		eventTarget.parentNode.parentElement.remove();
		calRewardPrice()
	}	
	</script>
	
	<!-- 리워드 구조 스크립트 -->
	<script type="text/javascript">
	function selectToHtml(tmp){
		let selectedRewardName = document.getElementById("selectedRewardName");
		let selectedRewardPrice = document.getElementById("selectedRewardPrice");
		let getOption =  $("#addReward option:checked").text();
		let name = getOption.split('+')[0];
		let num = name.split('.')[0];
		let price_won = getOption.split('+')[1];
		let reward_value =  $("#addReward option:checked").val();
		let price = price_won.split('원')[0];
		
		let temp = tmp;
		temp += "<div>";
		temp += '<div class="d-flex justify-content-between">'
		temp += '<span class="align-self-center" style="margin-bottom: 0px;" id="selectedRewardName-'+num+'"><input type="hidden" value="'+num+'" name="no"><input type="hidden" value="'+name+'" name="nm">'+name+'</span>'
		temp += '<span class="align-self-center" style="margin-bottom: 0px;" id="selectedRewardPrice-'+num+'"><input type="hidden" value="'+price_won+'" name="pr" >'+price_won+'</span><input type="button" class="btn text-danger fw-bold btn-sm" id="del_rewardBtn-'+num+'" onclick="del_reward()" value="X"/><input type="hidden" id="reward_id" value="'+reward_value+'">'
		temp +='</div>'
		temp +=	'<div class="d-flex justify-content-end col"><span class="align-self-center col-1" style="margin-bottom: 0px;">수량 </span><span class="col-2"><input type="number" class="text-center form-control form-control-sm" name="reward_cnt" value="1" id="selectedRewardCnt-'+num+'" placeholder="1" min="1" onchange="calRewardPrice()"/></span></div>'
		temp += "</div>";
		return temp;
	}	
	</script>
	
	<!-- 이 리워드 선택하기 버튼 클릭 시 해당 리워드의 정보를 받아 위로 이동하는 스크립트 -->
	<script type="text/javascript">
	function jumpUp(){
		   document.getElementById("selectRewardBox").style.display = 'block';
		   eventTarget = event.target;
		   let eventTargetTitle = eventTarget.parentElement.previousElementSibling.lastElementChild.innerHTML
		   let eventTargetPrice = eventTarget.parentElement.firstElementChild.lastElementChild.innerHTML
		   let reward_number = eventTarget.parentElement.previousElementSibling.lastElementChild.previousElementSibling.value
		   $('#addReward').val(reward_number).prop('selected',true);		   
		   if(!arr.includes(reward_number
				   )){
			   arr.push(reward_number)
			  	let list = selectToHtml($('#selectRewardBox').html())
				$('#selectRewardBox').html(list)
				calRewardPrice()
				
				let ml = document.getElementById("move").offsetLeft;
				let mt = document.getElementById("move").offsetTop;
			    window.scrollTo({top:mt, left: ml, behavior: "smooth"});
			   
		   }
			  
		}	
	</script>

	<!-- 리워드 dropbox 옵션에 따른 스크립트 -->
	<script type="text/javascript">
	  //슈퍼얼리버드 클릭 시
	  $("#dropDownOption1").click(function(){
		  dropbox(1)
	  })
	  
	  //얼리버드 클릭 시
	  $("#dropDownOption2").click(function(){
		dropbox(2)
	  })
	  function dropbox(category){
 		  let prdt_id = $("input[id=prdt_id]").val();
		  let reward_category = category;
		  let reward = {reward_category : reward_category, prdt_id : prdt_id};
	      $.ajax({
				type : 'POST',		
				url : '/purplaying/project/reward_category',
				headers:{"content-type" : "application/json"},
				data : JSON.stringify(reward),
  				dataType : 'text',
				beforeSend: function(xhr){
			        xhr.setRequestHeader(header, token);
			    },
				success : function(result) {
					$("#rewardBox").html(toHtmlDropbox(JSON.parse(result)));
		     	},
		    	error : function() { 
		    		alert("error") ;
		    		}			
			})
	  }
	  
		let toHtmlDropbox = function(rewards){
			let tmp = "";
			rewards.forEach(function(reward){
				tmp += '<div class="col mt-2">';
				tmp += '<div class="card mb-4 rounded-3 shadow-sm" id="reward_Card'+reward.reward_category+'">';
				tmp += '<div class="card-header py-3">';
				tmp += '<strong class="my-0 fw-normal bg-info">';
				if(reward.reward_category == 1){
					tmp += '슈퍼얼리버드';
				}
				else{
					tmp += '얼리버드';
				}
				tmp += '</strong><br>';
				tmp += '<input type="hidden" id="reward_id" value="'+reward.reward_id+'"/>';
				tmp += '<strong class="fw-normal">'+reward.row_number+'. '+reward.reward_name+'</strong></div>';
				tmp += '<div class="card-body"><h5 class="card-title pricing-card-title">';	
				tmp += '<span>'+reward.reward_desc+'</span></h5>';
				tmp += '<div class="text-end"><span class="text-primary mt-3">'+reward.reward_price+'원</span></div>';
				tmp += '<div class="text-info text-end">남은 수량<span class="fw-bold" id="reward_stock'+reward.row_number+'">';
				if(reward.reward_stock == -1){
					tmp += '제한없음';
				}
				else{
					tmp += ''+reward.reward_stock+'개';
				}
				tmp += '</span></div><button type="button" class="w-100 btn btn-outline-primary mt-2" id="'+reward.row_number+'" onclick="jumpUp()">이 리워드 선택하기</button></div></div></div>';
			});
			return tmp;
		} 
	</script>
	   
   <!-- 업데이트 탭 스크립트 -->
   <script type="text/javascript">
   function writeUpdate(){
	   let updateTitle = $('#updateTitle').val();
	   let updateDesc = $('#updateDesc').val();
	   let prdt_id = $('#prdt_id').val();
	   
	   let updateData = {update_title:updateTitle,update_desc:updateDesc,prdt_id:prdt_id};
	   $.ajax({
			type:'post',	
			url: '/purplaying/project/writeUpdate',                                                                                
			headers:{"content-type" : "application/json"},
			dataType : 'text',
			data : JSON.stringify(updateData),
			beforeSend: function(xhr){
		        xhr.setRequestHeader(header, token);
		    },
			success:function(result){
				showHide('writeArea2'); 
				showHide('writeBtn2');
				location.reload();
			},
			error : function(){
				alert("error");
			}					
		});
   };   
   </script>
	
	<!-- 커뮤니티 스크립트 -->
	<script type="text/javascript">
	/*댓글 출력 스크립트*/
		$(document).ready(function() {
			let prdt_id = $("input[id=prdt_id]").val()
			let rno = $("input[id=rno]").val()
				
			showList(prdt_id)
		})
	
		let showList = function(prdt_id) {
			$.ajax({
				type : 'GET',		//요청 메서드
				url : '/purplaying/community?prdt_id=' + prdt_id,		// 요청 URI
				beforeSend: function(xhr){
			        xhr.setRequestHeader(header, token);
			    },
				success : function(result) {			// 서버로부터 응답이 도착하면 호출될 함수
					$("#commentList").html(toHtml(result))		// result는 서버가 전송한 데이터
				},
				error : function() { alert("Error_Chat_List") }	// 에러가 발생할 때, 호출될 함수
			})
		}
	</script>

	<script type="text/javascript">
	/*댓글 추가*/
	$("#insertBtn").click(function() {
		let comment = $("#comment").val();
		let prdt_id = $("input[id=prdt_id]").val();
		
		if(comment.trim() == '') {
			alert("댓글을 입력해 주세요.")
			$("#comment").val();
			return false
		}
		
		$.ajax({
			type : 'post',				//요청 메서드
			url : '/purplaying/community/insert/' + prdt_id,				//요청 URI
			headers :	{ "content-type" : "application/json"},				//요청 헤더
			data : JSON.stringify({prdt_id:prdt_id, chat_context:comment}),				// 서버로 전송할 데이터. stringify()로 직렬화 필요.
			beforeSend: function(xhr){
		        xhr.setRequestHeader(header, token);
		    },
			success : function(result) {				// 서버로부터 응답이 도착하면 호출될 함수
				$("#commentList").html(toHtml(result))		// 댓글 출력 폼으로 전송
				alert("댓글이 작성되었습니다.")				// 댓글 작성 시 알림
				$("#commentStart").load(window.location.href + " #commentStart");
	     	},
	    	error : function() { alert("Error_Insert_Chat") }			//에러가 발생했을 때, 호출될 함수
		})
	})	
	</script>
	
	<script type="text/javascript">
	/*댓글 수정*/
	
 	function mod_Modal() {					// 수정 버튼 클릭 시 수정 모달 창을 띄움
		$('#mod_Modal').modal('show')
	}

	$("#commentList").on("click", ".modBtn", function() {
		//alert("댓글수정 버튼 클릭됨")
		let chat_no = $(this).parent().parent().attr("data-chat_no")				
		let chat_context = $("span.chat_context",$(this).parent().parent()).text()
		let prdt_id = $(this).parent().parent().attr("data-prdt_id")
		//	1. 내용을 input에 출력해주기
		$("input[id=modal_comment]").val(chat_context);
		//	2. chat_no전달하기
		$("#RmodifyBtn").attr("data-chat_no", chat_no)
		
	})
	
	$("#RmodifyBtn").click(function() {
		
		let chat_no = $(this).attr("data-chat_no")
		let chat_context = $("#modify_text").val(); 

		if(chat_context.trim() == '') {
			alert("댓글을 입력해 주세요.")
			$("textarea[id=modify_text]").focus()
			return
		}
		$.ajax({
			type : 'patch',				//요청 메서드
			url : '/purplaying/community/modify/' + chat_no,				//요청 URI
			headers :	{ "content-type" : "application/json"},				//요청 헤더
			data : JSON.stringify({chat_no:chat_no, chat_context:chat_context}),				// 서버로 전송할 데이터. stringify()로 직렬화 필요.
			beforeSend: function(xhr){
		        xhr.setRequestHeader(header, token);
		    },
			success : function(result) {				// 서버로부터 응답이 도착하면 호출될 함수
				alert("댓글이 수정되었습니다.")			// 성공 시 알림
				window.location.reload();
				
	     	},
	     	
	    	error : function() { alert("Error_Modify_Chat") }			//에러가 발생했을 때, 호출될 함수
		})
		
	})	
	</script>
	
	<script type="text/javascript">
	/*댓글 삭제*/
	$("#commentList").on("click", ".delBtn", function() {
		let chat_no = $(this).parent().parent().attr("data-chat_no")	
		let prdt_id = $("input[id=prdt_id]").val();	
		
		$.ajax({
			type : 'DELETE',					//요청 메서드
			url : '/purplaying/community/'+ chat_no + '?prdt_id=' + prdt_id,			//요청 URI
			beforeSend: function(xhr){
		        xhr.setRequestHeader(header, token);
		    },
			success : function(result) {			//서버로부터 응답이 도착하면 호출될 함수
				alert("댓글이 삭제되었습니다.")		// 삭제 시 알림
				window.location.reload();
			},
			error : function() { alert("Error_Delete_Chat") }	//에러가 발생했을 때 호출될 함수
		})
		
	})
	</script>
	
	<!-- 답변 스크립트-->
	<script type="text/javascript">
	function reply_Modal() {				// 답변 버튼 클릭 시 답변 모달 창을 띄움
		$('#reply_Modal').modal('show')
	}
	// 댓글 답변
	$("#commentList").on("click", ".replyBtn", function() {			
		//alert("댓글답변 버튼 클릭됨")
		let chat_no = $(this).parent().parent().attr("data-chat_no")
		//클릭된 수정버튼의 부모(li)에 span 태그의 text만 가져옴
		let chat_context = $("span.chat_context",$(this).parent().parent()).text()
		//1. 내용을 input에 출력해주기
		$("input[id=modal_comment]").val(chat_context);
		//2. chat_no전달하기
		$("#RtoRBtn").attr("data-chat_no", chat_no)
		
		})	
	</script>
	
	<script type="text/javascript">
	/*답변 추가*/
	$("#RtoRBtn").click(function() {
		//alert("답변버튼 클릭됨")
		
		let chat_no = $(this).attr("data-chat_no")
		let chat_context = $("#RtoR_text").val(); 
		
		// 답변 글 체크
		if(chat_context.trim() == '') {
			alert("답글을 입력해 주세요.")
			$("textarea[id=RtoR_text]").focus()
			return
		}
		
		$.ajax({
			type : 'POST',				//요청 메서드
			url : '/purplaying/reply/' + prdt_id,				//요청 URI
			headers :	{ "content-type" : "application/json"},				//요청 헤더
			data : JSON.stringify({chat_no:chat_no, chat_context:chat_context}),				// 서버로 전송할 데이터. stringify()로 직렬화 필요.
			beforeSend: function(xhr){
		        xhr.setRequestHeader(header, token);
		    },
			success : function(result) {				// 서버로부터 응답이 도착하면 호출될 함수
				
				//alert(JSON.stringify({chat_no:chat_no, chat_context:chat_context}))
				
				$("#commentList").html(toHtml(result))
	     	},
	    	error : function() { alert("Error_Reply_Chat") }			//에러가 발생했을 때, 호출될 함수
		})
		})
	</script>	
	
	<!-- 커뮤니티 객체 스트럭처 스크립트 -->
	<script type="text/javascript">
	let toHtml = function(comments) {
 		let tmp = '<div class="row text-start">'
		let user_id_for_comment = $('#user_id_for_comment').val()			// 로그인정보를 세션에 담아옴
 		
			comments.forEach(function(comment) {
				tmp += '	<div id="comment'+comment.chat_no+'">'
				tmp += '	<div class="d-flex">'
				tmp += '	<div class="col-1">'
				tmp += '		<img src="${cuser.user_profile }" alt="${cuser.user_name }" width="32" height="32" class="rounded-circle mt-2" id="ownerimg">'
				tmp += '	</div>'
				tmp += '	<li class="col-11" data-chat_no=' + comment.chat_no
				tmp += '		data-prdt_id'+ comment.prdt_id
				tmp += '		data-chat_writer' + comment.chat_writer
				tmp += '		data-chat_date' + comment.chat_date
					tmp += '		data-user_no'+ comment.user_no +'>'
 				tmp += '		<div class="border-bottom">'
				tmp += '			<h6 class="my-0"><Strong>작성자 닉네임 ></Strong>'+ comment.user_nickname + '</h6>'
				tmp += '			<p class="my-0 text-small"><Strong>작성일 ></Strong>' + toStringByFormatting(comment.chat_date) + '</p>'
				tmp += '		</div>'
				tmp += '	<p class="mb-5" ><Strong>내용 ></Strong><span class="chat_context" id="comment" >' + comment.chat_context + '</span></p>'	
				
				
			if (user_id_for_comment == ''){true} 			// 아이디세션 값이 없으면 버튼 출력하지 않음
			else if (user_id_for_comment == comment.user_no) {				// 로그인한 유저 번호와 작성댓글 유저 번호가 같으면 출력
			    tmp +=	'		<div class="d-flex justify-content-end">'
		    	tmp +=	'			<button type="button" id="modBtn" class="modBtn btn btn-primary me-3" onclick="mod_Modal()" >수 정</button>'
		    	/* tmp +=	'			<button type="button" id="replyBtn" class="replyBtn btn btn-primary" onclick="reply_Modal()" ">답 변</button>'
*/				    	tmp +=	'			<button type="button" class="delBtn btn btn-primary" >삭 제</button>'
		    	tmp +=  '		</div>'
				}
			else {			// 로그인한 유저 번호와 작성댓글 유저 번호가 다르면 출력
				tmp +=	'		<div class="d-flex justify-content-end">'
	    		tmp +=	'			<button type="button" id="replyBtn" class="replyBtn btn btn-primary" onclick="reply_Modal()">답 변</button>'
    			tmp +=  '		</div>'
				} 
				
				
				/* if (result.list.length > 0){
					for(let i = 0; i < result.list.length; i++) {
						tmp +="<div id='replyBox' >"
						tmp +="<input type='hidden' id='user_nickname'" + data.list[i].id + " 'value ='" + data.list[i].id + "'>'"
						tmp += '	<li class="col-11" data-chat_no=' + comment.chat_no
						tmp += '		data-prdt_id'+ comment.prdt_id
						tmp += '		data-chat_writer' + comment.chat_writer
						tmp += '		data-chat_date' + comment.chat_date
 						tmp += '		data-user_no'+ comment.user_no +'>'
 						
						tmp +="<div class='row rounded bg-light p-3 mb-3'>"
						tmp +="<div class='col-1'>"
						tmp +='<img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle mt-2" id="ownerimg">'
						tmp +='</div>'
						tmp += '			<h6 class="my-0"><Strong>작성자 닉네임 ></Strong>'+ comment.user_nickname + '</h6>'
						tmp += '			<p class="my-0 text-small"><Strong>작성일 ></Strong>' + toStringByFormatting(comment.chat_date) + '</p>'
						tmp += '		</div>'
						tmp += '	<p class="mb-5" ><Strong>내용 ></Strong><span class="chat_context" id="comment" >' + comment.chat_context + '</span></p>'
					
				} */
				
				
				tmp += '</li>'
				tmp += '<hr class="mt-3">'
				tmp += '</div>'
				tmp += '</div>'
		})
		return tmp += "</div>"
			
	}
	
	// 댓글 출력
 	function toStringByFormatting(source,delimiter = '-'){
	         let date_source = new Date(source);
	        let month = date_source.getMonth() + 1;
	        let day = date_source.getDate();

	        month = month >= 10 ? month : '0' + month;
	        day = day >= 10 ? day : '0' + day;

	        return date_source.getFullYear() + '-' + month + '-' + day;

     }
	
	</script>
  <!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
</body>
</html>
