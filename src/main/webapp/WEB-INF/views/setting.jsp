<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<!-- meta태그, CSS, JS, 타이틀 인클루드  -->
	<%@ include file ="meta.jsp" %>
</head>

<body>
   <!--헤더 인클루드-->
   <%@ include file ="header.jsp" %>
   

  <!--메인 컨테이너 -->
  <section>
    <h1 class="visually-hidden">HOME</h1>
    <div class="contentsWrap">
      <!--컨텐츠 영역-->
      <div class="row justify-content-md-center">
        <h2 class="col-auto mb-5">설정</h2>
      </div>
      <div class="mb-4 w-75 mx-auto"> <!-- 탭 start-->
        <div class="nav nav-tabs nav-justified mb-4" id="v-pills-tab" role="tablist"> <!-- 탭 menu start-->
          <button class="nav-link active" id="v-pills-01-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab01" type="button" role="tab" aria-controls="v-pills-tab01" aria-selected="true">프로필</button>
          <button class="nav-link" id="v-pills-02-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab02" type="button" role="tab" aria-controls="v-pills-tab02" aria-selected="false">계정</button>
          <button class="nav-link" id="v-pills-03-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab03" type="button" role="tab" aria-controls="v-pills-tab03" aria-selected="false">배송지</button>
          <button class="nav-link" id="v-pills-04-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab04" type="button" role="tab" aria-controls="v-pills-tab04" aria-selected="false">알림</button>
        </div><!-- 탭 menu end-->
        <div class="row container mb-4 px-5"><!-- 탭 컨텐츠 start -->
          <div class="tab-content" id="v-pills-tabContent">
            <!-- tab 1 contents -->
            <div class="tab-pane fade show active" id="v-pills-tab01" role="tabpanel" aria-labelledby="v-pills-tab01-tab">
              <ul class="border-bottom py-3">
                <li class="row justify-content-between">
                  <div class="col-auto">
                    <h6>프로필 사진</h6>
                  </div>
                  <div class="col-auto px-3 text-end">
                    <button class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#profileChangeModal">변경</button>
                  </div>
                </li>
                <li class="row w-25">
                  <img class="img-thumbnail" src="">
                </li>
                <!-- Modal -->
                <div class="modal fade" id="profileChangeModal" tabindex="-1" aria-labelledby="profileChangeModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="profileChangeModalLabel" >프로필 사진 변경</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        <%@ include file = "imageUpload.jsp"%>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close">확인</button>
                      </div>
                    </div>
                  </div>
                </div>
              </ul>
              <ul class="border-bottom py-3">
                <li class="row justify-content-between">
                  <div class="col-auto">
                    <h6>이름</h6>
                  </div>
                  <div class="col-auto px-3 text-end">
                    <button class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#nameChangeModal">변경</button>
                  </div>
                </li>
                <li class="row">
                  <p>이젠</p>
                </li>
                <!-- Modal -->
                <div class="modal fade" id="nameChangeModal" tabindex="-1" aria-labelledby="nameChangeModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="nameChangeModalLabel" >이름 변경</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body mx-auto">
                        <div class="input-group mb-3">
                          <span class="input-group-text" id="basic-addon1">@</span>
                          <input type="text" class="form-control" placeholder="변경할 이름" aria-label="Username" aria-describedby="basic-addon1">
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close">확인</button>
                      </div>
                    </div>
                  </div>
                </div>
              </ul>
              <ul class="border-bottom py-3">
                <li class="row justify-content-between">
                  <div class="col-auto">
                    <h6>소개</h6>
                  </div>
                  <div class="col-auto px-3 text-end">
                    <button class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#introChangeModal">변경</button>
                  </div>
                </li>
                <li class="row">
                  <p>안녕하세요 이젠입니다.</p>
                </li>
                <!-- Modal -->
                <div class="modal fade" id="introChangeModal" tabindex="-1" aria-labelledby="introChangeModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="introChangeModalLabel" >소개글 변경</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        <textarea type="text" class="form-control col-10" placeholder="소개글 입력" rows="5"></textarea>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close">확인</button>
                      </div>
                    </div>
                  </div>
                </div>
              </ul>
            </div>
            <!-- tab 2 contents -->
            <div class="tab-pane fade" id="v-pills-tab02" role="tabpanel" aria-labelledby="v-pills-tab02-tab">
              <ul class="border-bottom py-3">
                <li class="row justify-content-between">
                  <div class="col-auto">
                    <h6>이메일</h6>
                  </div>
                  <div class="col-auto px-3 text-end">
                    <button class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#introChangeModal" disabled>변경</button>
                  </div>
                </li>
                <li class="row">
                  <p>ezenac@gmail.com</p>
                </li>
                <!-- Modal -->
                <div class="modal fade" id="introChangeModal" tabindex="-1" aria-labelledby="introChangeModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="introChangeModalLabel" >소개글 변경</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        <textarea type="text" class="form-control col-10" placeholder="소개글 입력" rows="5"></textarea>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close">확인</button>
                      </div>
                    </div>
                  </div>
                </div>
              </ul>
              <ul class="border-bottom py-3">
                <li class="row justify-content-between">
                  <div class="col-auto">
                    <h6>비밀번호</h6>
                  </div>
                  <div class="col-auto px-3 text-end">
                    <button class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#pwdChangeModal">변경</button>
                  </div>
                </li>
                <li class="row">
                  <p>******</p>
                </li>
                <!-- Modal -->
                <div class="modal fade" id="pwdChangeModal" tabindex="-1" aria-labelledby="pwdChangeModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="introChangeModalLabel" >비밀번호 변경</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        <label for="password" class="form-label">비밀번호</label>
                        <input type="password" class="form-control mb-2" id="password" placeholder="비밀번호 입력" required>
                        <input type="password" class="form-control" id="passwordConfirm" placeholder="비밀번호 확인" required>
                        <div class="invalid-feedback">
                          Please enter your shipping address.
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close">확인</button>
                      </div>
                    </div>
                  </div>
                </div>
              </ul>
              <ul class="border-bottom py-3">
                <li class="row justify-content-between">
                  <div class="col-auto">
                    <h6>연락처</h6>
                  </div>
                  <div class="col-auto px-3 text-end">
                    <button class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#phoneChangeModal">변경</button>
                  </div>
                </li>
                <li class="row">
                  <p>010-0000-**11</p>
                </li>
                <!-- Modal -->
                <div class="modal fade" id="phoneChangeModal" tabindex="-1" aria-labelledby="phoneChangeModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="phoneChangeModalLabel" >연락처 변경</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        <label for="userphone" class="form-label">연락처</label>
                        <div class="input-group mb-3">
                          <input type="number" class="form-control" id="userphone" placeholder="휴대폰 번호 (-없이 입력)">
                          <button class="btn btn-outline-secondary" type="button" id="button-addon2">인증번호 받기</button>
                        </div>
                        <input type="number" class="form-control" id="userphoneConfirm" placeholder="인증번호 입력 (남은 시간 2분 58초)">
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close">확인</button>
                      </div>
                    </div>
                  </div>
                </div>
              </ul>
              <ul class="border-bottom py-3">
                <li class="row justify-content-between">
                  <div class="col-auto">
                    <h6>SNS 계정 연동</h6>
                  </div>
                  <div class="col-auto px-3 text-end">
                    <button class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#snsChangeModal">변경</button>
                  </div>
                </li>
                <li class="row">
                  <p>카카오톡 계정 연동 중입니다.</p>
                </li>
                <!-- Modal -->
                <div class="modal fade" id="snsChangeModal" tabindex="-1" aria-labelledby="snsChangeModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="snsChangeModalLabel" >SNS 계정 변경</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        ... SNS 계정 변경을 어떻게..? 탈퇴로 넘길지.. 고민
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close">확인</button>
                      </div>
                    </div>
                  </div>
                </div>
              </ul>
              <ul class="border-bottom py-3">
                <li class="row justify-content-between">
                  <div class="col-auto">
                    <h6>회원탈퇴</h6>
                  </div>
                  <div class="col-auto px-3 text-end">
                    <button class="btn btn-outline-primary" onclick="location.href='leave.html'">탈퇴</button>
                  </div>
                </li>
                <li class="row">
                  <p>퍼플레잉 회원 탈퇴페이지로 이동합니다.</p>
                </li>
              </ul>
            </div>
            <!-- tab 3 contents -->
            <div class="tab-pane fade" id="v-pills-tab03" role="tabpanel" aria-labelledby="v-pills-tab03-tab">
                <div class="row justify-content-between">
                  <div class="col-auto">
                    <h6>등록된 배송지</h6>
                  </div>
                  <div class="col-auto px-3 text-end">
                    <button class="btn btn-outline-primary"  data-bs-toggle="modal" data-bs-target="#addressRegModal">배송지 추가</button>
                  </div>
                </div>
                <!-- card start -->
                <div class="row border rounded w-75 mx-1">
                  <div class="border-bottom justify-content-between d-md-flex py-2">
                    <h6 class="col-auto text-info">기본 배송지</h6>
                    <div class="col-auto d-md-flex px-3">
                      <!-- 수정 -->
                      <button class="btn btn-outline-primary btn-sm me-md-2" type="button" data-bs-toggle="modal" data-bs-target="#addressModiModal">M</button>
                      <button class="btn btn-outline-danger btn-sm" type="button">D</button>
                    </div>
                  </div>
                  <div class="px-3 pt-2">
                    <h6>받는분 : 홍길동</h6>
                    <h6>[06541] 서울특별시  서초구 강남대로 479 3층 </h6>
                    <h6>010-0000-0000</h6>
                  </div>
                </div>
              <!-- card end -->
              <hr class="my-4">
              <!-- card start -->
              <div class="row border rounded w-75 mx-1">
                <div class="border-bottom justify-content-between d-md-flex py-2">
                  <h6 class="col-auto text-info">배송지 #2</h6>
                  <div class="col-auto d-md-flex px-3">
                    <button class="btn btn-outline-primary btn-sm me-md-2" type="button">M</button>
                    <button class="btn btn-outline-danger btn-sm" type="button">D</button>
                  </div>
                </div>
                <div class="px-3 pt-2">
                  <h6>받는분 : 홍길동</h6>
                  <h6>[06541] 서울특별시  서초구 강남대로 479 3층 </h6>
                  <h6>010-0000-0000</h6>
                </div>
              </div>
              <!-- card end -->
              <!-- 배송지 추가 modal start -->
              <div class="modal fade" id="addressRegModal" tabindex="-1" aria-labelledby="addressRegModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header p-5 pb-4 border-bottom-0">
                      <h5 class="fw-bold mb-0">배송지 추가</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-5 pt-0">
                      <form class="">
                        <div class="form-floating mb-3">
                          <input type="text" class="form-control rounded-3" id="username" name="username"/>
                          <label for="label_username">수령인</label>
                        </div>
                        <div class="form-floating mb-3">
                          <input type="text" class="form-control rounded-3" id="address" name="address" />
                          <label for="label_address">배송지 주소</label>
                        </div>
                        <div class="form-floating mb-3">
                          <input type="text" class="form-control rounded-3" id="address_detail" name="address_detail"/>
                          <label for="label_address_detail">상세 주소</label>
                        </div>
                        <div class="form-floating mb-3">
                          <input type="text" class="form-control rounded-3" id="userphone" name="userphone"/>
                          <label for="label_userphone">연락처</label>
                        </div>
                        <div class="pb-2 border-bottom">
                          <input class="form-check-input" type="checkbox" id="defaultAddressReg" value="" aria-label="...">
                          기본배송지로 등록
                        </div>
                        <button class="w-100 my-3 btn btn-lg rounded-3 btn-primary" type="submit">배송지 저장</button>
                      </form>
                    </div><!-- modal body -->
                  </div>
                </div>
              </div> <!-- Modal end-->
              
              <!-- 배송지 수정 modal start -->
              <div class="modal fade" id="addressModiModal" tabindex="-1" aria-labelledby="addressModiModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header p-5 pb-4 border-bottom-0">
                      <h5 class="fw-bold mb-0">배송지 수정</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-5 pt-0">
                      <form class="">
                        <div class="form-floating mb-3">
                          <input type="text" class="form-control rounded-3" id="username" name="username"/>
                          <label for="label_username">수령인</label>
                        </div>
                        <div class="form-floating mb-3">
                          <input type="text" class="form-control rounded-3" id="address" name="address" />
                          <label for="label_address">배송지 주소</label>
                        </div>
                        <div class="form-floating mb-3">
                          <input type="text" class="form-control rounded-3" id="address_detail" name="address_detail"/>
                          <label for="label_address_detail">상세 주소</label>
                        </div>
                        <div class="form-floating mb-3">
                          <input type="text" class="form-control rounded-3" id="userphone" name="userphone"/>
                          <label for="label_userphone">연락처</label>
                        </div>
                        <div class="pb-2 border-bottom">
                          <input class="form-check-input" type="checkbox" id="defaultAddressReg" value="" aria-label="...">
                          기본배송지로 등록
                        </div>
                        <button class="w-100 my-3 btn btn-lg rounded-3 btn-primary" type="submit">배송지 저장</button>
                      </form>
                    </div><!-- modal body -->
                  </div>
                </div>
              </div> <!-- Modal end-->
            </div>
            <!-- tab 4 contents -->
            <div class="tab-pane fade" id="v-pills-tab04" role="tabpanel" aria-labelledby="v-pills-tab04-tab">
              <ul class="border-bottom py-3">
                <li class="row justify-content-between">
                  <div class="col-auto">
                    <h6>메시지</h6>
                  </div>
                  <div class="col-auto px-3 text-end">
                    <div class="form-check form-switch">
                      <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked>
                      <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                    </div>
                  </div>
                </li>
                <li class="row text-muted">
                  <p>새 메시지 알림을 이메일로 수신합니다.</p>
                </li>
              </ul>
              <ul class="border-bottom py-3">
                <li class="row justify-content-between">
                  <div class="col-auto">
                    <h6>후원 프로젝트 업데이트</h6>
                  </div>
                  <div class="col-auto px-3 text-end">
                    <div class="form-check form-switch">
                      <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked>
                      <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                    </div>
                  </div>
                </li>
                <li class="row text-muted">
                  <p>후원하고 있는 프로젝트 업데이트 알림을 이메일로 수신합니다</p>
                </li>
              </ul>
              <ul class="border-bottom py-3">
                <li class="row justify-content-between">
                  <div class="col-auto">
                    <h6>관심목록</h6>
                  </div>
                  <div class="col-auto px-3 text-end">
                    <div class="form-check form-switch">
                      <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked>
                      <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                    </div>
                  </div>
                </li>
                <li class="row text-muted">
                  <p>관심목록에 등록된 이용자의 프로젝트 관련 알림을 이메일로 수신합니다.</p>
                </li>
              </ul>
              <ul class="border-bottom py-3">
                <li class="row justify-content-between">
                  <div class="col-auto">
                    <h6>마케팅 알림</h6>
                  </div>
                  <div class="col-auto px-3 text-end">
                    <div class="form-check form-switch">
                      <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" checked>
                      <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                    </div>
                  </div>
                </li>
                <li class="row text-muted">
                  <p>퍼플레잉 신규 콘텐츠 및 추천 알림을 이메일로 수신합니다.</p>
                </li>
              </ul>
            </div>
          </div>
        </div><!-- 탭 컨텐츠 end -->
      </div><!-- 탭 end-->
    </div><!-- contentsWrap end -->
  </section>
  <!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
</body>
</html>