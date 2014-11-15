$(function() {

  if(document.getElementById('large-header')) {
    var width, height, largeHeader, target, animateHeader = true;
    //var navHeight = document.getElementById('top-nav').offsetHeight;
    var navHeight = 60;

    // Main
      initHeader();
      addListeners();

    function initHeader() {
      width = window.innerWidth;
      height = window.innerHeight - navHeight // Nav height;
      target = {x: width/2, y: height/2};

      largeHeader = document.getElementById('large-header');
      largeHeader.style.height = height+'px';
    }

    function addListeners() {
      window.addEventListener('resize', resize);
    }

    function resize() {
      width = window.innerWidth;
      height = window.innerHeight - navHeight // Nav height;
      largeHeader.style.height = height+'px';
    }
  }

  // Add scrollspy
  setTimeout(function() {
    var svg = new Walkway('.step svg');
    svg.draw(function() {});
  }, 2000);

});