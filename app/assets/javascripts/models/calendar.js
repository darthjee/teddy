(function(_, angular) {
  function Calendar(calendar, dayBuilderFactory) {
    _.extend(this, calendar);

    this.firstDate = new Date(calendar.firstDate);
    this.lastDate = new Date(calendar.lastDate);
    this.beginningOfWeek = this.firstDate.beginningOfWeek();
    this.dayBuilderFactory = dayBuilderFactory;
    this.weeks = this._calculateWeeks();

    _.bindAll(this, '_buildWeek');

    this._buildCalendar();
  }

  var module = angular.module('calendar/calendar', ['calendar/day_builder']),
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
    firstDay = this.beginningOfWeek.addDays(week * 7);
    var builder = this.dayBuilderFactory.build(firstDay);

    return _.times(7, builder.build);
  };
  
  Calendar.Factory = function(dayBuilderFactory) {
    return {
      build: function(json) {
        return new Calendar(json, dayBuilderFactory);
      }
    };
  };

  window.Calendar = Calendar
  module.factory('Calendar', ['DayBuilder', Calendar.Factory]);
}(window._, window.angular));
