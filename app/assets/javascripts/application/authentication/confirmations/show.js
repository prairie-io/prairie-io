(function() {
  "use strict";

  $('form#set-password').on('ajax:success', function (e, data, status, xhr) {
    window.location.replace(data.redirect_link);
  }).on('ajax:error', function (e, xhr, status, error) {
    $('form#set-password p.error').text('Oh noes! That password ' + xhr.responseJSON['password'] + '.');
  });

})();
