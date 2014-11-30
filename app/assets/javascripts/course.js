// Reference http://wistia.com/doc/construct-an-embed-code
$(function() {

  if($('.course-page')) {

    function getVideo(url) {
      // Clear existing video
      $('.video-container').empty();
      // Set up the request url for Wistia
      var wistiaUrl = "http://fast.wistia.net/oembed?url=";
      wistiaUrl += encodeURIComponent(url);
      // Grab the video from Wistia's API & Insert it
      $.get(wistiaUrl).done(function(resp) {
        $('.video-container').html(resp.html);
      });
    }

    // Initialize first video
    getVideo(course.lessons[0].video.url);

    // Handle video clicks
    $('.lesson').on('click', function(e) {
      // Switch to that lesson
      var videoUrl = $(this).data('video-url');
      var lessonTitle = $(this).data('lesson-title');
      var videoContent = $(this).data('video-content');
      currentLesson = $(this).data('lesson-id');
      getVideo(videoUrl);
      $('.description-container h3').text(lessonTitle);
      $('.description-container p').text(videoContent);
    });

    $('.next').on('click', function(e) {
      // Go to next lesson
      currentLesson += 1;
      var next = $("li[data-lesson-id='" + currentLesson +"']");
      getVideo(next.data('video-url'));
      var videoUrl = next.data('video-url');
      var lessonTitle = next.data('lesson-title');
      var videoContent = next.data('video-content');
      $('.description-container h3').text(lessonTitle);
      $('.description-container p').text(videoContent);
    });

    $('.previous').on('click', function(e) {
      // Go to next lesson
      currentLesson -= 1;
      var previous = $("li[data-lesson-id='" + currentLesson +"']");
      getVideo(previous.data('video-url'));
      var videoUrl = previous.data('video-url');
      var lessonTitle = previous.data('lesson-title');
      var videoContent = previous.data('video-content');
      $('.description-container h3').text(lessonTitle);
      $('.description-container p').text(videoContent);
    });








  }

});