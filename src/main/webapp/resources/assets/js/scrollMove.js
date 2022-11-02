/**
 * 버튼 클릭시 원하는 포인트(id값)로 스크롤 이동 JS
 */

 $(document).ready(function(){
  var $menu = $('.card .card-body button'),
  $contents = $('#total-amount')  //'모인금액' 포인트로 이동
  $(window).scroll(function(){
  var scltop = $(window).scrollTop();
  $.each($contents, function(idx, item){
  var $target   = $contents.eq(idx),
  i = $target.index(),
  targetTop = $target.offset().top;
  if (targetTop <= scltop) {
  $menu.removeClass('on');
  $menu.eq(idx).addClass('on');
  }
  if (!(200 <= scltop)) {
  $menu.removeClass('on');
  }
  })
  });
 /* 탭 클릭 */
  $('.card .card-body button').on('click',function(){
  var anchorId = $(this).attr('data-anchor');
  // 스크롤 이동
  scroll_to_anchor_tab(anchorId);
  });
 // 퀵배너 스크롤
  $(window).scroll(function(){
  var quickPos = $('.card').offset().top;
  var winPos = $(window).scrollTop();
  if( winPos > quickPos ) $('.card .card-body').addClass('fixed');
  else $('.card .card-body').removeClass('fixed');
  });
  });
  // 탭 이동 - 부드러운 스크롤
  function scroll_to_anchor_tab(anchor_id,speed) {
  if( !speed ) var speed = 'slow';
  var a_tag = $("#"+anchor_id);
  if(a_tag.length > 0){
  $('html, body').animate({
  scrollTop: a_tag.offset().top - $('').height() -  $('').height() // 상단에 특정 위치를 제외하고 스크롤할때 해당 이름 작성
  }, speed);
  }
  }