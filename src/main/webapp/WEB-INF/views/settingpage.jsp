<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>setting_page</title>
</head>
<body>
    <!--메인 컨테이너 -->
    
    <section>
       <div>
         <h3>설정</h3>
       </div>
       <div class="contentsWrap">
         <!-- 탭 메뉴 -->
         <div class="row container mb-4">
           <div class="nav nav-pills nav-fill" id="v-pills-tab" role="tablist">
             <button class="nav-link active" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab01" type="button" role="tab" aria-controls="v-pills-tab01" aria-selected="true">프로필</button>
             <button class="nav-link" id="v-pills-account-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab02" type="button" role="tab" aria-controls="v-pills-tab02" aria-selected="false">계정</button>
             <button class="nav-link" id="v-pills-Notice-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab03" type="button" role="tab" aria-controls="v-pills-tab03" aria-selected="false">알림</button>
             <button class="nav-link" id="v-pills-settings-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab04" type="button" role="tab" aria-controls="v-pills-tab04" aria-selected="false">설정</button>
           </div>

         <div class="row container">
           <div class="tab-content" id="v-pills-tabContent">
             <div class="tab-pane fade show active" id="v-pills-tab01" role="tabpanel" aria-labelledby="v-pills-tab01-tab">
               <div id="srcsec">
                 <div id="stitle">
                   <h6>프로필 이미지</h6>
                 </div>
                 <div class="row">
                   <div class="col-8">
                     <img id="profileimg" src="https://cdn.pixabay.com/photo/2022/09/27/06/26/mountains-7482182_960_720.jpg" >
                   </div>
                   <div class="col-4 text-end" style="align-self: center;">
                     <button type="submit" class="btn btn-primary">변경</button>
                   </div>
                 </div>
                 <div><hr></hr></div>
               </div>
               <div id="srcsec">
                 <div id="stitle">
                   <h6>이름</h6>
                 </div>
                 <div class="row">
                   <div class="col-8">
                     <p>이젠</p>
                   </div>
                   <div class="col-4 text-end" style="align-self: center;">
                     <button type="submit" class="btn btn-primary">변경</button>
                   </div>
                 </div>
                 <div><hr></hr></div>
               </div>

               <div id="srcsec">
                 <div id="stitle">
                   <h6>소개</h6>
                 </div>
                 <div class="row">
                   <div class="col-8">
                     <p>이젠 아카데미 입니다.</p>
                   </div>
                   <div class="col-4 text-end" style="align-self: center;">
                     <button type="submit" class="btn btn-primary">변경</button>
                   </div>
                 </div>
               </div>
             </div>

             <div class="tab-pane fade" id="v-pills-tab02" role="tabpanel" aria-labelledby="v-pills-tab02-tab">
               <div id="srcsec">
                 <div id="stitle">
                   <h6>이메일</h6>
                 </div>
                 <div class="row">
                   <div class="col-8">
                     <h6>ezenac@gmail.com</h6>
                   </div>
                   <div class="col-4 text-end" style="align-self: center;">
                     <button type="submit" class="btn btn-primary">변경</button>
                   </div>
                 </div>
                 <div><hr></hr></div>
               </div>

               <div id="srcsec">
                 <div class="row" id="stitle">
                 </div>
                 <div class="row">
                   <div class="col-8">
                     <h6>비밀번호</h6>
                   </div>
                   <div class="col-4 text-end" style="align-self: center;">
                     <button type="submit" class="btn btn-primary">변경</button>
                   </div>
                 </div>
                 <div><hr></hr></div>
               </div>

               <div id="srcsec">
                 <div id="stitle">
                   <h6>연락처</h6>
                 </div>
                 <div class="row">
                   <div class="col-8">
                     <p>010-0000-0000</p>
                   </div>
                   <div class="col-4 text-end" style="align-self: center;">
                     <button type="submit" class="btn btn-primary">변경</button>
                   </div>
                 </div>
                 <div><hr></hr></div>
               </div>

               <div id="srcsec">
                 <div id="stitle">
                   <h6>계정연동</h6>
                 </div>
                 <div class="row">
                   <div class="col-8">
                     <p>카카오톡 계정 연동 중입니다.</p>
                   </div>
                   <div class="col-4 text-end" style="align-self: center;">
                     <button type="submit" class="btn btn-primary">변경</button>
                   </div>
                 </div>
                 <div><hr></hr></div>
               </div>

               <div id="srcsec">
                 <div class="row" id="stitle">
                 </div>
                 <div class="row">
                   <div class="col-8">
                     <h6>회원탈퇴</h6>
                   </div>
                   <div class="col-4 text-end" style="align-self: center;">
                     <button type="submit" class="btn btn-primary">탈퇴</button>
                   </div>
                 </div>
                 <div><hr></hr></div>
               </div>
             </div>


             <div class="tab-pane fade" id="v-pills-tab03" role="tabpanel" aria-labelledby="v-pills-tab03-tab">
               <div id="srcsec">
                 <div class="row">
                   <div class="col-8">
                     <p>등록된 배송지</p>
                   </div>
                   <div class="col-4 text-end" style="align-self: center;" data-bs-toggle="modal" data-bs-target="#signUpCompleteModal">
                     <button type="submit" class="btn btn-primary">등록</button>
                   </div>
                   <!-- 회원가입 완료 모달창 -->
                   <div class="modal fade" id="signUpCompleteModal" tabindex="-1" aria-labelledby="signUpCompleteModalLabel" aria-hidden="true">
                     <div class="modal-dialog">
                       <div class="modal-content">
                         <div class="modal-header p-5 pb-4 border-bottom-0">
                           <!-- <h1 class="modal-title fs-5" >Modal title</h1> -->
                           <h1 class="fw-bold mb-0 fs-2">배송지 추가</h1>
                           <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">...</button>
                         </div>
                         <div class="modal-body p-5 pt-0">
                           <form class="">
                             <div class="form-floating mb-3">
                               <input type="text" class="form-control rounded-3" id="floatingInput" placeholder="홍길동">
                               <label for="floatingInput">수령인</label>
                             </div>
                             <div class="form-floating mb-3">
                               <input type="text" class="form-control rounded-3" id="floatingInput" placeholder="010-0000-0000">
                               <label for="floatingPassword">연락처</label>
                             </div>
                             <div class="form-floating mb-3">
                               <input type="text" class="form-control rounded-3" id="address_kakao" name="address" readonly />
                               <label for="floatingPassword">배송지 주소</label>
                             </div>
                             <div class="form-floating mb-3">
                               <input type="text" class="form-control rounded-3" id="floatingInput" name="address_detail"/>
                               <label for="floatingPassword">상세 주소</label>
                             </div>
                             <div> <input type="checkbox" class="">기본배송지로 등록</div>
                             <button class="w-100 mb-2 btn btn-lg rounded-3 btn-primary" type="submit">저장</button>
                           </form>
                         </div>
                       </div>
                     </div>
                   </div> <!-- Modal end-->
                 </div>

                 <div class="row">
                   <div class="col-8" style="align-items: center;">
                     <div>홍길동</div>
                     <div>[06541] 서울특별시 서초구 강남대로 479 3층</div>
                     <div>010-0000-0000</div>
                   </div>
                   <div class="col-4 text-end" style="align-self: center;">
                       <button alt="mdo" width="32" height="32" class="rounded-circle btn btn-primary" data-bs-toggle="dropdown" aria-expanded="false">...</button>
                     <ul class="dropdown-menu text-small dropdown">
                       <li><a class="dropdown-item" href="#">수정</a></li>
                       <li><a class="dropdown-item" href="#">삭제</a></li>
                     </ul>
                   </div>
                 </div>
               </div>
             </div>


             <div class="tab-pane fade" id="v-pills-tab04" role="tabpanel" aria-labelledby="v-pills-tab04-tab">
               <div id="srcsec">
                 <div id="stitle">
                   <h6>메시지</h6>
                 </div>
                 <div class="row">
                   <div class="col-8">
                     <p>새 메시지 알림을 이메일로 수신합니다.</p>
                   </div>
                   <div class="col-4 text-end">
                     <div class="mb-3 form-check form-switch" style="align-self: center;">
                       <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked>
                       <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                     </div>
                   </div>
                 </div>
                 <div><hr></hr></div>
               </div>

               <div id="srcsec">
                 <div id="stitle">
                   <h6>후원 프로젝트 업데이트</h6>
                 </div>
                 <div class="row">
                   <div class="col-8">
                     <p>후원하고 있는 프로젝트 업데이트 알림을 이메일로 수신하지 않습니다.</p>
                   </div>
                   <div class="col-4 text-end">
                     <div class="mb-3 form-check form-switch" style="align-self: center;">
                       <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked>
                       <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                     </div>
                   </div>
                 </div>
                 <div><hr></hr></div>
               </div>

               <div id="srcsec">
                 <div id="stitle">
                   <h6>관심목록</h6>
                 </div>
                 <div class="row">
                   <div class="col-8">
                     <p>관심목록에 등록된 이용자의 프로젝트 관련 알림을 이메일로 수신합니다.</p>
                   </div>
                   <div class="col-4 text-end">
                     <div class="mb-3 form-check form-switch" style="align-self: center;">
                       <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked>
                       <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                     </div>
                   </div>
                 </div>
                 <div><hr></hr></div>
               </div>

               <div id="srcsec">
                 <div id="stitle">
                   <h6>마케팅 알림</h6>
                 </div>
                 <div class="row">
                   <div class="col-8">
                     <p>퍼플레잉 신규 콘텐츠 및 추천 알림을 이메일로 수신합니다.</p>
                   </div>
                   <div class="col-4 text-end">
                     <div class="mb-3 form-check form-switch" style="align-self: center;">
                       <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked>
                       <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                     </div>
                   </div>
                 </div>
               </div>
             </div>
           </div>
         </div>
         </div>
       </div>
    </section>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	window.onload = function(){
	    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
	        //카카오 지도 발생
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	                document.getElementById("address_kakao").value = data.address; // 주소 넣기
	                document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
	            }
	        }).open();
	    });
	}
	</script>
</body>
</html>