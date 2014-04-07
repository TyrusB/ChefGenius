$(function() {

  $('.reg').click(function(event) {
    event.preventDefault();
    if ( $( ".signin" ).is( ":hidden" ) ) {
      $( ".signin" ).slideDown( "slow" );
    } else {
      $( ".signin" ).slideUp('slow');
    }
  });

  $('.fb').click(function(event) {
    event.preventDefault();
  });
});


// $(function() {

//   $('.reg').click(function(event) {
//     event.preventDefault();
//     $('.signin').toggleClass('hidden');
//   });

//   $('.fb').click(function(event) {
//     event.preventDefault();
//   });
// });

