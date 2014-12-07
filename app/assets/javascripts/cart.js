$(function() {

  if($('.cart').length > 0) {
    $('.gift-options').on('blur', 'textarea', function () {
        var value = encodeURIComponent($(this).val());
        var shopify_url = $('.cart-check-out').attr('href');
        shopify_url += "&note=" + value;
        $('.cart-check-out').attr('href', shopify_url);
        console.log(shopify_url);
    });
  }


});