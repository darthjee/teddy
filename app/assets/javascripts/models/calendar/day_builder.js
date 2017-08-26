(function(_, angular) {
  function DayBuilder(firstDay) {
    this.firstDay = firstDay;
    _.bindAll(this, 'build');
  }

  var module = angular.module('calendar/day_builder', []),
      fn = DayBuilder.prototype;

  fn.build = function(weekDay) {
    date = this.firstDay.addDays(weekDay);
    return {
      day: date.getDate()
    }
  };
  
  DayBuilder.Factory = function() {
    return {
      build: function(firstDay) {
        return new DayBuilder(firstDay);
      }
    };
  };

  window.Calendar.DayBuilder  = DayBuilder;
  module.factory('DayBuilder', [DayBuilder.Factory]);
}(window._, window.angular));
