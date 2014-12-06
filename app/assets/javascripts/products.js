$(function() {

  if($('.box-page').length) {
    console.log('running');
    $('.product-variant').click(function(e) {
      $(this).find('input').prop("checked", true);
    });
  }

  $('.box-info').scrollspy({
      min: $('.box-info').offset().top-15,
      max: 3500,
      onEnter: function(element, position) {
        $('.box-info').addClass('locked');
        $('.box-info').removeClass('collapsed');
      },
      onLeave: function(element, position) {
        if(position.top > 3500) {
          $('.box-info').addClass('locked collapsed');
        } else {
          $('.box-info').removeClass('locked');
          $('.box-info').removeClass('collapsed');
        }
      }
  });

});