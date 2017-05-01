(function(_, angular) {
  function CalendarIndexController(notifier) {
    this.notifier = notifier;
  }

  var fn = CalendarIndexController.prototype,
      app = angular.module('calendar/index', [
        'global/notifier'
      ]);

  app.controller('CalendarIndexController', [
    'notifier', CalendarIndexController
  ]);
})(window._, window.angular);

