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
})(Date, window._);

