# 작업로그
<pre>
admin 아이디 : admin@gmail.com 비밀번호 : 0111

2022.11.02
	! [김호경] error(400,500) 페이지 필요
	! [전완철] 푸터 연결 페이지 중 내용 없는 페이지 내용 채워넣기
	+ [이희라] projectregister 페이지 프로젝트 계획에 summernote 추가 필요 & 저장하기,다음단계 버튼 필요(프로젝트계획, 창작자정보 탭)
	+ [이희라] findaccount 페이지 점검 필요 (연결 등)
	+ 결제 api 확인해서 DB 만들기
	======= 쿼리문작성 =======
	+ [전완철] user, role
	+ [이규황] ask, board
	+ [양승민,김호경] project, genre, reward
	+ [한승훈] payment, reserve, delivery 
	+ [고영은] address, mypage
	+ [김영은] chat_service
	
나아아아아중에
	+ signup,signin 페이지에 소셜 로그인 이미지 추가
	+ setting 페이지 프로필 사진 변경 모달에 사진 클릭 후 적용되는 스크립트 필요

2022.11.01
	해야할 부분 :
	o [전체] 각 페이지 하트 버튼 스크립트 추가 
	o [이희라] 헤더 프로필 드롭다운에 프로젝트 올리기(register)버튼 추가, 헤더에 signup 페이지 필요
	! [전완철] 푸터 페이지 연결 필요
	o [전완철] setting 페이지 프로필 사진 변경 모달에 사진 클릭 후 적용되는 스크립트 필요 (=>나중)
	o [김영은] index 페이지 카로셀 버튼에 디테일 페이지 연결 필요
	o [한승훈] funding 찜하기 하트 크기 조금만 크게 , 버튼>체크박스로 수정
	o [한승훈] setting 페이지 이메일 변경 버튼 삭제, setting 페이지-배송 탭에 배송지 삭제 클릭시 모달 필요
	o [이&한] servicecenter 페이지 스크롤 잡히는 현상 수정 필요
	o [이&한] servicecenter 글 작성 버튼 클릭시 글작성 페이지(inquiryWrite)로 연결 필요
	o [이규황] servicecenter 페이지 내에 내부 탭을 세개의 페이지로 분할
	o [이희라] inquiryWrite 페이지 CSS 재설정
	o [고영은] guidepage 페이지를 창작가이드, 후원가이드 두 페이지로 분리 필요 & 문서 모두보기 버튼은 제거
	o [이희라] projectregister 페이지에서 신뢰와 안전 summernote api 적용 & 신청등록버튼 필요
	o [이희라] leave 페이지 - 1:1문의 클릭시 연결 필요, 본인인증>회원탈퇴하기 누르고 나서 메인으로 이동 연결 필요
	o [이희라] signup 페이지내에 로그인 연결필요, 회원가입 완료 모달에서 확인 누르면 login 페이지로 연결 필요, 
			내용보기 모달에서 동의 누르면 체크되는 스크립트 추가 필요 (전체동의는 됨), signup,signin 페이지에 소셜 로그인 이미지 추가
	o [김영은] projectDetailPage 페이지 공유하기 스크립트 추가,찜하기 버튼을 체크박스로 변경,상단에 장르 페이지 연결 확인 및 링크 영역 수정
	o [김영은] comingsoon 페이지 달성률 바 없애고 D-DAY로 변경
	! [김호경] error(400,500) 페이지 필요
	
2022.10.31
	o projectDetailPage : 이 리워드 펀딩하기 선택시 펀딩하기 버튼 위에 수량선택할수 있도록 하는 기능 필요 [이희라]
	o projectDetailPage에 카로셀 제거 [양승민]
	o projectDetailPage : 문의하기클릭시 servicecenter로 연결 필요 [양승민]
	o projectDetailPage : 창작자 프로필 클릭 시 창작자 검색결과 페이지로 연결 [김호경]
	o 헤더에 인기펀딩/신규펀딩 클릭시 연결 페이지 필요 [김영은]
	o 관리자 페이지 없이 글쓰기 버튼을 관리에게 보이게 함 (+공지사항,1:1 문의 부분) [이규황]
	o 검색시 유저탭은 projectDetailPage에 있는 제작자 표시 방식(카드)로 출력 [김호경]
	o 검색 결과 없음 페이지 필요 & 하단에는 추천 펀딩 띄우기 [전완철]
	o mypage : 신규프로젝트 신청하기 연결 필요 [고영은]
	o funding 찜하기 버튼 div 분리 필요 & 체크박스 (z-index) [한승훈]
	
2022.10.31 :
			테스트용  아이디 : purplaying@gmail.com 비밀번호 : 01110111 
			로그인 구현 - 희라
            DB 연결
             
2022.10.26 : 	<마감> 10.27(목)
				[미정] projectDetailPage에서 리워드 선택 후 펀딩하기 버튼 위에 선택 한 리워드 출력 & 						수량 선택 & 리워드 내용 드롭다운 필요
				--------------------------------------
				JSP 작성시 <!--메인 컨테이너--> 윗부분, 아래 <footer> 이후 삭제
             	이규황 : 1대 1문의 2,3페이지 링크 연결, signup 페이지 jsp 변환
             	이희라 : CSS, 헤더 & 푸터 분리
              	김호경 : paymentCompleted CSS 합치기
              	한승훈 : 1대 1문의, inquiry(관련), serviceCenter JSP 변환, 
              			1대 1문의 merge에서 탭 CSS 변경
              	김영은 : payment JSP 변환
              	양승민 : projectDetailpage JSP 변환
              	
              	
2022.10.24 : [한승훈] 없는페이지(고객센터 admin페이지 ppt - p69,p73) 알림-문의바로가기- {답변확인페이지}
             [이희라] 마이,설정페이지-서브탭
             [?] Admin전용 페이지(문의답변,공지사항게시)
             [김영은] 공유하기 모달
             [이희라] projectDetailPage 썸네일 1장만 카로셀x
             [김영은] payment 폼 정렬, paymentCompleted 폼정렬
             [이규황] 1대1 문의 페이지 연결 확인
             [김호경] {projectRegister->리워드구성 카드} -> paymentCompleted
             [...] 리워드 갯수제한 - 슈퍼얼리버드 : 4개, 얼리버드 : 4개 (필터로 표시)
             [...] 메인 장르 카테고리 : 3개 
             [양승민] 이미지,아이콘 리소스
             미정 ///////////////////////////////////////////////////
             메인페이지 아이템 노출 : 슬라이드(3개씩)
             장르페이지 : 스크롤시 자동으로 다음아이템 노출
             페이지를 찾을 수 없습니다.(예외 페이지) - 2022.10.25 희라 작성

             ※github branch이름 Modify-1에 커밋하고 수요일에 모여서 Main branch에 푸시※
             if (충돌) {
                branch 파일명 변경후 커밋
             }

2022.10.18 : 회원가입 - 모달창, 체크박스(전체동의 스크립트 포함)
             소셜로그인(카카오,네이버) - 구글은 아직..
             아이디 비밀번호찾기 - alret >> 모달창 구현

2022.10.17 : 깃 커밋
</pre>
