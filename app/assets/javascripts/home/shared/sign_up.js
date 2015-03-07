(function() {
  "use strict";

  $('form#new-user').on('ajax:success', function (e, data, status, xhr) {
    $(this).html("<p class='success'>Thanks for the <i class='fa fa-heart'></i><br>Go check your email and confirm to get started!</p>");
  }).on('ajax:error', function (e, xhr, status, error) {
    $('form#new-user p.error').text('Oh noes! That email ' + xhr.responseJSON['email'] + '.');
  });

})();
