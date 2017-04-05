(function(fn, _, undefined) {
  fn.fromString = function(string) {
    var [year, month, day] = _.map(string.split('-'), function(s) {
      return Number.parseInt(s);
    });
    return new Date(year, month-1, day);
  };
})(Date, window._);

