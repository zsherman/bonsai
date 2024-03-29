// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require landing
//= require modal
//= require sweet-alert
//= require walkway
//= require happy
//= require course
//= require scrollspy
//= require jquery.ajaxchimp
//= require cart
//= require analytics
//= require_tree .
$(function() {
  // Initialize foundation
  $(document).foundation();

  // Initialize responsive nav
  var navigation = responsiveNav(".nav-collapse", {
    animate: true,                    // Boolean: Use CSS3 transitions, true or false
    transition: 284,                  // Integer: Speed of the transition, in milliseconds
    label: "Menu",                    // String: Label for the navigation toggle
    insert: "after",                  // String: Insert the toggle before or after the navigation
    customToggle: "",                 // Selector: Specify the ID of a custom toggle
    closeOnNavClick: false,           // Boolean: Close the navigation when one of the links are clicked
    openPos: "relative",              // String: Position of the opened nav, relative or static
    navClass: "nav-collapse",         // String: Default CSS class. If changed, you need to edit the CSS too!
    navActiveClass: "js-nav-active",  // String: Class that is added to <html> element when nav is active
    jsClass: "js",                    // String: 'JS enabled' class which is added to <html> element
    init: function(){},               // Function: Init callback
    open: function(){},               // Function: Open callback
    close: function(){}               // Function: Close callback
  });

  $('#new_user').isHappy({
      fields: {
        // reference the field you're talking about, probably by `id`
        // but you could certainly do $('[name=name]') as well.
        '#user_first_name': {
          required: true,
          message: 'First name required',
          test: happy.minLength,
          arg: 2
        },
        '#user_last_name': {
          required: true,
          message: 'Last name required',
          test: happy.minLength,
          arg: 2
        },
        '#user_email': {
          required: true,
          message: 'Please enter a valid email address',
          test: happy.email
        },
        '#user_password': {
          required: true,
          message: '8 Character Min',
          test: happy.minLength,
          arg: 8
        },
        '#user_password_confirmation': {
          required: true,
          message: 'Passwords Must Match',
          test: happy.equal,
          arg: ''
        }
      },
      happy: function() {
        console.log('happy');
      }
  });

  $('#photo-grid').photosetGrid({
    // Set the gutter between columns and rows
      gutter: '5px',
      // Wrap the images in links
      highresLinks: true,
      // Asign a common rel attribute
      rel: 'print-gallery',

      onInit: function(){},
      onComplete: function(){}
  });


  if($('#mc-embedded-subscribe-form').length > 0) {

    $('#mc-embedded-subscribe-form').scrollspy({
        min: $('footer').offset().top-500,
        max: 99999,
        onEnter: function(element, position) {
          $('.email-modal-wrapper .md-trigger').click();
        },
        onLeave: function(element, position) {

        }
    });

    $('#mc-embedded-subscribe-form').ajaxChimp();
  }

  if($('.catalogue-page').length > 0) {

    $('#mc-embedded-subscribe-form').scrollspy({
        min: $('footer').offset().top-500,
        max: 99999,
        onEnter: function(element, position) {
          $('.email-modal-wrapper .md-trigger').click();
        },
        onLeave: function(element, position) {

        }
    });

    function removeEmailModal(resp) {
      if (resp.result === 'success') {
        console.log("success")
        setTimeout(function(e) {
          $('.email-modal-wrapper').remove();
          $('.md-overlay').hide();
        }, 3500);
      }
    }

    $('#mc-embedded-subscribe-form').ajaxChimp({
      callback: removeEmailModal
    });
  }

});
