<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <!-- meta태그, CSS, JS, 타이틀 인클루드  -->
 <%@ include file ="meta.jsp" %>
 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 아래 제이쿼리는 1.0이상이면 원하는 버전을 사용하셔도 무방합니다. -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
</head>
<body>
  <!--헤더 인클루드-->
   <%@ include file ="header.jsp" %>
   <!--메인 컨테이너 -->
   <section>
   <button onclick="requestPay()">결제하기</button>
  <script>
    IMP.init("imp78380323"); 
    
    IMP.certification({ // param
        merchant_uid: "ORD20180131-0000011", // 주문 번호
      }, function (rsp) { // callback
        if (rsp.success) {
        	 alert("인증성공");
        } else {
        	 alert("인증 실패");
        }
      });
    
    function requestPay() {
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "html5_inicis",
          pay_method: "card",
          merchant_uid: "ORD20180131-0000011",
          name: "노르웨이 회전 의자",
          amount: 64900,
          buyer_email: "gildong@gmail.com",
          buyer_name: "홍길동",
          buyer_tel: "010-4242-4242",
          buyer_addr: "서울특별시 강남구 신사동",
          buyer_postcode: "01181"
      }, function (rsp) { // callback
          if (rsp.success) {
              
              // 결제 성공 시 로직,
              alert("성공");
              
          } else {
              
              // 결제 실패 시 로직,
               alert("실패");
             
          }
      });
    }
 
  </script>
  </section>
   <!--푸터 인클루드-->
  <%@ include file ="footer.jsp" %>
</body>
</html>