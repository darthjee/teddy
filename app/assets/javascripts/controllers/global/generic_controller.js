(function(_, angular) {
  function GenericController(requester) {
    this.requester = requester;

    _.bindAll(this, '_setData');

    this.request();
  }

  var fn = GenericController.prototype,
      app = angular.module('global/generic_controller', [
        'global/generic_requester'
      ]);

  fn.request = function() {
    var promise = this.requester.request();
    promise.then(this._setData);
  };

  fn._setData = function(response) {
    this.data = response.data;
  };

  app.controller('GenericController', [
    'generic_requester',
    GenericController
  ]);
})(window._, window.angular);

