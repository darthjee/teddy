(function(_) {
  function Deferred() {
    this.successes = [];
  }

  var fn = Deferred.prototype;

  fn.then = function(callback) {
    this.successes.push(callback);
  };

  fn.resolve = function() {
    var args = arguments;

    _.each(this.successes, function(f) {
      f.apply(window, args);
    });
  };

  window.Deferred = Deferred;
}(_));
