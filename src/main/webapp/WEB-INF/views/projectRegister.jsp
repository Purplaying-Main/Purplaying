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
   
   <!--페이지 내용 시작-->
   <section>
     <h1 class="visually-hidden">HOME</h1>
   	 <div class="contentsWrap">
      <!--컨텐츠 영역-->
      <div class="row justify-content-md-center">
        <h2 class="col-auto mb-5">프로젝트 기획</h2>
      </div>
      <div class="mb-4"> <!-- 탭 메뉴 -->
        <div class="nav nav-tabs nav-justified" id="v-pills-tab" role="tablist">
          <button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab01" type="button" role="tab" aria-controls="v-pills-tab01" aria-selected="true">기본정보</button>
          <button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab02" type="button" role="tab" aria-controls="v-pills-tab02" aria-selected="false">펀딩계획</button>
          <button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab03" type="button" role="tab" aria-controls="v-pills-tab03" aria-selected="false">리워드 구성</button>
          <button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab04" type="button" role="tab" aria-controls="v-pills-tab04" aria-selected="false">프로젝트 계획</button>
          <button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab05" type="button" role="tab" aria-controls="v-pills-tab05" aria-selected="false">창작자 정보</button>
          <button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-tab06" type="button" role="tab" aria-controls="v-pills-tab06" aria-selected="false">신뢰와 안전</button>
        </div>
      </div>
      <div class="tab-content px-5" id="v-pills-tabContent"><!-- 탭 컨텐츠 start -->
        <!-- tab 1 contents -->
        <div class="tab-pane fade show active" id="v-pills-tab01" role="tabpanel" aria-labelledby="v-pills-tab01-tab">
          <div class="row pb-3 border-bottom mt-4">
            <div class="col-6">
              <h5>프로젝트 카테고리</h5>
              <p>프로젝트 성격과 가장 일치하는 카테고리를 선택해주세요. 적합하지 않을 경우 운영자에 의해 조정될 수 있습니다.</p>
            </div>
            <div class="col-6 px-3">
              <select class="form-select" aria-label="Default select example" rows="1" style="resize: none;">
                <option value="selected">장르를 선택해주세요</option>
                <option value="1">소설</option>
                <option value="2">만화</option>
                <option value="3">학술서</option>
              </select>
            </div>
          </div>
          <div class="row pb-3 border-bottom mt-4">
            <div class="col-6">
              <h5>프로젝트 제목</h5>
              <p>프로젝트의 주제, 책의 특징이 드러나는 멋진 제목을 붙여주세요.</p>
            </div>
            <div class="col-6 px-3 text-end">
              <textarea class="form-control" placeholder="제목을 입력하세요." rows="1" style="resize: none;"></textarea>
              <span class="text-danger text-small">0/20</span>
            </div>
          </div>
          <div class="row pb-3 border-bottom mt-4">
            <div class="col-6">
              <h5>프로젝트 대표 이미지</h5>
              <p>후원자들이 프로젝트의 내용을 쉽게 파악하고 좋은 인상을 받을 수 있도록 이미지 가이드라인을 따라 주세요.</p>
            </div>
            <div class="col-6 px-3">
              <div class="input-group mb-3">
                <input type="file" class="form-control" id="inputGroupFile02">
                <label class="input-group-text" for="inputGroupFile02">Upload</label>
              </div>
            </div>
          </div>
          <div class="row pb-3 mt-4">
            <div class="col-6">
              <h5>프로젝트 설명</h5>
              <p>후원자 분들이 프로젝트를 빠르게 이해할 수 있도록 명확하고 간략하게 소개해주세요</p>
            </div>
            <div class="col-6 px-3 text-end">
              <textarea class="form-control" placeholder="내용 작성​" rows="5" style="resize: none;"></textarea>
              <span class="text-danger text-small">0/50</span>
            </div>
          </div>
          <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4 border-top border-2 py-4">
            <button class="btn btn-primary me-md-2" type="button">저장하기</button>
            <button class="btn btn-primary" type="button" id="nextBtn">다음단계</button>
          </div>
        </div>

        <!-- tab 2 contents -->
        <div class="tab-pane fade" id="v-pills-tab02" role="tabpanel" aria-labelledby="v-pills-tab02-tab">
          <div class="row pb-3 border-bottom">
            <div class="col-6">
              <h5>목표 금액</h5>
              <p>프로젝트를 완수하기 위해 필요한 금액을 설정해주세요.​</p>
              <ul class="bg-light rounded p-3">
                <li class="text-danger">목표 금액 설정 시 꼭 알아두세요!</li>
                <li class="text-muted text-small">종료일까지 목표금액을 달성하지 못하면 후원자​ 결제가 진행되지 않습니다.​</li>
                <li class="text-muted text-small">종료 전 후원 취소를 대비해 10% 이상 초과 달성을​ 목표로 해주세요.​</li>
                <li class="text-muted text-small">제작비, 리워드 배송비, 인건비, 예비 비용 등을 함께​ 고려해주세요.​</li>
              </ul>
            </div>
            <div class="col-6 px-3">
              <textarea class="form-control mb-4" placeholder="50만원 이상의 금액을 입력해주세요." rows="1" style="resize: none;"></textarea>
              <h6 class="px-2">목표 금액 달성시 예상 수령액</h6>
              <h5 class="text-primary text-end">720,000원</h5>
              <hr class="px-3">
              <div class="row text-muted">
                <p class="col-8 text-start">총 수수료</p>
                <p class="col-4 text-end">000,000원</p>
              </div>
              <div class="row text-muted">
                <p class="col-8 text-start">결제 대행 수수료<span class="text-small">(총 결제액의 3% + VAT)</span></p>
                <p class="col-4 text-end">000,000원</p>
              </div>
              <div class="row text-muted">
                <p class="col-8 text-start">플랫폼 수수료<span class="text-small">(총 모금액의 5% + VAT)</span></p>
                <p class="col-4 text-end">000,000원</p>
              </div>
            </div>
          </div>
          <div class="row pb-3 mt-4">
            <div class="col-6">
              <h5>펀딩 일정</h5>
              <p>설정한 일시가 되면 펀딩이 자동 시작됩니다. 펀딩 시작 전까지​ 날짜를 변경할 수 있고, 즉시 펀딩을 시작할 수도 있습니다.</p>
            </div>
            <div class="col-6 px-3">
              <div class="row mb-2">
                <h6 class="col-4 text-start py-3">시작일</h6>
                <div class="col-8"><input class="form-control" type="date" name="startday"></div>
              </div>
              <div class="row mb-2">
                <h6 class="col-4 text-start py-3">종료일</h6>
                <div class="col-8"><input class="form-control" type="date" name="endday"></div>
              </div>
              <p class="text-end text-info">펀딩 기간 XX일</p>
              <h6>후원자 결제 종료</h6>
              <p class="text-small bg-light rounded p-3 text-muted">프로젝트 성공 시 펀딩 종료 다음 날 후원금이 결제됩니다.​ 단, 후원자의 사정으로 결제가 이루어지지 않은 경우는 제외합니다.​</p>
              <h6>정산일</h6>
              <p class="text-info">예상 정산일은 YYYY년 MM월 DD일입니다.</p>
            </div>
          </div>
          <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4 border-top border-2 py-4">
            <button class="btn btn-primary me-md-2" type="button">저장하기</button>
            <button class="btn btn-primary" type="button" id="nextBtn">다음단계</button>
          </div>
        </div>
        <!-- tab 3 contents -->
        <div class="tab-pane fade" id="v-pills-tab03" role="tabpanel" aria-labelledby="v-pills-tab03-tab">
          <div class="row pb-3 mt-4">
            <div class="col-4">
              <div class="card mb-3"><!--reward start-->
                <div class="card-header d-flex">
                  <div class="col-8 text-start">리워드 #01</div>
                  <div class="d-md-flex text-end">
                    <button class="btn btn-outline-primary btn-sm me-md-2" type="button">M</button>
                    <button class="btn btn-outline-danger btn-sm" type="button">D</button>
                  </div>
                </div>
                <div class="card-body">
                  <h5 class="card-title">1,000원</h5>
                  <p class="card-text">리워드 없이 </p>
                </div>
                <div class="card-footer text-muted">
                  수량 00개
                </div>
              </div><!--reward end-->
              <div class="card mb-3"><!--reward start-->
                <div class="card-header d-flex">
                  <div class="col-8 text-start">리워드 #02</div>
                  <div class="d-md-flex text-end">
                    <button class="btn btn-outline-primary btn-sm me-md-2" type="button">M</button>
                    <button class="btn btn-outline-danger btn-sm" type="button">D</button>
                  </div>
                </div>
                <div class="card-body">
                  <h5 class="card-title">12,000원</h5>
                  <p class="card-text">책 1권 + 뱃지1개 </p>
                </div>
                <div class="card-footer text-muted">
                  수량 00개
                </div>
              </div><!--reward end-->
            </div>
            <div class="col-8 px-3">
              <h5>리워드 만들기</h5>
              <p>리워드는 후원자에게 프로젝트의 가치를 전달하는 수단입니다. 다양한 금액대로 여러 개의 리워드를 만들어주세요. 펀딩 성공률이 높아지고, 더 많은 후원 금액을 모금할 수 있어요.</p>
              <hr class="mb-4">
              <h5>리워드 금액</h5>
              <p>배송이 필요한 선물을 배송비를 포함해주세요.</p>
              <textarea class="form-control mt-2" placeholder="1000원 이상의 금액을 입력하세요" rows="1" style="resize: none;"></textarea>
              <hr class="mb-4">
              <h5>리워드 설명</h5>
              <textarea class="form-control mt-2" placeholder="리워드 상품 구성을 적어주세요" rows="5" style="resize: vertical;"></textarea>
              <hr class="mb-4">
              <h5>수량 제한(추가옵션)</h5><span class="text-muted">수량 제한이 없을 경우 0을 입력</span>
              <textarea class="form-control mt-2" placeholder="수량을 입력해 주세요." rows="1" style="resize: none;"></textarea>
            </div>
            <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
              <button class="btn btn-outline-primary me-md-2" type="button">추가하기</button>
              <button class="btn btn-outline-secondary" type="button">초기화</button>
            </div>
          </div>
          <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4 border-top border-2 py-4">
            <button class="btn btn-primary me-md-2" type="button">저장하기</button>
            <button class="btn btn-primary" type="button" id="nextBtn">다음단계</button>
          </div>
        </div>
        <!-- tab 4 contents -->
        <div class="tab-pane fade" id="v-pills-tab04" role="tabpanel" aria-labelledby="v-pills-tab04-tab">
          <div class="row">
            <h5>프로젝트 소개​</h5>
            <p>무엇을 만들기 위한 프로젝트인지 분명히 알려주세요.</p>
          </div>
          <textarea class="form-control" placeholder="예시&#13;&#10;​Q. 무엇을 만들기 위한 프로젝트인가요?&#13;&#10;​Q. 프로젝트를 간단히 소개한다면?&#13;&#10;​Q. 이 프로젝트가 왜 의미있나요?&#13;&#10;​Q. 이 프로젝트를 시작하게 된 배경이 무엇인가요?​" rows="30" style="resize: none;"></textarea>
        </div>
        <!-- tab 5 contents -->
        <div class="tab-pane fade" id="v-pills-tab05" role="tabpanel" aria-labelledby="v-pills-tab05-tab">
          <div class="row pb-3 border-bottom mt-4">
            <div class="col-6">
              <h5>본인 인증</h5>
              <p>창작자 본인 이메일로 인증해주세요</p>
            </div>
            <div class="col-6 px-3 text-end">
              <div class="input-group">
                <input type="email" class="form-control" placeholder="user@email.com" aria-describedby="button-addon2">
                <button class="btn btn-outline-secondary" type="button" id="button-addon2">인증하기</button>
              </div>
            </div>
          </div>
          <div class="row pb-3 border-bottom mt-4">
            <div class="col-6">
              <h5>입금 계좌</h5>
              <p>후원금을 전달받을 계좌를 등록해주세요.</p>
            </div>
            <div class="col-6 px-3">
              <div class="row row-cols-1 row-cols-md-2 mb-4">
                <div class="col-md-4">
                  <p>계좌종류</p>
                  <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                    <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
                    <label class="btn btn-outline-primary" for="btnradio1">개인</label>
                    <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
                    <label class="btn btn-outline-primary" for="btnradio2">사업자</label>
                  </div>
                </div>
                <div class="col-md-8">
                  <p>예금주 생년월일 / 사업자번호</p>
                  <input type="number" class="form-control" placeholder="예금주 생년월일 / 사업자번호">
                </div>
              </div>
              <div class="row row-cols-1 row-cols-md-2 mb-4">
                <div class="col-md-4">
                  <p>거래은행</p>
                  <input type="text" class="form-control" placeholder="은행명">
                </div>
                <div class="col-md-8">
                  <p>예금주 명</p>
                  <input type="text" class="form-control" placeholder="예금주 명">
                </div>
              </div>
              <div class="row px-2 mb-4">
                <p>계좌번호</p>
                <input type="number" class="form-control" placeholder="계좌번호 - 빼고 숫자만 입력">
              </div>
              <div class="row mb-4">
                <p>통장사본 첨부</p>
                <div class="input-group">
                  <input type="file" class="form-control" id="inputGroupFile02">
                  <label class="input-group-text" for="inputGroupFile02">Upload</label>
                </div>
              </div>

            </div>
          </div>
        </div>
        <!-- tab 6 contents -->
        <div class="tab-pane fade" id="v-pills-tab06" role="tabpanel" aria-labelledby="v-pills-tab06-tab">
          <div class="row mb-4">
            <div class="col-4">
              <h5>프로젝트 정책</h5>
              <p>아래와 같은 사항을 고려해서 작성해주세요. 진행하는 프로젝트에 해당되지 않는 항목은 삭제해주세요.</p>
              <ul class="bg-light rounded p-3 text-muted text-small">
                <li>
                  <p>펀딩 마감 이후에는 후원금액이 창작자에게 전달되기에 퍼플레잉을 통해 환불이 불가합니다. 환불은 창작자가 환불계좌를 받아 반환하는 방식으로만 가능하며, 어떤 경우에 환불이
                    가능한지를 기재해주세요.</p>
                <li>
                  <p>펀딩 성사 후 지연 또는 선물 전달에 문제가 발생했을 때에 어떤 식으로 대응하시겠어요? 이 프로젝트 특성상 발생할 수 있는 문제에 대한 추가적인 정책이나 약속이 있다면
                    기재해주세요. (후원금 환불, 대체 보상 등)</p>
                </li>
                <li>
                  <p>배송이 필요한 선물에 문제가 발생한 경우 교환, A/S는 어떻게 진행되나요?</p>
                </li>
              </ul>
            </div>
            <div class="col-8">
              <textarea class="form-control" placeholder="내용을 입력하세요." rows="30" style="resize: none;"></textarea>
            </div>
          </div>
        </div>
      </div><!-- 탭 컨텐츠 end -->
    </div><!-- contentsWrap end -->
   </section>
   <!--페이지 내용 종료-->
    
 <!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
</body>
</html>