(function(_, angular) {
  function GlobalController(notifier) {
    this.notifier = notifier;
  }

  var fn = GlobalController.prototype,
      app = angular.module('global/controller', [
        'global/notifier'
      ]);

  app.controller('GlobalController', [
    'notifier', GlobalController
  ]);
})(window._, window.angular);
