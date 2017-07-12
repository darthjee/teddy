(function(_, angular, CalendarModule) {
  function DayBuilder(firstDay) {
    this.firstDay = firstDay;
    _.bindAll(this, 'build');
  }

  var fn = DayBuilder.prototype;

  fn.build = function(weekDay) {
    date = this.firstDay.addDays(weekDay)
    return {
      day: date.getDate()
    }
  };

  CalendarModule.DayBuilder = DayBuilder;
}(window._, window.angular, window.Calendar));
