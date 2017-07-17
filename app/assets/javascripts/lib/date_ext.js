(function(clazz) {
  var fn = clazz.prototype;

  clazz.fromString = function(string) {
    [year, month, day] = _.map(string.split('-'), function(s) {
      return Number.parseInt(s);
    });
    return new Date(year, month-1, day);
  };

  clazz.DAYMILISECONDS = 24 * 3600 * 1000;

  fn.addDays = function(days) {
    var year = this.getFullYear(),
        month = this.getMonth(),
        day = this.getDate() + days;

    return new Date(year, month, day);
  };

  fn.beginningOfWeek = function() {
    var delta = - this.getDay();
    return this.addDays(delta);
  };

  fn.endOfWeek = function() {
    var delta = 6 - this.getDay();
    return this.addDays(delta);
  };

  fn.daysUntil = function(date) {
    var days;

    if (this.isAfter(date)) {
      days = - date.daysUntil(this);
    } else {
      days = ((date - this) / clazz.DAYMILISECONDS);
    }
    return days;
  };

  fn.isAfter = function(date) {
    return this > date;
  }

  fn.weeksUntil = function(date) {
    var days = this.daysUntil(date);

    return Math.ceil((days)/ 7);
  };
}(Date));

