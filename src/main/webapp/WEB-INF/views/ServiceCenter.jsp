<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- meta태그, CSS, JS, 타이틀 인클루드  -->
<%@ include file="meta.jsp"%>
</head>

<body>
	<%@ include file="header.jsp"%>
 
    <!--메인 컨테이너 -->
    <section>
      <!-- 프로젝트 작성 페이지 탭 -->
      <div class="container col-8">
        <h3>1 : 1 문의 등록</h3>
        <div class="form-control mb-3 px-4">
          <div class="row py-3">
            <textarea class="form-control" placeholder="제목을 입력하세요​" style="resize: none;"></textarea>
          </div>
          <div class="row" style="height: 500px;">
              <textarea class="form-control" placeholder="내용을 입력하세요​" style="resize: none;"></textarea>
          </div>
          <div class="row">
            <div class="col-10 text-end">
              <p>공개 여부</p>
            </div>
            <div class="col-2 text-end">
          
              <div class="form-check">
                <input class="form-check-input" name="flexRadioDefault" type="radio">
                <label>공개</label>
              </div>
              <div class="form-check">
                <input class="form-check-input" name="flexRadioDefault" type="radio" >
                <label>비공개</label>
              </div>
            </div>
          </div>
          <div class="text-end">
            <button class="btn btn-primary px-4">취 소</button>
            <button class="btn btn-primary px-4" onclick="location.href='1대1문의(merge).html?'">게 시</button>
          </div>
        </div>
      </div>

      <!-- Bootstrap core JavaScript
    ================================================== -->
      <!-- Placed at the end of the document so the pages load faster -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
      <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
      <!----------------------------------------------------------------------------------------------->

    </section>

  	<!--푸터 인클루드-->
	<%@ include file="footer.jsp"%>
  <script src="assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>