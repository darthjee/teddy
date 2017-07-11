(function(_, angular, Calendar) {
  module = angular.module('calendar/calendar', []);
  
  Calendar.Calendar = function(calendar) {
    _.extend(this, calendar);

    this.firstDate = new Date(calendar.firstDate);
    this.lastDate = new Date(calendar.lastDate);
    this.beginningOfWeek = this.firstDate.beginningOfWeek();
    this.payments = calendar.payments;
    this.weeks = this._calculateWeeks();

    _.bindAll(this, '_buildWeek');

    this._buildCalendar();
  }

  var fn = Calendar.Calendar.prototype;

  fn._calculateWeeks = function() {
    start = this.beginningOfWeek;
    end = this.lastDate.endOfWeek().addDays(1);
    return start.weeksUntil(end);
  };

  fn._buildCalendar = function() {
    this.calendar = _.times(this.weeks, this._buildWeek);
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
  
  Calendar.Calendar.Factory = function() {
    return new Calendar.Calendar();
  }
  
  module.factory('Calendar', [Calendar.Calendar.Factory]);
})(window._, window.angular, window.Calendar);
