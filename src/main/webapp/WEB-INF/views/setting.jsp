<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

 <!-- CSS -->
  <link rel="stylesheet" href="resources/assets/css/dist/bootstrap.min.css"> <!-- 부트스트랩 -->
  <link rel="stylesheet" href="resources/assets/css/animate.css"> <!-- 애니메이션효과 -->
  <link rel="stylesheet" href="resources/assets/css/main.css"> <!-- main style-->
  <link rel="stylesheet" href="resources/assets/css/headers.css"> <!-- header-->
   <!-- <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/headers/">  --><!-- header-->
  <!-- JS -->
  <script type="text/javascript"><%@ include file="resource/assets/js/bootstrap.bundle.min.js"%></script>
  <script type="text/javascript"><%@ include file="resource/assets/js/include.js"%></script>
  
  <script src="http://www.w3schools.com/lib/w3data.js"></script> 
  <!-- <script src="resource/assets/js/bootstrap.bundle.min.js"></script> 
  <script src="resource/assets/js/include.js"></script> -->
<!--   <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script> -->
  <!-- 아이콘  -->
  <script src="https://kit.fontawesome.com/7f409b18dd.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="resources/assets/css/fontawesome.css"> <!-- 아이콘 -->
  
  <!-- 네이버 로그인 callback -->
  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

 

  
 

  <title>Purplaying</title>

</head>

<body>
  <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
    <symbol id="bootstrap" viewBox="0 0 118 94">
      <path fill-rule="evenodd" clip-rule="evenodd" d="M24.509 0c-6.733 0-11.715 5.893-11.492 12.284.214 6.14-.064 14.092-2.066 20.577C8.943 39.365 5.547 43.485 0 44.014v5.972c5.547.529 8.943 4.649 10.951 11.153 2.002 6.485 2.28 14.437 2.066 20.577C12.794 88.106 17.776 94 24.51 94H93.5c6.733 0 11.714-5.893 11.491-12.284-.214-6.14.064-14.092 2.066-20.577 2.009-6.504 5.396-10.624 10.943-11.153v-5.972c-5.547-.529-8.934-4.649-10.943-11.153-2.002-6.484-2.28-14.437-2.066-20.577C105.214 5.894 100.233 0 93.5 0H24.508zM80 57.863C80 66.663 73.436 72 62.543 72H44a2 2 0 01-2-2V24a2 2 0 012-2h18.437c9.083 0 15.044 4.92 15.044 12.474 0 5.302-4.01 10.049-9.119 10.88v.277C75.317 46.394 80 51.21 80 57.863zM60.521 28.34H49.948v14.934h8.905c6.884 0 10.68-2.772 10.68-7.727 0-4.643-3.264-7.207-9.012-7.207zM49.948 49.2v16.458H60.91c7.167 0 10.964-2.876 10.964-8.281 0-5.406-3.903-8.178-11.425-8.178H49.948z"></path>
    </symbol>
    <symbol id="home" viewBox="0 0 16 16">
      <path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z"/>
    </symbol>
    <symbol id="speedometer2" viewBox="0 0 16 16">
      <path d="M8 4a.5.5 0 0 1 .5.5V6a.5.5 0 0 1-1 0V4.5A.5.5 0 0 1 8 4zM3.732 5.732a.5.5 0 0 1 .707 0l.915.914a.5.5 0 1 1-.708.708l-.914-.915a.5.5 0 0 1 0-.707zM2 10a.5.5 0 0 1 .5-.5h1.586a.5.5 0 0 1 0 1H2.5A.5.5 0 0 1 2 10zm9.5 0a.5.5 0 0 1 .5-.5h1.5a.5.5 0 0 1 0 1H12a.5.5 0 0 1-.5-.5zm.754-4.246a.389.389 0 0 0-.527-.02L7.547 9.31a.91.91 0 1 0 1.302 1.258l3.434-4.297a.389.389 0 0 0-.029-.518z"/>
      <path fill-rule="evenodd" d="M0 10a8 8 0 1 1 15.547 2.661c-.442 1.253-1.845 1.602-2.932 1.25C11.309 13.488 9.475 13 8 13c-1.474 0-3.31.488-4.615.911-1.087.352-2.49.003-2.932-1.25A7.988 7.988 0 0 1 0 10zm8-7a7 7 0 0 0-6.603 9.329c.203.575.923.876 1.68.63C4.397 12.533 6.358 12 8 12s3.604.532 4.923.96c.757.245 1.477-.056 1.68-.631A7 7 0 0 0 8 3z"/>
    </symbol>
    <symbol id="table" viewBox="0 0 16 16">
      <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm15 2h-4v3h4V4zm0 4h-4v3h4V8zm0 4h-4v3h3a1 1 0 0 0 1-1v-2zm-5 3v-3H6v3h4zm-5 0v-3H1v2a1 1 0 0 0 1 1h3zm-4-4h4V8H1v3zm0-4h4V4H1v3zm5-3v3h4V4H6zm4 4H6v3h4V8z"/>
    </symbol>
    <symbol id="people-circle" viewBox="0 0 16 16">
      <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
      <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
    </symbol>
    <symbol id="grid" viewBox="0 0 16 16">
      <path d="M1 2.5A1.5 1.5 0 0 1 2.5 1h3A1.5 1.5 0 0 1 7 2.5v3A1.5 1.5 0 0 1 5.5 7h-3A1.5 1.5 0 0 1 1 5.5v-3zM2.5 2a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 1h3A1.5 1.5 0 0 1 15 2.5v3A1.5 1.5 0 0 1 13.5 7h-3A1.5 1.5 0 0 1 9 5.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zM1 10.5A1.5 1.5 0 0 1 2.5 9h3A1.5 1.5 0 0 1 7 10.5v3A1.5 1.5 0 0 1 5.5 15h-3A1.5 1.5 0 0 1 1 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3zm6.5.5A1.5 1.5 0 0 1 10.5 9h3a1.5 1.5 0 0 1 1.5 1.5v3a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 13.5v-3zm1.5-.5a.5.5 0 0 0-.5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 0-.5-.5h-3z"/>
    </symbol>
  </svg>
  
 
  <!--헤더 컨테이너-->
  <h1 class="visually-hidden">Header</h1>
  <header class="p-3 border-bottom">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
          <svg class="logo" width="140" height="36" aria-label="Bootstrap"></svg>
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
          <li><a href="#" class="nav-link px-2 link-secondary">메뉴1</a></li>
          <li><a href="#" class="nav-link px-2 link-dark">메뉴2</a></li>
          <li><a href="#" class="nav-link px-2 link-dark">메뉴3</a></li>
          <li><a href="#" class="nav-link px-2 link-dark">메뉴4</a></li>
        </ul>

        <!-- 검색창 -->
        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
          <input type="search" class="form-control" placeholder="Search..." aria-label="Search">
        </form>

        <div class="dropdown text-end">
          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
          </a>
          <ul class="dropdown-menu text-small">
            <li><a class="dropdown-item" href="mypage.html">마이페이지</a></li>
            <li><a class="dropdown-item" href="#">설정</a></li>
            <li><a class="dropdown-item" href="#">고객센터</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">로그아웃</a></li>
          </ul>
        </div>
      </div>
    </div>
  </header>

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
                  <img class="img-thumbnail" src="assets/img/purplaying-rect-logo.png">
                </li>
                <!-- Modal -->
                <div class="modal fade" id="profileChangeModal" tabindex="-1" aria-labelledby="profileChangeModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="profileChangeModalLabel" >프로필 사진 변경</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body mx-auto">
                        <img class="img-thumbnail mb-3" src="assets/img/purplaying-rect-logo.png">
                        <div class="input-group mb-3">
                          <input type="file" class="form-control" id="inputGroupFile02">
                          <label class="input-group-text" for="inputGroupFile02">Upload</label>
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
              <!-- modal start -->
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
  <footer class="p-5">
    <div class="row">
      <div class="col-6 col-md-2 mb-3">
        <h5>퍼플레잉</h5>
        <ul class="nav flex-column">
          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">공지사항</a></li>
          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">서비스 소개</a></li>
        </ul>
      </div>

      <div class="col-6 col-md-2 mb-3">
        <h5>이용안내</h5>
        <ul class="nav flex-column">
          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">창작 가이드</a></li>
          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">후원 가이드</a></li>
        </ul>
      </div>

      <div class="col-6 col-md-2 mb-3">
        <h5>정책</h5>
        <ul class="nav flex-column">
          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">이용약관</a></li>
          <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-muted">개인정보처리 방침</a></li>
        </ul>
      </div>

      <div class="col-md-5 offset-md-1 mb-3 text-end">
        <form>
          <h5>고객지원</h5>
          <ul class="nav flex-column">
            <li class="nav-item mb-2"><button class="btn btn-primary" type="button">고객센터 문의하기</button></li>
          </ul>
        </form>
      </div>
    </div>

    <div class="py-4 border-top">
      <p class="nav flex-column mb-3">
        회사명  퍼플레잉㈜  |  주소  서울 서초구 서초대로 77길, 54 (서초더블유타워 13,14층)  |  대표  이순신  |  사업자등록번호  167-85-00921  |  통신판매업 신고번호  제2018-서울서초-0507호 | 대표번호  1644-0685  &copy; 2022 Purplaying Inc.
      </p>
      <p class="nav flex-column text-small text-muted">퍼플레잉은 플랫폼 제공자로서 프로젝트의 당사자가 아니며, 직접적인 통신판매를 진행하지 않습니다. 프로젝트의 완수 및 선물제공의 책임은 해당 프로젝트의 창작자에게 있으며, 프로젝트와 관련하여 후원자와 발생하는 법적 분쟁에 대한 책임은 해당 창작자가 부담합니다.
      </p>
    </div>
  </footer>
</body>
</html>