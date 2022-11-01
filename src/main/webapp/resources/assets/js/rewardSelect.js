/**
 * projectDetail.jsp 페이지 
 * 리워드 선택시, select 메뉴 선택
 */

 function rewardSelect(item){-

    document.getElementById("rewardSelect").value = item;
    
    /*버튼 클릭시 원하는 위치로 스크롤 이동 JS */
    $(".card .card-body button").click(function(event){         
        event.preventDefault();
        $('html,body').animate({scrollTop:$("#total-amount").offset().top}, 500);
    });

    
}