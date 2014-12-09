// Reference http://wistia.com/doc/construct-an-embed-code
$(function() {

  if($('.course-page').length) {

    function getVideo(url) {
      // Clear existing video
      $('.video-container').empty();
      // Set up the request url for Wistia
      var wistiaUrl = "http://fast.wistia.net/oembed?url=";
      wistiaUrl += encodeURIComponent(url);
      // Grab the video from Wistia's API & Insert it
      // $.get(wistiaUrl).done(function(resp) {
      //   $('.video-container').html(resp.html);
      // });

      $.ajax({
        type: 'GET',
        url: wistiaUrl,
        data: {},
        contentType: 'jsonp',
        dataType: 'jsonp',
        crossDomain: 'true',
        success: function (resp) {
         $('.video-container').html(resp.html);
        }
      });
    }

    // Initialize first video
    setTimeout(function() {
      $('.lesson').first().click();
    }, 1000)

    // Handle video clicks
    $('.lesson').on('click', function(e) {
      // Switch to that lesson
      $('.selected').removeClass('selected');
      $(this).addClass('selected');
      var videoUrl = $(this).data('video-url');
      var lessonTitle = $(this).data('lesson-title');
      var videoContent = $(this).data('video-content');
      currentLesson = $(this).data('lesson-id');
      getVideo(videoUrl);
      $('.description-container h3').text(lessonTitle);
      $('.description-container p').text(videoContent);
    });

    $('.next').on('click', function(e) {
      $('.selected').next('.lesson').click();
      // Go to next lesson
      // currentLesson += 1;
      // var next = $("li[data-lesson-id='" + currentLesson +"']");
      // getVideo(next.data('video-url'));
      // var videoUrl = next.data('video-url');
      // var lessonTitle = next.data('lesson-title');
      // var videoContent = next.data('video-content');
      // $('.description-container h3').text(lessonTitle);
      // $('.description-container p').text(videoContent);
    });

    $('.previous').on('click', function(e) {
      $('.selected').prev('.lesson').click();
      // Go to next lesson
      // currentLesson -= 1;
      // var previous = $("li[data-lesson-id='" + currentLesson +"']");
      // getVideo(previous.data('video-url'));
      // var videoUrl = previous.data('video-url');
      // var lessonTitle = previous.data('lesson-title');
      // var videoContent = previous.data('video-content');
      // $('.description-container h3').text(lessonTitle);
      // $('.description-container p').text(videoContent);
    });








  }

});