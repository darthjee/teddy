(function(clazz, _, undefined) {
  clazz.fromString = function(string) {
    var [year, month, day] = _.map(string.split('-'), function(s) {
      return Number.parseInt(s);
    });
    return new Date(year, month-1, day);
  };

  var fn = clazz.prototype;

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
})(Date, window._);

