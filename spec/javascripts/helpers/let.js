(function() {
  function LetConfig(parentSuite) {
    this.memorized = {};

    if (parentSuite) {
      _.extend(
        this.memorized,
        parentSuite.getLetConfig().memorized
      );
    }
  }

  var fn = LetConfig.prototype,
      enhancer;

  enhancer = {
    let: function (name, callback) {
      var config = this.getLetConfig();

      config.set(name, callback);
    },
    getLetConfig: function() {
      if (! this.letConfig) {
        this.letConfig = new LetConfig(this.parentSuite);
      }
      return this.letConfig;
    },
    values: function() {
      return this.getLetConfig().build();
    }
  }

  fn.set = function(key, callback) {
    this.memorized[key] = callback;
  };

  fn.build = function() {
    var values = {};

    for (key in this.memorized) {
      values[key] = this.memorized[key]();
    }

    return values;
  };

  function enhance(suite) {
    _.extend(suite.constructor.prototype,
      enhancer
    );
  };

  window.enhance = enhance;
}())
