(function(_, angular, CalendarModule) {
  function Calendar(calendar) {
    _.extend(this, calendar);

    this.firstDate = new Date(calendar.firstDate);
    this.lastDate = new Date(calendar.lastDate);
    this.beginningOfWeek = this.firstDate.beginningOfWeek();
    this.payments = calendar.payments;
    this.weeks = this._calculateWeeks();

    _.bindAll(this, '_buildWeek');

    this._buildCalendar();
  }

  var module = angular.module('calendar/calendar', []),
      fn = Calendar.prototype;

  fn._calculateWeeks = function() {
    start = this.beginningOfWeek;
    end = this.lastDate.endOfWeek().addDays(1);
    return start.weeksUntil(end);
  };

  fn._buildCalendar = function() {
    this.rows = _.times(this.weeks, this._buildWeek);
  };

  fn._buildWeek = function(week) {
    firstDay = this.beginningOfWeek;

    return _.times(7, function(weekDay) {
      date = firstDay.addDays(week * 7 + weekDay)
      return {
        day: date.getDate()
      }
    });
  };
  
  Calendar.Factory = function() {
    return new Calendar();
  }

  CalendarModule.Calendar = Calendar;
  
  module.factory('Calendar', [Calendar.Factory]);
}(window._, window.angular, window.Calendar));
