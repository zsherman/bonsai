// A simple SeatGeek jquery plugin for beautiful overlays
$(function() {

  var overlay = $('.md-overlay');
  var modal;
  var close = $('.md-close');

  function removeModal( hasPerspective ) {
    modal.removeClass('md-show');
    overlay.removeClass('md-show');
  }

  function removeModalHandler() {
    removeModal();
  }

  $('.md-trigger').on( 'click', function(ev) {
    var id = $(ev.target).data('id');
    modal = $(".md-modal[data-id='" + id +"']");
    overlay.addClass('md-show');
    modal.addClass('md-show');
    overlay.on( 'click', removeModalHandler );
  });

  close.on( 'click', function( ev ) {
    ev.stopPropagation();
    removeModalHandler();
  });

  $('.md-content input').on('focus', function () {
      $(this).parent().addClass('active');
  });

  $('.md-content input').on('blur', function() {
    $(this).parent().removeClass('active');
  });

  $('.md-content .btn').click(function(e) {
    var target = $(this);
    target.addClass('btn-activated');
    if(target.hasClass('twitter')) {
      window.location = '/users/auth/twitter';
    }
    setTimeout( function() { target.removeClass('btn-activated'); }, 1000 );
  })

});


//   Blanket = function(elem, options) {
//     this.elem = elem;
//     this.$elem = $(elem);
//     this.options = options;
//   };

//   Blanket.prototype = {

//     defaults: {
//       backgroundColor: "white",
//       zIndex: "1000",
//       openElement: " ",
//       closeElement: " "
//     },

//     init: function() {
//       this.config = $.extend({}, this.defaults, this.options);
//       this.open();
//     },

//     open: function() {
//       this.$elem.addClass('open blanket');
//       $("body").css('overflow', 'hidden');
//       // remove display none
//       // add class open
//       // add background overflow hidden
//     },

//     close: function() {
//       // remove background overflow hidden
//       // add closed class
//       $("body").css('overflow', 'auto');
//     },

//     bind: function() {
//       this.elem.delegate("li", "click", $.proxy(this.tabClick, this));
//     }

//   };

//   Blanket.defaults = Blanket.prototype.defaults;

//   $.fn.blanket = function(options) {
//     return this.each(function() {
//       // New Blanket Instance
//       new Blanket(this, options).init();

//       // Attach events for open and close elements
//       // $(this).mouseenter(function(){
//       //     $('body').append(element);
//       // });

//       // $(this).mouseleave(function(){
//       //     element.remove();
//       // });

//     });
//   };

//   window.Blanket = Blanket;