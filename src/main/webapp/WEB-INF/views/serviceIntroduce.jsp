<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- meta태그, CSS, JS, 타이틀 인클루드  -->
<%@ include file="meta.jsp"%>
<link rel="stylesheet" href="resources/assets/css/introduce.css">
</head>

<body>
	<!--헤더 인클루드-->
	<%@ include file="header.jsp"%>

	<!--페이지 내용 시작-->
		<section id="intro">

    <div class="intro-content" id="intro-img">
      <h1 class="mb-2">도서 전문 펀딩 사이트, 퍼플레잉</h1>
    </div>

  </section><!-- #intro -->


    <!--==========================
      About Section
    ============================-->
    <section id="about" class="wow fadeInUp">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 about-img">
            <img src="resources/assets/img/purplaying_logo_eng_text.png" alt="">
          </div>

          <div class="col-lg-6 content">
            <h2>도서 전문 펀딩 사이트, 퍼플레잉</h2>
            <h3>퍼플레잉에서 독서의 범위를 넓혀보세요!</h3>

            <ul>
              <li></li>
              <li><i class="ion-android-checkmark-circle"></i>세상에는 수많은 책들이 있습니다.</li>
              <li><i class="ion-android-checkmark-circle"></i>그리고 그 책들은 높은 가치를 지니고 있습니다. </li>
              <li><i class="ion-android-checkmark-circle"></i>하지만, 언어의 장벽은 그 가치를 온전히 받아들이지 못하게 합니다.</li>
            </ul>

          </div>
        </div>

      </div>
    </section><!-- #about -->

    <!--==========================
      Services Section
    ============================-->
    <section id="services">
      <div class="container">
        <div class="section-header">
          <h2>퍼플레잉 주요 서비스와 목표</h2>
          <p>국내에 발간되지 않은 서적 및 각종 문화 아이템을 크라우드 펀딩을 통해 누구나 제안하고 후원받을 수 있으며,<br>후원 받은 금액을 출판 및 번역에 사용하고 후원자분들을 위한 리워드를 제공하는 등의 서비스 전반을 지원, 홍보해 드립니다.</p>
        </div>

        <div class="row">

          <div class="col-lg-6">
            <div class="box wow fadeInLeft">
              <div class="icon"><i class="fa-solid fa-book"></i></div>
              <h4 class="title">도서 번역출판</h4>
              <p class="description">다양한 도서를 소개하고 실제 발매로 이어지는 과정을
              <br>지원하는 것이 퍼플레잉의 주요 목표입니다.<br></p>
            </div>
          </div>

          <div class="col-lg-6">
            <div class="box wow fadeInRight">
              <div class="icon"><i class="fa-solid fa-percent"></i></div>
              <h4 class="title">크라우드 펀딩</h4>
              <p class="description">크라우드 펀딩 시스템을 통한 직접적인 후원을 통해
              <br>출판 과정을 유연하게 지원할 수 있습니다.<br></p>
            </div>
          </div>

          <div class="col-lg-6">
            <div class="box wow fadeInLeft" data-wow-delay="0.2s">
              <div class="icon"><i class="fa-solid fa-language"></i></div>
              <h4 class="title">번역 출판</h4>
              <p class="description">한국에 출간되지 못했던 숨겨진 보석이 빛날 수 도록
              <br>다양한 지원 활동을 하고 있습니다.<br></p>
            </div>
          </div>

          <div class="col-lg-6">
            <div class="box wow fadeInRight" data-wow-delay="0.2s">
              <div class="icon"><i class="fa-solid fa-gift"></i></div>
              <h4 class="title">리워드</h4>
              <p class="description">리워드 시스템을 통해, 내가 원하는 다양한 도서를 후원하고
              <br>창작자와 후원자 사이의 긍정적인 커뮤니케이션을 목표로 합니다.</p>
            </div>
          </div>

        </div>

      </div>
    </section><!-- #services -->

    
    <!--==========================
      Our Team Section
    ============================-->
    <section id="team" class="wow fadeInUp">
      <div class="container">
        <div class="section-header">
          <h2>Purplaying 개발팀 프로필</h2>
        </div>
        <div class="row">
          <div class="col-lg-3 col-md-6">
            <div class="member">
              <div class="pic "><img src="${pageContext.request.contextPath}/resources/assets/img/teamProfile/profile_default.jpg" alt=""></div>
              <div class="details">
                <h4>한승훈</h4>
                <span>Team Leader</span>
                <div class="social">
                  <a href=""><i class="fa-brands fa-github"></i></a>
                  <a href=""><i class="fa-solid fa-blog"></i></a>
                  <a href=""><i class="fa fa-google-plus"></i></a>
                  <a href=""><i class="fa fa-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6">
            <div class="member">
              <div class="pic"><img src="${pageContext.request.contextPath}/resources/assets/img/teamProfile/profile_default.jpg" alt=""></div>
              <div class="details">
                <h4>고영은</h4>
                <span>Team Member</span>
                <div class="social">
                  <a href=""><i class="fa-brands fa-github"></i></a>
                  <a href=""><i class="fa-solid fa-blog"></i></a>
                  <a href=""><i class="fa fa-google-plus"></i></a>
                  <a href=""><i class="fa fa-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6">
            <div class="member">
              <div class="pic"><img src="${pageContext.request.contextPath}/resources/assets/img/teamProfile/profile_default.jpg" alt=""></div>
              <div class="details">
                <h4>김영은</h4>
                <span>Team Member</span>
                <div class="social">
                  <a href=""><i class="fa-brands fa-github"></i></a>
                  <a href=""><i class="fa-solid fa-blog"></i></a>
                  <a href=""><i class="fa fa-google-plus"></i></a>
                  <a href=""><i class="fa fa-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6">
            <div class="member">
              <div class="pic"><img src="${pageContext.request.contextPath}/resources/assets/img/teamProfile/profile_default.jpg" alt=""></div>
              <div class="details">
                <h4>김호경</h4>
                <span>Team Member</span>
                <div class="social">
                  <a href=""><i class="fa-brands fa-github"></i></a>
                  <a href=""><i class="fa-solid fa-blog"></i></a>
                  <a href=""><i class="fa fa-google-plus"></i></a>
                  <a href=""><i class="fa fa-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>
        </div>
		        <div class="row">
          <div class="col-lg-3 col-md-6">
            <div class="member">
              <div class="pic"><img src="${pageContext.request.contextPath}/resources/assets/img/teamProfile/profile_default.jpg" alt=""></div>
              <div class="details">
                <h4>양승민</h4>
                <span>Team Member</span>
                <div class="social">
                  <a href=""><i class="fa-brands fa-github"></i></a>
                  <a href=""><i class="fa-solid fa-blog"></i></a>
                  <a href=""><i class="fa fa-google-plus"></i></a>
                  <a href=""><i class="fa fa-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6">
            <div class="member">
              <div class="pic"><img src="${pageContext.request.contextPath}/resources/assets/img/teamProfile/profile_default.jpg" alt=""></div>
              <div class="details">
                <h4>이규황</h4>
                <span>Team Member</span>
                <div class="social">
                  <a href=""><i class="fa-brands fa-github"></i></a>
                  <a href=""><i class="fa-solid fa-blog"></i></a>
                  <a href=""><i class="fa fa-google-plus"></i></a>
                  <a href=""><i class="fa fa-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6">
            <div class="member">
              <div class="pic"><img src="${pageContext.request.contextPath}/resources/assets/img/teamProfile/profile_default.jpg" alt=""></div>
              <div class="details">
                <h4>이희라</h4>
                <span>Team Member</span>
                <div class="social">
                  <a href=""><i class="fa-brands fa-github"></i></a>
                  <a href=""><i class="fa-solid fa-blog"></i></a>
                  <a href=""><i class="fa fa-google-plus"></i></a>
                  <a href=""><i class="fa fa-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6">
            <div class="member">
              <div class="pic"><img src="${pageContext.request.contextPath}/resources/assets/img/teamProfile/jwc.jpg" alt=""></div>
              <div class="details">
                <h4>전완철</h4>
                <span>Team Member</span>
                <div class="social">
                  <a href="https://github.com/GRPeas"><i class="fa-brands fa-github"></i></a>
                  <a href=""><i class="fa-solid fa-blog"></i></a>
                  <a href=""><i class="fa fa-google-plus"></i></a>
                  <a href=""><i class="fa fa-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

	</section>
	<!--페이지 내용 종료-->

	<!--푸터 인클루드-->
	<%@ include file="footer.jsp"%>
</body>
</html>