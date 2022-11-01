<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <!-- meta태그, CSS, JS, 타이틀 인클루드  -->
  <%@ include file ="meta.jsp" %>
</head>

<body>
  <!--헤더 인클루드-->
   <%@ include file ="header.jsp" %>
   
    
    <section>
        <div><h5>퍼플레잉 가이드</h5></div>
        <!-- 탭 메뉴 -->
        <div class="row container mb-4" >
        <div class="nav nav-pills nav-fill" id="v-pills-tab" role="tablist">
            <button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab01" type="button" role="tab" aria-controls="v-pills-tab01" aria-selected="true">서포터</button>
            <button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab02" type="button" role="tab" aria-controls="v-pills-tab02" aria-selected="false">메이커</button>
        </div>
        
        <!-- 서포터 -->
        <div class="row container">
            <div class="tab-content" id="v-pills-tabContent">
                <div class="tab-pane fade show active" id="v-pills-tab01" role="tabpanel" aria-labelledby="v-pills-tab01-tab">
                    <div class="row mb-3 text-center">
                        <div class="col-6 themed-grid-col">
                            <table class="table mb-2">
                                <thead>
                                <tr>
                                    <th>[펀딩] 참여 전</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><a href="#"> [참여 전] 펀딩은 쇼핑과 어떻게 다른가요?</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#"> [참여 전] 펀딩 참여 단계를 자세히 알려주세요!</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#">[참여 전] 펀딩은 어떻게 참여하나요?</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#">[참여 전] 펀딩이 뭐에요?</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#">[참여 전] 왜 우리를 서포터라고 부르나요?</a></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="col-6 themed-grid-col">
                            <table class="table mb-2">
                                <thead>
                                    <tr>
                                    <th>[펀딩] 결제/취소</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                    <td><a href="#"> [결제/취소] 펀딩 취소는 어떻게 하나요?</a></td>
                                    </tr>
                                    <tr>
                                    <td><a href="#">[결제/취소] 펀딩은 언제 결제되나요?</a></td>
                                    </tr>
                                    <tr>
                                    <td><a href="#">[결제/취소] 프로젝트 진행 중인데 예약 취소하고 싶어요!</a></td>
                                    </tr>
                                    <tr>
                                    <td><a href="#">[결제/취소] 오늘 결제된다는데 결제 전에 취소하고싶어요!</a></td>
                                    </tr>
                                    <tr>
                                    <td><a href="#">[결제/취소] 아직 리워드 배송 받기 전인데 취소가 가능할까요?</a></td>
                                    </tr>
                                    <tr>
                                    <td><a href="#">[결제/취소] 결제 영수증은 어디서 발급받나요?</a></td>
                                    </tr>
                                </tbody>
                            </table>
                            <button type="button" class="btn btn-primary">문서 모두 보기</button>
                        </div>
                    </div>
                    <div class="row mb-3 text-center">
                        <div class="col-6 themed-grid-col">
                            <table class="table mb-2">
                                <thead>
                                <tr>
                                    <th>[회원서비스] 서포터클럽</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><a href="#"> [서포터클럽] 무료 체험 중 해지할 수 있나요?</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#"> [서포터클럽] 서포터클럽 해지방법이 궁금해요!</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#">[서포터클럽] 서포터클럽이 뭐에요?</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#">[서포터클럽] 서포터 클럽 가입 방법 알려주세요.</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#">[서포터클럽] 배송비 할인은 어떻게 받을 수 있나요?</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#">[서포터클럽] 이미 한번 혜택을 사용했는데, 멤버십 해지할 수 있나요?</a></td>
                                </tr>
                                </tbody>
                            </table>
                            <button type="button" class="btn btn-primary">문서 모두 보기</button>
                        </div>
                        <div class="col-6 themed-grid-col">
                            <table class="table mb-2">
                                <thead>
                                    <tr>
                                    <th>[회원서비스] 가입/탈퇴</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                    <td><a href="#">[가입/탈퇴] 와디즈 회원으로 가입하고 싶어요.</a></td>
                                    </tr>
                                    <tr>
                                    <td><a href="#">[가입/탈퇴] 법인 회원가입은 어떻게 하나요?</a></td>
                                    </tr>
                                    <tr>
                                    <td><a href="#">[가입/탈퇴] 닉네임 변경하는 방법 알고 싶어요!</a></td>
                                    </tr>
                                    <tr>
                                    <td><a href="#">[가입/탈퇴] 회원 정보는 어떻게 바꾸나요?</a></td>
                                    </tr>
                                    <tr>
                                    <td><a href="#">[가입/탈퇴] 와디즈를 탈퇴하고 싶어요.</a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- 메이커 -->
                <div class="tab-pane fade" id="v-pills-tab02" role="tabpanel" aria-labelledby="v-pills-tab02-tab">
                    <div class="row mb-3 text-center">
                        <div class="col-6 themed-grid-col">
                            <table class="table mb-2">
                                <thead>
                                <tr>
                                    <th>[펀딩] 펀딩 예정</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><a href="#"> [펀딩예정] 개인 후원 펀딩은 무엇인가요?</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#"> [펀딩예정] 펀딩 수수료가 개편되었어요.</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#"> [펀딩예정] 누구나 메이커가 될 수 있나요?</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#"> [펀딩예정] Basic 요금제가 궁금해요!</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#">[펀딩예정] 펀딩 수수료는 얼마인가요?</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#">[펀딩예정] 1:1 프로젝트 매니저 온라인 상담 서비스는 무엇인가요?</a></td>
                                </tr>
                                </tbody>
                            </table>
                            <button type="button" class="btn btn-primary">문서 모두 보기</button>
                        </div>
                        <div class="col-6 themed-grid-col">
                            <table class="table mb-2">
                                <thead>
                                    <tr>
                                    <th>[펀딩] 프로젝트 심사</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                    <td><a href="#"> [프로젝트 심사] 어떤 서류를 필수로 준비해야 하나요?</a></td>
                                    </tr>
                                    <tr>
                                    <td><a href="#">[프로젝트 심사] 스토리를 컨설팅 받을 수 있나요?</a></td>
                                    </tr>
                                    <tr>
                                    <td><a href="#">[프로젝트 심사] 콘텐츠 확인 빨리 받을 수 있나요?</a></td>
                                    </tr>
                                    <tr>
                                    <td><a href="#">[프로젝트 심사] 특허 받은 내용으로 광고해도 되나요?</a></td>
                                    </tr>
                                    <tr>
                                    <td><a href="#">[프로젝트 심사] 상세페이지에 사용하면 안 되는 표현이 있나요?</a></td>
                                    </tr>
                                    <tr>
                                    <td><a href="#">[프로젝트 심사] 와디즈는 어떤 기준으로 광고 심의를 진행하나요?</a></td>
                                    </tr>
                                </tbody>
                            </table>
                            <button type="button" class="btn btn-primary">문서 모두 보기</button>
                        </div>
                    </div>
                    <div class="row mb-3 text-center">
                        <div class="col-6 themed-grid-col">
                            <table class="table mb-2">
                                <thead>
                                    <tr>
                                    <th>[펀딩] 프로젝트 개설</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                    <td><a href="#">[프로젝트 개설] 진행 일정은 어떻게 설정하나요?</a></td>
                                    </tr>
                                    <tr>
                                    <td><a href="#">[프로젝트 개설] 리워드는 어떻게 등록하나요?</a></td>
                                    </tr>
                                    <tr>
                                    <td><a href="#">[프로젝트 개설] 오픈예정 서비스는 필수 인가요?</a></td>
                                    </tr>
                                    <tr>
                                    <td><a href="#">[프로젝트 개설] 리워드 옵션은 무엇이고 어떻게 설정하나요?</a></td>
                                    </tr>
                                    <tr>
                                    <td><a href="#">[프로젝트 개설] 프로젝트 대표 이미지는 어떤 사진이 좋을까요?</a></td>
                                    </tr>
                                    <tr>
                                    <td><a href="#">[프로젝트 개설] 오픈예정 서비스를 신청할 수 있나요?</a></td>
                                    </tr>
                                </tbody>
                            </table>
                            <button type="button" class="btn btn-primary">문서 모두 보기</button>
                        </div>
                        <div class="col-6 themed-grid-col">
                            <table class="table mb-2">
                                <thead>
                                <tr>
                                    <th>[펀딩] 광고서비스</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><a href="#">[광고서비스] SNS 광고 대행 서비스가 뭐에요?</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#">[광고서비스] 와디즈 광고서비스가 무엇인가요?</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#">[광고 서비스] 광고는 어떻게 신청하나요?</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#">[광고서비스] 광고는 어떤 단계로 진행되나요?</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#">[광고서비스] 광고 계약은 어떻게 진행되나요?</a></td>
                                </tr>
                                <tr>
                                    <td><a href="#">[광고서비스] 스토어 프로젝트를 위한 광고도 있나요?</a></td>
                                </tr>
                                </tbody>
                            </table>
                            <button type="button" class="btn btn-primary">문서 모두 보기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </div>
    </section>
  
  <!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
</body>
</html>