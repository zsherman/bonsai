$(function() {

  if($('.box-page').length) {
    console.log('running');
    $('.product-variant').click(function(e) {
      $(this).find('input').prop("checked", true);
    });
  }


});