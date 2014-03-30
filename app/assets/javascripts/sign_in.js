$(function() {

  $('.reg').click(function(event) {
    event.preventDefault();
    $('.signin').toggleClass('hidden');
  });

  $('.fb').click(function(event) {
    event.preventDefault();
  });
});