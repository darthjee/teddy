(function(_, angular) {
  function CalendarIndexController(notifier, requester) {
    this.requester = requester;
    this.notifier = notifier;

    _.bindAll(this, '_setData', '_buildWeek');

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
    this.beginningOfWeek = this.start.beginningOfWeek();
    this.weeks = this._calculateWeeks();

    this._buildCalendar();
  };

  fn._calculateWeeks = function() {
    var start = this.beginningOfWeek,
        end = this.end.endOfWeek().addDays(1);
    return start.weeksUntil(end);
  };

  fn._buildCalendar = function() {
    this.calendar = _.times(this.weeks, this._buildWeek);
  };

  fn._buildWeek = function(week) {
    var firstDay = this.beginningOfWeek;

    return _.times(7, function(weekDay) {
      var date = firstDay.addDays(week * 7 + weekDay);
      return {
        day: date.getDate()
      }
    });
  };

  app.controller('CalendarIndexController', [
    'notifier', 'generic_requester',
    CalendarIndexController
  ]);
})(window._, window.angular);

