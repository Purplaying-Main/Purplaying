for(let i = 0; i < $('#nextBtn').length; i++){
  $('#nextBtn').eq(i).on('click', function(){
    $('#nextBtn').removeClass('active');
    $('#v-pills-tab01').removeClass('show');
    $('#v-pills-tab01').removeClass('active');
    $('#nextBtn').eq(i).addClass('active');
    $('#v-pills-tab01').eq(i).removeClass('show');
    $('#v-pills-tab01').eq(i).removeClass('active');
  })
}