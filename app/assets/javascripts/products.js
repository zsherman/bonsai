$(function() {

  if($('.box-page').length) {
    console.log('running');
    $('.product-variant').click(function(e) {
      $(this).find('input').prop("checked", true);
    });
  }

  $('.box-info').scrollspy({
      min: $('.box-info').offset().top-15,
      max: 9999999,
      onEnter: function(element, position) {
        $('.box-info').addClass('locked');
      },
      onLeave: function(element, position) {
        $('.box-info').removeClass('locked');
      }
  });

});