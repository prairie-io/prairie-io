(function() {
  "use strict";

  App.showProgress = function(goalCompletion) {
    $('.phase-one #progressbar div').css('width', goalCompletion)
  }

})();
