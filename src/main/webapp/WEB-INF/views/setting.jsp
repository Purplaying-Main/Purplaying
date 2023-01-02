<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="loginId" value="${sessionScope.id}" />
<!DOCTYPE html>
<html>
    <head>
        <!-- meta태그, CSS, JS, 타이틀 인클루드  -->
        <%@ include file ="meta.jsp" %>
    </head>

    <body>
        <!--헤더 인클루드-->
        <%@ include file ="header.jsp" %>

        <!-- 주소 찾기 -->
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script src="resources/assets/js/addressSearch.js"></script>

        <!--메인 컨테이너 -->
        <section>
            <h1 class="visually-hidden">HOME</h1>
            <div class="contentsWrap">
            <input type="hidden" id="user_no" value="${userDto.user_no }">
                <!--컨텐츠 영역-->
                <div class="row justify-content-md-center">
                    <h2 class="col-auto mb-5">설정</h2>
                </div>
                <div class="mb-4 w-75 mx-auto">
                    <!-- 탭 start-->
                    <div class="nav nav-tabs nav-justified mb-4" id="v-pills-tab" role="tablist">
                        <!-- 탭 menu start-->
                        <button class="nav-link active" id="v-pills-01-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab01" type="button" role="tab" aria-controls="v-pills-tab01" aria-selected="true" >
                            프로필
                        </button>
                        <button class="nav-link" id="v-pills-02-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab02" type="button" role="tab" aria-controls="v-pills-tab02" aria-selected="false" >
                            계정
                        </button>
                        <button class="nav-link" id="v-pills-point-tab" name="addressListTab" data-bs-toggle="pill" data-bs-target="#v-pills-tab-point" type="button" role="tab" aria-controls="v-pills-tab03" aria-selected="false" >
                            포인트
                        </button>
                        <button class="nav-link" id="v-pills-03-tab" name="addressListTab" data-bs-toggle="pill" data-bs-target="#v-pills-tab03" type="button" role="tab" aria-controls="v-pills-tab03" aria-selected="false" >
                            배송지
                        </button>
                        <button class="nav-link" id="v-pills-04-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab04" type="button" role="tab" aria-controls="v-pills-tab04" aria-selected="false" >
                            수신여부
                        </button>
                    </div>
                    <!-- 탭 menu end-->
                    <div class="row container mb-4 px-5">
                        <!-- 탭 컨텐츠 start -->
                        <div class="tab-content" id="v-pills-tabContent">
                            <!-- tab 1 contents -->
                            <div class="tab-pane fade show active" id="v-pills-tab01" role="tabpanel" aria-labelledby="v-pills-tab01-tab">
                                <ul class="border-bottom py-3">
                                    <li class="row justify-content-between">
                                        <div class="col-auto">
                                            <h6>프로필 사진</h6>
                                        </div>
                                        <div class="col-auto px-3 text-end">
                                            <button class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#profileChangeModal" >
                                                변경
                                            </button>
                                        </div>
                                    </li>
                                    <li class="row w-25">
                                        <img class="img-thumbnail" id = "user_profile_db" src="${userDto.user_profile }" />
                                    </li>
                                </ul>
                                <ul class="border-bottom py-3" id="NameArea">
                                    <li class="row justify-content-between">
                                        <div class="col-auto">
                                            <h6>이름</h6>
                                        </div>
                                    </li>
                                    <li class="row">
                                        <p id="userName">${userDto.user_name }</p>
                                    </li>
                                </ul>
                                <ul class="border-bottom py-3" id="NickNameArea">
                                    <li class="row justify-content-between">
                                        <div class="col-auto">
                                            <h6>닉네임</h6>
                                        </div>
                                        <div class="col-auto px-3 text-end">
                                            <button id="nicknamechangeBtn" class="btn btn-outline-primary" type="button" data-nickname="${userDto.user_nickname }">
                                                변경
                                            </button>
                                        </div>
                                    </li>
                                    <li class="row">
                                        <p id="userNickName">${userDto.user_nickname }</p>
                                    </li>
                                </ul>
                                <ul class="border-bottom py-3" id="IntroArea">
                                    <li class="row justify-content-between">
                                        <div class="col-auto">
                                            <h6>소개</h6>
                                        </div>
                                        <div class="col-auto px-3 text-end">
                                            <button id="introchangeBtn"class="btn btn-outline-primary" type="button" data-introduce="${settingDto.user_introduce }">
                                                변경
                                            </button>
                                        </div>
                                    </li>
                                    <li class="row">
                                        <p id="userIntro">${settingDto.user_introduce }</p>
                                    </li>
                                    
                                </ul>
                            </div>
                            <!-- Modal -->
                            <div class="modal fade" id="profileChangeModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="profileChangeModalLabel" aria-hidden="true" >
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="profileChangeModalLabel">프로필 사진 변경</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body"><%@ include file = "profileUpload.jsp"%></div>
                                        <div class="modal-footer">
                                            <button type="button" id="modifyUserBtn" class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close" >
                                                확인
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- NicknameChangeModal -->
                            <div class="modal fade" id="NicknameChangeModal" tabindex="-1" aria-labelledby="NicknameChangeModalLabel" aria-hidden="true" >
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="NicknameChangeModalLabel">이름 변경</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" ></button>
                                        </div>
                                        <div class="modal-body mx-auto">
                                            <div class="input-group mb-3">
                                                <span class="input-group-text" id="basic-addon1">@</span>
                                                <input name="user_NickName" id="user_NickName" type="text" class="form-control" placeholder="${userDto.user_nickname }" aria-label="Username" aria-describedby="basic-addon1" />
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button id="modnicknameBtn" type="button" class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close" >
                                                확인
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- IntroChangeModal -->
                            <div class="modal fade" id="introChangeModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="introChangeModalLabel" aria-hidden="true" >
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="introChangeModalLabel">소개글 변경</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" ></button>
                                        </div>
                                        <div class="modal-body">
                                            <textarea name="user_introduce" id="user_Introduce" type="text" class="form-control col-10" placeholder="소개글 입력" rows="5" ></textarea>
                                        </div>
                                        <div class="modal-footer">
                                            <button id="modintroBtn" type="button" class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close" >
                                                확인
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- tab 2 contents -->
                            <div class="tab-pane fade" id="v-pills-tab02" role="tabpanel" aria-labelledby="v-pills-tab02-tab">
                                <ul class="border-bottom py-3">
                                    <li class="row justify-content-between">
                                        <div class="col-auto">
                                            <h6>이메일</h6>
                                        </div>
                                        <!-- 이메일 변경 버튼 숨기기 -->
                                        <!-- <div class="col-auto px-3 text-end">
                    					<button class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#introChangeModal" disabled>변경</button>
                  						</div> -->
                                    </li>
                                    <li class="row">
                                        <p>${userDto.user_id }</p>
                                    </li>
                                </ul>
                                <ul class="border-bottom py-3">
                                    <li class="row justify-content-between">
                                        <div class="col-auto">
                                            <h6>비밀번호</h6>
                                        </div>
                                        <div class="col-auto px-3 text-end">
                                            <button id="pwdchangeBtn" class="btn btn-outline-primary" type="button">
                                                변경
                                            </button>
                                        </div>
                                    </li>
                                    <li class="row">
                                        <p>******</p>
                                    </li>
                                </ul>
                                <ul class="border-bottom py-3">
                                    <li class="row justify-content-between">
                                        <div class="col-auto">
                                            <h6>연락처</h6>
                                        </div>
                                        <div class="col-auto px-3 text-end">
                                            <button id="phonemodBtn" class="btn btn-outline-primary">
                                                변경
                                            </button>
                                        </div>
                                    </li>
                                    <li class="row">
                                        <p id="userPhone">${userDto.user_phone }</p>
                                    </li>
                                </ul>
                                <ul class="border-bottom py-3">
                                    <li class="row justify-content-between">
                                        <div class="col-auto">
                                            <h6>회원탈퇴</h6>
                                        </div>
                                        <div class="col-auto px-3 text-end">
                                            <button class="btn btn-outline-primary" onclick="location.href='user/leave'">탈퇴</button>
                                        </div>
                                    </li>
                                    <li class="row">
                                        <p>퍼플레잉 회원 탈퇴페이지로 이동합니다.</p>
                                    </li>
                                </ul>
                            </div>
                            <!-- PwdChangeModal -->
                            <div class="modal fade" id="pwdChangeModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="pwdChangeModalLabel" aria-hidden="true" >
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="introChangeModalLabel">비밀번호 변경</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" ></button>
                                        </div>
                                        <div class="modal-body">
                                            <label for="password" class="form-label">비밀번호</label>
                                            <input type="password" class="form-control mb-2" id="password" placeholder="비밀번호 입력" required />
                                            <input type="password" class="form-control" id="passwordConfirm" placeholder="비밀번호 확인" required />
                                            <div class="invalid-feedback">Please enter your shipping address.</div>
                                        </div>
                                        <div class="modal-footer">
                                            <button id="modpwdBtn"type="button" class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close">
                                                확인
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- phoneChangeModal -->
                            <div class="modal fade" id="phoneChangeModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="phoneChangeModalLabel" aria-hidden="true" >
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="phoneChangeModalLabel">연락처 변경</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" ></button>
                                        </div>
                                        <div class="modal-body">
                                            <label for="userphone" class="form-label">연락처</label>
                                            <div class="input-group mb-3">
                                                <input id="user_phone" type="text" class="form-control" name="user_phone" placeholder="휴대폰 번호 (-없이 입력)" maxlength="11" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
                                            </div>
                                            <input id="user_phoneConfirm" type="text" class="form-control" name="user_phoneConfirm" placeholder="휴대폰 번호 확인" maxlength="11" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
                                        </div>
                                        <div class="modal-footer">
                                            <button id="modphoneBtn" type="button" class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close" >
                                                확인
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 포인트 탭추가 -->
                            <div class="tab-pane fade" id="v-pills-tab-point" role="tabpanel" aria-labelledby="v-pills-tab-point-tab">
                                <ul class="border-bottom py-3">
                                    <li class="row justify-content-between">
                                        <div class="col-auto">
                                            <h6 id="user_point">현재 보유 포인트 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${pointUserDto.user_point}"/>원</h6>
                                        </div>
                                        <div class="col-auto px-3 text-end check-group">
					                        <input type="button" class="btn btn-primary" id="point_pay" value="충전하기" data-bs-toggle="modal" data-bs-target="#pointpayModal"/>
					                    </div>
					                    <%@ include file ="iamport.jsp" %>
                                    </li>
                                    
                                </ul>
                            </div>
		                      
		                    <!-- 탭 컨텐츠 end -->
                            <!-- tab 3 contents -->
                            <div class="tab-pane fade" id="v-pills-tab03" role="tabpanel" aria-labelledby="v-pills-tab03-tab">
                                <div class="row justify-content-between">
                                    <div class="col-auto">
                                        <h6>등록된 배송지</h6>
                                    </div>
                                    <div class="col-auto px-3 text-end">
                                        <button id="regaddressBtn"class="btn btn-outline-primary">
                                            배송지 추가
                                        </button>
                                    </div>
                                </div>
                                <!-- card start -->
                                <div id="addressList">
                                </div>
                                <!-- 배송지 추가 modal start -->
                                <div class="modal fade" id="addressRegModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="addressRegModalLabel" aria-hidden="true" >
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header p-5 pb-4 border-bottom-0">
                                                <h5 class="fw-bold mb-0">배송지 추가</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body p-5 pt-0">
                                                <form class="">
                                                    <div class="form-floating mb-3">
                                                        <input type="text" class="form-control rounded-3" id="address_name" name="address_name" />
                                                        <label for="label_username">배송지 이름</label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input type="text" class="form-control rounded-3" id="receiver_name" name="receiver_name" />
                                                        <label for="label_username">수령인</label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input type="text" class="form-control rounded-3" id="address_num" name="address_num" readonly />
                                                        <label for="label_address">우편번호</label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input type="text" class="form-control rounded-3" id="address" name="address" readonly />
                                                        <label for="label_address">배송지 주소</label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input type="text" class="form-control rounded-3" id="address_detail" name="address_detail" />
                                                        <label for="label_address_detail">상세 주소</label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input type="text" class="form-control rounded-3" id="receiver_phonenum" name="receiver_phonenum" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
                                                        <label for="label_userphone">연락처</label>
                                                    </div>
                                                    <div class="pb-2 border-bottom">
                                                        <input class="form-check-input" type="checkbox" id="default_address" name="default_address" aria-label="..." />
                                                        기본배송지로 등록
                                                    </div>
                                                    <button id="addressRegBtn" class="w-100 my-3 btn btn-lg rounded-3 btn-primary" type="button">
                                                        배송지 저장
                                                    </button>
                                                </form>
                                            </div>
                                            <!-- modal body -->
                                        </div>
                                    </div>
                                </div>
                                <!-- Modal end-->

                                <!-- 배송지 수정 modal start -->
                                <div class="modal fade" id="addressModiModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="addressModiModalLabel" aria-hidden="true" >
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header p-5 pb-4 border-bottom-0">
                                                <h5 class="fw-bold mb-0">배송지 수정</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body p-5 pt-0">
                                                <form class="">
                                                    <div class="form-floating mb-3">
                                                        <input type="text" class="form-control rounded-3" id="Modaddress_name" name="address_name" />
                                                        <label for="label_username">배송지 이름</label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input type="text" class="form-control rounded-3" id="Modreceiver_name" name="receiver_name" />
                                                        <label for="label_username">수령인</label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input type="text" class="form-control rounded-3 " id="Modaddress_num" name="address_num" readonly/>
                                                        <label for="label_address">우편번호</label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input type="text" class="form-control rounded-3 " id="Modaddress" name="address" readonly/>
                                                        <label for="label_address">배송지 주소</label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input type="text" class="form-control rounded-3 " id="Modaddress_detail" name="address_detail" />
                                                        <label for="label_address_detail">상세 주소</label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input type="text" class="form-control rounded-3" id="Modreceiver_phonenum" name="receiver_phonenum" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
                                                        <label for="label_userphone">연락처</label>
                                                    </div>
                                                    <div class="pb-2 border-bottom">
                                                        <input class="form-check-input" type="checkbox" id="Moddefault_address" name="default_address" aria-label="..." />
                                                        기본배송지로 등록
                                                    </div>
                                                    <button id="addressModBtn" class="w-100 my-3 btn btn-lg rounded-3 btn-primary" type="button" data-bs-dismiss="modal" aria-label="Close" >
                                                        배송지 저장
                                                    </button>
                                                </form>
                                            </div>
                                            <!-- modal body -->
                                        </div>
                                    </div>
                                </div>
                                <!-- Modal end-->

                                <!-- 배송지 삭제 modal start -->
                                <div class="modal fade" id="addressDelModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="addressDelModalLabel" aria-hidden="true" >
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header p-5 pb-4 border-bottom-0">
                                                <h5 class="fw-bold mb-0">배송지 삭제</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body p-5 pt-0">
                                                <form class="">
                                                    <div class="form-floating mb-3">
                                                        <h4>배송지를 삭제 하시겠습니까?</h4>
                                                    </div>
                                                    <button id="addressDelBtn" class="w-100 my-3 btn btn-lg rounded-3 btn-primary" type="button" data-bs-dismiss="modal" aria-label="Close" >
                                                        배송지 삭제
                                                    </button>
                                                </form>
                                            </div>
                                            <!-- modal body -->
                                        </div>
                                    </div>
                                </div>
                                <!-- Modal end-->
                            </div>
                            <!-- tab 4 contents -->
                            <div class="tab-pane fade" id="v-pills-tab04" role="tabpanel" aria-labelledby="v-pills-tab04-tab">
                                <ul class="border-bottom py-3">
                                    <li class="row justify-content-between">
                                        <div class="col-auto">
                                            <h6>메시지</h6>
                                        </div>
                                        <div class="col-auto px-3 text-end check-group">
					                        <input type="checkbox" class="agreeAlarm " id="msg_agree" style="display:none;" name="msg_agree" ${settingDto.msg_agree ? 'checked':'' }>
					                        <label class="fa-regular fa-bell alretBtn fs-6 ${settingDto.msg_agree ? 'fas text-info':'far text-muted' }" for="msg_agree">${settingDto.msg_agree ? '알림 ON':'알림 OFF' }</label>
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
                                        <div class="col-auto px-3 text-end check-group">
					                        <input type="checkbox" class="agreeAlarm" id="update_agree" style="display:none;" name="update_agree" ${settingDto.update_agree ? 'checked':'' }>
					                        <label class="fa-regular fa-bell alretBtn fs-6 ${settingDto.update_agree ? 'fas text-info':'far text-muted' }" for="update_agree">${settingDto.update_agree ? '알림 ON':'알림 OFF' }</label>
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
                                        <div class="col-auto px-3 text-end check-group">
					                        <input type="checkbox" class="agreeAlarm" id="favor_agree" style="display:none;" name="favor_agree" ${settingDto.favor_agree ? 'checked':'' }>
					                        <label class="fa-regular fa-bell alretBtn fs-6 ${settingDto.favor_agree ? 'fas text-info':'far text-muted' }" for="favor_agree">${settingDto.favor_agree ? '알림 ON':'알림 OFF' }</label>
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
                                        <div class="col-auto px-3 text-end check-group">
					                        <input type="checkbox" class="agreeAlarm" id="marketing_agree" style="display:none;" name="marketing_agree" ${settingDto.marketing_agree ? 'checked':'' }>
					                        <label class="fa-regular fa-bell alretBtn fs-6 ${settingDto.marketing_agree ? 'fas text-info':'far text-muted' }" for="marketing_agree">${settingDto.marketing_agree ? '알림 ON':'알림 OFF' }</label>
					                    </div>
                                    </li>
                                    <li class="row text-muted">
                                        <p>퍼플레잉 신규 콘텐츠 및 추천 알림을 이메일로 수신합니다.</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- 탭 컨텐츠 end -->
                </div>
                <!-- 탭 end-->
            </div>
            <!-- contentsWrap end -->
        </section>

        <script type="text/javascript">
          	
        	// 닉네임 수정 버튼을 눌렀을 때
	        $("#nicknamechangeBtn").click(function() {
	        	// user_no의 값을 user_no에 할당
				let user_no = $("#user_no").val()
				
				
				
				// POST 방식으로 user_no의 값을 넘겨준다.
	  			$.ajax({
					type:'POST',	//통신방식 (get,post)
					url: '/purplaying/setting/stmodnname',
					headers:{"content-type" : "application/json"},
					data : JSON.stringify({user_no:user_no}),
					dataType : 'text',
					success:function(result){
						// JSON 방식으로 넘어온 user의 값을 js 형식으로 바꿈
						user = JSON.parse(result)
						// 유저의 닉네임 값을 닉네임 수정 모달창의 입력란에 삽입
						$("#user_NickName").val(user.user_nickname)
						// 닉네임 수정 완료 버튼에 유저 번호 값을 추가해줌
			  			$("#modnicknameBtn").attr("user-no", user_no)
			  			// 닉네임 수정 모달창 보이기
			  			$("#NicknameChangeModal").modal("show")
					},
					error : function(){
						alert("error");
					}
		  		})
	  		})
	  		
	  		$("#modnicknameBtn").click(function() {
	  			// user_no의 값을 user_no에 할당
				let user_no = $("#user_no").val()
				// 닉네임 수정 모달창의 입력란에 있는 값을 user_nickname에 할당
	  			let user_nickname = $("#user_NickName").val()
	  			
	  			// PATCH 방식으로 user_no의 값을 넘겨준다.
	  			$.ajax({
	  				type : 'PATCH',
	  				url : '/purplaying/setting/nname/'+user_no,
	  				headers : { "content-type" : "application/json" }, 		//요청 헤더
					data : JSON.stringify({user_nickname:user_nickname}),		// 서버로 전송할 데이터. stringify()로 직렬화 필요.
					success : function(result) {		// 서버로부터 응답이 도착하면 호출될 함수
							// 수정된 닉네임을 html로 출력
							$("#userNickName").html(user_nickname)
							// 닉네임 수정 모달창 숨기기
							$("#NicknameChangeModal").modal("hide")
							// 닉네임 수정 모달창의 값 초기화
							$("#user_NickName").val("")
					},
	  				error : function() {alert("error")}
	  			})
	  		})
	  		
	  		$("#introchangeBtn").click(function() {
	  			// user_no의 값을 user_no에 할당
				let user_no = $("#user_no").val()
				
				// POST 방식으로 user_no의 값을 넘겨준다.
	  			$.ajax({
					type:'POST',	//통신방식 (get,post)
					url: '/purplaying/setting/stmodintro/'+user_no,
					headers:{"content-type" : "application/json"},
					data : JSON.stringify({user_no:user_no}),
					dataType : 'text',
					success:function(result){
						// JSON 방식으로 넘어온 user의 값을 js 형식으로 바꿈
						user = JSON.parse(result)
						
						$("#user_Introduce").val(user.user_introduce)
			  			$("#modintroBtn").attr("user-no", user_no)
			  			$("#introChangeModal").modal("show")
					},
					error : function(){
						alert("error");
					}
		  		})
	  		})
	  		
	  		$("#modintroBtn").click(function() {
				let user_no = $("#user_no").val()
	  			let user_introduce = $("#user_Introduce").val()
	  			
	  			$.ajax({
	  				type : 'PATCH',
	  				url : '/purplaying/setting/intro/'+user_no,
	  				headers : { "content-type" : "application/json" }, 		//요청 헤더
					data : JSON.stringify({user_introduce:user_introduce}),		// 서버로 전송할 데이터. stringify()로 직렬화 필요.
					success : function(result) {		// 서버로부터 응답이 도착하면 호출될 함수
						$("#userIntro").html(user_introduce)
						$("#introChangeModal").modal("hide")
						$("#user_Introduce").val("")
						
					},
	  				error : function() {alert("error")}
	  			})
	  		})
	  		
	  		$("#pwdchangeBtn").click(function() {
				let user_no = $("#user_no").val()
	
	  			$("#modpwdBtn").attr("user-no", user_no)
	  			$("#pwdChangeModal").modal("show")

	  		})
	  		
	  		$("#modpwdBtn").click(function() {
				let user_no = $("#user_no").val()
	  			let user_pwd = $("#password").val()
	  			let pwdcheck = $("#passwordConfirm").val()
				
	  			
	  			
	  			$.ajax({
	  				type : 'PATCH',
	  				url : '/purplaying/setting/pwd/'+user_no,
	  				headers : { "content-type" : "application/json" }, 		//요청 헤더
					data : JSON.stringify({user_pwd:user_pwd}),		// 서버로 전송할 데이터. stringify()로 직렬화 필요.
					success : function(result) {		// 서버로부터 응답이 도착하면 호출될 함수
						
						$("#pwdChangeModal").modal("hide")
						$("#password").val("")
	  					$("#passwordConfirm").val("")
						
					},
	  				error : function() {alert("error")}
	  			})
	  		})
	  		
	  		$("#phonemodBtn").click(function() {
				let user_no = $("#user_no").val()
	
	  			$("#modphoneBtn").attr("user-no", user_no)
	  			$("#phoneChangeModal").modal("show")
	  		})
	  		
	  		$("#modphoneBtn").click(function() {
				let user_no = $("#user_no").val()
	  			let user_phone = $("#user_phone").val()
	  			let pwdcheck = $("#user_phoneConfirm").val()
				
	  			$.ajax({
	  				type : 'PATCH',
	  				url : '/purplaying/setting/phone/'+user_no,
	  				headers : { "content-type" : "application/json" }, 		//요청 헤더
					data : JSON.stringify({user_phone:user_phone}),		// 서버로 전송할 데이터. stringify()로 직렬화 필요.
					success : function(result) {		// 서버로부터 응답이 도착하면 호출될 함수
						$("#userPhone").html(user_phone)
						$("#phoneChangeModal").modal("hide")
						$("#user_phone").val("")
	  					$("#user_phoneConfirm").val("")
						
					},
	  				error : function() {alert("error")}
	  			})
	  		})

	        
	        $(document).ready(function(){
	        	
	        	let user_no = $("#user_no").val();
	        	
	        	$("#v-pills-03-tab").click(function(){
	        		let user_no = $("#user_no").val()
		  			showList(user_no)
		  		})
	        	
	        	$("#regaddressBtn").click(function() {
					let user_no = $("#user_no").val()
					
					$.ajax({
						type:'POST',	//통신방식 (get,post)
						url: '/purplaying/setting/stregaddress/'+user_no,                                                                                
						headers:{"content-type" : "application/json"},
						data : JSON.stringify({user_no:user_no}),
						dataType : 'text',
						success:function(result){
							cnt = JSON.parse(result)
							if (cnt >= 3) {
								alert('배송지는 최대 3개까지 설정할 수 있습니다.')
							}
							else {
								$("#addressRegBtn").attr("user-no", user_no)
		  						$("#addressRegModal").modal("show")
							}
						},
						error : function(){
							alert("error");
						}
			  		})
		  		})
		  		
		  		$("#addressRegBtn").click(function() {
					let user_no = $("#user_no").val()
		  			let address_name = $("#address_name").val()
					let receiver_name = $("#receiver_name").val()
					let address_num = $("#address_num").val()
					let address = $("#address").val()
					let address_detail = $("#address_detail").val()
					let receiver_phonenum = $("#receiver_phonenum").val()
					let default_address = $("#default_address").val()
					
					if($("#default_address").is(":checked")) {
						default_address = true
					}
					else {
						default_address = false
					}
		  			
		  			$.ajax({
		  				type : 'POST',
		  				url : '/purplaying/setting/address/'+user_no,
		  				headers : { "content-type" : "application/json" }, 		//요청 헤더
		  				dataType : 'text',
						data : JSON.stringify({address_name:address_name,
											   receiver_name:receiver_name,
											   address_num:address_num,
											   address:address,
											   address_detail:address_detail,
											   receiver_phonenum:receiver_phonenum,
											   default_address:default_address}),		// 서버로 전송할 데이터. stringify()로 직렬화 필요.
						success : function(result) {		// 서버로부터 응답이 도착하면 호출될 함수
							$("#addressList").html(toHtml(JSON.parse(result)));
							$("#addressRegModal").modal("hide")
				  			$("#address_name").val("")
							$("#receiver_name").val("")
							$("#address_num").val("")
							$("#address").val("")
							$("#address_detail").val("")
							$("#receiver_phonenum").val("")
							$("#default_address").val("")
						},
		  				error : function() {alert("error")}
		  			})
		  		})
		  		
		  		$('#addressList').on("click","#addModBtn",function(){
					let address_id = $(this).attr("data-address-id")
					
					//alert(address_id)
					
		  			$.ajax({
						type:'POST',	//통신방식 (get,post)
						url: '/purplaying/setting/stmodaddress',                                                                                
						headers:{"content-type" : "application/json"},
						dataType : 'text',
						data : JSON.stringify({address_id:address_id}),
						success:function(result){
							address = JSON.parse(result)
				  			$("#Modaddress_name").val(address.address_name)
							$("#Modreceiver_name").val(address.receiver_name)
							$("#Modaddress_num").val(address.address_num)
							$("#Modaddress").val(address.address)
							$("#Modaddress_detail").val(address.address_detail)
							$("#Modreceiver_phonenum").val(address.receiver_phonenum)
							if (address.default_address == true) {
								$("#Moddefault_address").attr("checked","checked")
							}
							else {
								$("#Moddefault_address").removeAttr("checked")
							}
							$("#addressModiModal").modal("show")
							$("#addressModBtn").attr("data-address-id", address_id)
							
						},
						error : function(){
							alert("error");
						}
			  		})
		  		})
		  		
		  		$("#addressModBtn").click(function() {
		  			let address_id = $(this).attr("data-address-id")
		  			let address_name = $("#Modaddress_name").val()
					let receiver_name = $("#Modreceiver_name").val()
					let address_num = $("#Modaddress_num").val()
					let address = $("#Modaddress").val()
					let address_detail = $("#Modaddress_detail").val()
					let receiver_phonenum = $("#Modreceiver_phonenum").val()
					let default_address = $("#Moddefault_address").val()
					let user_no = $("#user_no").val()
					
					if($("#Moddefault_address").is(":checked")) {
						default_address = true
					}
					else {
						default_address = false
					}
		  			
		  			let mod_address = {
		  					address_id:address_id,
							address_name:address_name,
							receiver_name:receiver_name,
							address_num:address_num,
							address:address,
							address_detail:address_detail,
							receiver_phonenum:receiver_phonenum,
							default_address:default_address,
							user_no:user_no
		  			}
		  			
		  			$.ajax({
		  				type : 'PATCH',
		  				url : '/purplaying/setting/endmodaddress',
		  				headers : { "content-type" : "application/json" }, 		//요청 헤더
						data : JSON.stringify(mod_address),		// 서버로 전송할 데이터. stringify()로 직렬화 필요.
						dataType : 'text',
						success : function(result) {		// 서버로부터 응답이 도착하면 호출될 함수
							$("#addressList").html(toHtml(JSON.parse(result)));
						
							$("#ModaddressModiModal").modal("hide")
				  			$("#Modaddress_name").val("")
							$("#Modreceiver_name").val("")
							$("#Modaddress_num").val("")
							$("#Modaddress").val("")
							$("#Modaddress_detail").val("")
							$("#Modreceiver_phonenum").val("")
							$("#Moddefault_address").val("")
						},
		  				error : function() {alert("error")}
		  			})
		  		})
		  		
		  		$('#addressList').on("click","#addDelBtn",function(){
					let address_id = $(this).attr("data-address-id")
					//alert(address_id)
					$("#addressDelModal").modal("show")
					$("#addressDelBtn").attr("data-address-id", address_id)
		  		})
		  		
		  		$("#addressDelBtn").click(function() {
		  			let address_id = $(this).attr("data-address-id")
		  			let user_no = $("#user_no").val()
		  			//alert(address_id)
		  			
		  			$.ajax({
		  				type : 'DELETE',
		  				url : '/purplaying/setting/deladdress/'+address_id,
		  				headers : { "content-type" : "application/json" }, 		//요청 헤더
		  				data : JSON.stringify({address_id:address_id}),
		  				dataType : 'text',
						success : function(result) {		// 서버로부터 응답이 도착하면 호출될 함수
							alert("배송지가 삭제되었습니다.")
							//alert(JSON.parse(result))
							$("#addressList").html(toHtml(JSON.parse(result)));
							$("#addressDelModal").modal("hide")
							
						},
		  				error : function() {
		  					alert("error")
		  					}
		  			})
		  		})
	        	
	        	$("#modnicknameBtn").attr("disabled", "disabled")
	        	$("#user_NickName").on("input", function(){
		        	if($(this).val() != '') { 
						$("#modnicknameBtn").removeAttr("disabled")
	        		}
	        		else {
	        			$("#modnicknameBtn").attr("disabled", "disabled")
					}
	        	})
	        	
	        	$("#modpwdBtn").attr("disabled", "disabled")
	        	$("#password").on("input", function(){
	        		if($(this).val() == $("#passwordConfirm").val() && $(this).val() != "") {
	        			$("#modpwdBtn").removeAttr("disabled")
	        		}
	        		else {
	        			$("#modpwdBtn").attr("disabled", "disabled")
	        		}
	        	})
	        	
	        	$("#passwordConfirm").on("input", function(){
	        		if($(this).val() == $("#password").val() && $(this).val() != "") {
	        			$("#modpwdBtn").removeAttr("disabled")
	        		}
	        		else {
	        			$("#modpwdBtn").attr("disabled", "disabled")
	        		}
	        	})
	        	
	        	$("#user_phone").on("input", function(){
	        		if($(this).val() == $("#user_phoneConfirm").val() && $(this).val() != "") {
	        			$("#modphoneBtn").removeAttr("disabled")
	        		}
	        		else {
	        			$("#modphoneBtn").attr("disabled", "disabled")
	        		}
	        	})
	        	
	        	$("#user_phoneConfirm").on("input", function(){
	        		if($(this).val() == $("#user_phone").val() && $(this).val() != "") {
	        			$("#modphoneBtn").removeAttr("disabled")
	        		}
	        		else {
	        			$("#modphoneBtn").attr("disabled", "disabled")
	        		}
	        	})
	        	
	        	
	        	
	        	
	        	let showList = function(user_no) {
		        	$.ajax({
		        		type: 'POST',			//요청 메서드
						url: '/purplaying/setting/addresslist/'+user_no,		// 요청 URI
						success : function(result) {			// 서버로부터 응답이 도착하면 호출될 함수 
							$("#addressList").html(toHtml(result))		// result는 서버가 전송한 데이터
						},
						error : function() { alert("error") }	// 에러가 발생할 때, 호출될 함수 
		        	})
		        }
	        	
	        	let toHtml = function(addresses) {
					let tmp = "";
					addresses.forEach(function(address){
						tmp += '<div class="row border rounded w-75 mx-1 mb-4">'
						tmp += '<input id="address_id" type="hidden" value="' + address.address_id + '" />'
	                    tmp += '<div class="border-bottom justify-content-between d-md-flex py-2">'
	                    tmp += '<h6 class="col-auto text-info">' + address.address_name + '</h6>'
	                    tmp += '<div class="col-auto d-md-flex px-3">'
	                    tmp += '<button id="addModBtn" class="btn btn-outline-primary btn-sm me-md-2 " data-address-id="' + address.address_id + '" type="button">M</button>'
	                    tmp += '<button id="addDelBtn" class="btn btn-outline-danger btn-sm me-md-2" data-address-id="' + address.address_id + '" type="button">D</button>'
	                    tmp += '</div></div><div class="px-3 pt-2"><h6>받는분 : ' + address.receiver_name + '</h6><h6>[' + address.address_num + '] '
	                    tmp += address.address + ' ' + address.address_detail + '</h6><h6>' + address.receiver_phonenum + '</h6></div></div>'
					});
					return tmp;
				}
	        	
	        	function checkNumber(event) {
	        		  if(event.key === '.' || event.key === '-' || event.key >= 0 && event.key <= 9) {
	        		    return true;
	        		  }
	        		  
	        		  return false;
	        		}
	        	
	        	 $(".alretBtn").click(function() {
	             	   let _buttonI = event.target;
	             	   var _buttonI_id = $(this).prev().attr("id")
	             	   var _buttonI_id_val = $(this).prev().is(":checked")
	             	   //console.log("_buttonI_id : ",_buttonI_id, _buttonI_id_val)
	             	   let msg_agree = $("#msg_agree").is(":checked")
	             	   let update_agree = $("#update_agree").is(":checked")
	             	   let favor_agree = $("#favor_agree").is(":checked")
	             	   let marketing_agree = $("#marketing_agree").is(":checked")
	             	   let user_no = $("#user_no").val()
	             	   
	             	   if(_buttonI_id=="msg_agree"){
	    	             	msg_agree = !(_buttonI_id_val)
	             	   }
	             	   else if(_buttonI_id=="update_agree"){
	    	             	update_agree =!(_buttonI_id_val)
	             	   }
	             	   else if(_buttonI_id=="favor_agree"){
	    	           		favor_agree = !(_buttonI_id_val)
	             	   }
	             	   else{
	             		   marketing_agree = !(_buttonI_id_val)
	             	   }
	             	   
	             	  const agreeData ={
		             		  user_no:Number(user_no),
		             		  msg_agree:msg_agree,
		             		  update_agree:update_agree,
		             		  favor_agree:favor_agree,
		             		  marketing_agree:marketing_agree
		             	   }
	             	   
	             	   //if (_buttonI.classList.contains("text-info")) { // 알림ON 일때
	             	   if (_buttonI_id_val) { // 알림ON 일때
	      	  			$.ajax({
	      	  				type : 'PATCH',
	      	  				url : '/purplaying/setting/alarm/'+user_no,
	      	  				headers : { "content-type" : "application/json" }, 		//요청 헤더
	      	  				data: JSON.stringify(agreeData),
	      					success : function(result) { 
	      						 _buttonI.classList.remove("fas");
	      	  					 _buttonI.classList.remove("text-info");
	      	  					 _buttonI.classList.add("far");
	      	  					 _buttonI.classList.add("text-muted");
	      	  					 _buttonI.innerText="알림 OFF";
	      	  					 //console.log("agreeData: ",agreeData)			
	      					},
	      					error : function() { alert("error") }
	      	  			})
	      	       	   } //if end
	      	       	   else { // 알림OFF 일때
	      	       		
	      	       		$.ajax({
	      	  				type : 'PATCH',
	      	  				url : '/purplaying/setting/alarm/'+user_no,
	      	  				headers : { "content-type" : "application/json" }, 		//요청 헤더
	      	  				data: JSON.stringify(agreeData),
	      					success : function(result) { 
	      						 _buttonI.classList.remove("far");
	      		  				 _buttonI.classList.remove("text-muted");
	      						 _buttonI.classList.add("fas");
	      						 _buttonI.classList.add("text-info");
	      		  				 _buttonI.innerText="알림 ON";
	      		  				//console.log("agreeData :",agreeData)
	      					},
	      					error : function() { alert("error") }
	      	  			})//ajax end   
	      	       	   }//else end
	      	       	})
	        })
	        
	        </script>

        <!--푸터 인클루드-->
        <%@ include file ="footer.jsp" %>
    </body>
</html>