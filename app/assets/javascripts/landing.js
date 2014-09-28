$(function() {

  if(document.getElementById('large-header')) {
    var width, height, largeHeader, target, animateHeader = true;
    var navHeight = document.getElementById('top-nav').offsetHeight;

    // Main
      initHeader();
      addListeners();

    function initHeader() {
      width = window.innerWidth;
      height = window.innerHeight - 64 // Nav height;
      target = {x: width/2, y: height/2};

      largeHeader = document.getElementById('large-header');
      largeHeader.style.height = height+'px';
    }

    function addListeners() {
      window.addEventListener('resize', resize);
    }

    function resize() {
      width = window.innerWidth;
      height = window.innerHeight - 64 // Nav height;
      largeHeader.style.height = height+'px';
    }
  }

});