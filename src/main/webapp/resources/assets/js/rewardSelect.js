/**
 * projectDetail.jsp 페이지 
 * 리워드 선택시, select 옵션과 연동 & 상단으로 스크롤
 */

 function rewardSelect(item){

    document.getElementById("rewardSelect").value = item;
    
    let ml = document.getElementById("move").offsetLeft;
    let mt = document.getElementById("move").offsetTop;
    window.scrollTo({top:mt, left: ml, behavior: "smooth"});
    
}