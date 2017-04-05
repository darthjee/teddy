(function(_, angular) {
  function CalendarIndexController(notifier, requester) {
    this.requester = requester;
    this.notifier = notifier;

    _.bindAll(this, '_setData');

    this.request();
  }

  var fn = CalendarIndexController.prototype,
      app = angular.module('calendar/index', [
        'global/generic_requester', 'global/notifier'
      ]);

  fn.request = function() {
    var promise = this.requester.request();
    promise.then(this._setData);
  };

  fn._setData = function(response) {
    this.start = Date.fromString(response.data.start);
    this.end = Date.fromString(response.data.end);
  };

  app.controller('CalendarIndexController', [
    'notifier', 'generic_requester',
    CalendarIndexController
  ]);
})(window._, window.angular);

